using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace DevOpsTrainingDotnet.Models
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<user> users { get; set; }
    }
}
