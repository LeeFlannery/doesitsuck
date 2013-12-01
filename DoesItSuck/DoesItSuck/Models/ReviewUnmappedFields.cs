namespace DoesItSuck.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class Review
    {
        [NotMapped]
        public Arrangement Arrangement { get; set; }
    }
}