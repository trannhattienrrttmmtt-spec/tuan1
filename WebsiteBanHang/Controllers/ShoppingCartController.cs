using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using WebsiteBanHang.Extensions;
using WebsiteBanHang.Models;
using WebsiteBanHang.Repositories;

namespace WebsiteBanHang.Controllers
{
    public class ShoppingCartController : Controller
    {
        private const string CartSessionKey = "Cart";
        private readonly ApplicationDbContext _context;
        private readonly IProductRepository _productRepository;
        private readonly UserManager<ApplicationUser> _userManager;

        public ShoppingCartController(
            ApplicationDbContext context,
            UserManager<ApplicationUser> userManager,
            IProductRepository productRepository)
        {
            _context = context;
            _userManager = userManager;
            _productRepository = productRepository;
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddToCart(int productId, int quantity = 1)
        {
            if (User.IsInRole(SD.Role_Admin))
            {
                return Forbid();
            }

            var product = await _productRepository.GetByIdAsync(productId);
            if (product == null) return NotFound();

            var cartItem = new CartItem
            {
                ProductId = productId,
                Name = product.Name,
                Price = product.Price,
                Quantity = Math.Max(quantity, 1),
                ImageUrl = product.ImageUrl
            };

            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>(CartSessionKey) ?? new ShoppingCart();
            cart.AddItem(cartItem);
            HttpContext.Session.SetObjectAsJson(CartSessionKey, cart);

            TempData["Success"] = $"Đã thêm {product.Name} vào giỏ hàng.";
            return RedirectToAction("Index", "Home");
        }

        public IActionResult Index()
        {
            if (User.IsInRole(SD.Role_Admin))
            {
                return Forbid();
            }

            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>(CartSessionKey) ?? new ShoppingCart();
            return View(cart);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult RemoveFromCart(int productId)
        {
            if (User.IsInRole(SD.Role_Admin))
            {
                return Forbid();
            }

            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>(CartSessionKey);

            if (cart != null)
            {
                cart.RemoveItem(productId);
                HttpContext.Session.SetObjectAsJson(CartSessionKey, cart);
            }

            return RedirectToAction(nameof(Index));
        }

        [Authorize]
        public IActionResult Checkout()
        {
            if (User.IsInRole(SD.Role_Admin))
            {
                return Forbid();
            }

            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>(CartSessionKey);
            if (cart == null || !cart.Items.Any())
            {
                return RedirectToAction(nameof(Index));
            }

            return View(new Order());
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Checkout(Order order)
        {
            if (User.IsInRole(SD.Role_Admin))
            {
                return Forbid();
            }

            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>(CartSessionKey);
            if (cart == null || !cart.Items.Any())
            {
                return RedirectToAction(nameof(Index));
            }

            if (!ModelState.IsValid)
            {
                return View(order);
            }

            var user = await _userManager.GetUserAsync(User);
            if (user == null) return Challenge();

            order.UserId = user.Id;
            order.OrderDate = DateTime.Now;
            order.TotalPrice = cart.TotalPrice;
            order.OrderDetails = cart.Items.Select(item => new OrderDetail
            {
                ProductId = item.ProductId,
                Quantity = item.Quantity,
                Price = item.Price
            }).ToList();

            _context.Orders.Add(order);
            await _context.SaveChangesAsync();

            HttpContext.Session.Remove(CartSessionKey);
            return View("OrderCompleted", order.Id);
        }
    }
}
