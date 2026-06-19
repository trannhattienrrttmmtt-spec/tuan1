using Microsoft.EntityFrameworkCore;

namespace WebsiteBanHang.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Product>      Products      { get; set; }
        public DbSet<Category>     Categories    { get; set; }
        public DbSet<ProductImage> ProductImages { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<Product>()
                .Property(product => product.Price)
                .HasColumnType("decimal(18,2)");
        }
    }
}
