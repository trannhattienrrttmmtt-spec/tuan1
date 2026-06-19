using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using WebsiteBanHang.Models;

namespace WebsiteBanHang.Models
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Product>      Products      { get; set; }
        public DbSet<Category>     Categories    { get; set; }
        public DbSet<ProductImage> ProductImages { get; set; }
        public DbSet<Order>        Orders        { get; set; }
        public DbSet<OrderDetail>  OrderDetails  { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<Product>()
                .Property(product => product.Price)
                .HasColumnType("decimal(18,2)");

            builder.Entity<Order>()
                .Property(order => order.TotalPrice)
                .HasColumnType("decimal(18,2)");

            builder.Entity<OrderDetail>()
                .Property(detail => detail.Price)
                .HasColumnType("decimal(18,2)");
        }
    }
}
