namespace WebsiteBanHang.Models
{
    public class ShoppingCart
    {
        public List<CartItem> Items { get; set; } = new();

        public int TotalQuantity => Items.Sum(item => item.Quantity);

        public decimal TotalPrice => Items.Sum(item => item.Price * item.Quantity);

        public void AddItem(CartItem item)
        {
            var existingItem = Items.FirstOrDefault(i => i.ProductId == item.ProductId);

            if (existingItem != null)
            {
                existingItem.Quantity += item.Quantity;
                return;
            }

            Items.Add(item);
        }

        public void RemoveItem(int productId)
        {
            Items.RemoveAll(item => item.ProductId == productId);
        }
    }
}
