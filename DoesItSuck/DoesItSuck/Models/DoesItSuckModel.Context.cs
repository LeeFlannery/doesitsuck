﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoesItSuck.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DoesItSuckEntities : DbContext
    {
        public DoesItSuckEntities()
            : base("name=DoesItSuckEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Review> Review { get; set; }
        public DbSet<Review_Tag_Rel> Review_Tag_Rel { get; set; }
        public DbSet<Tag> Tag { get; set; }
    }
}