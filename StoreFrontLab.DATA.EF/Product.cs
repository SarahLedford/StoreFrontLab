//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StoreFrontLab.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public int ProdID { get; set; }
        public string ProdName { get; set; }
        public int CategoryID { get; set; }
        public int StatusID { get; set; }
        public decimal Price { get; set; }
        public Nullable<int> ArtistID { get; set; }
        public string Description { get; set; }
        public Nullable<int> StudioID { get; set; }
        public Nullable<int> MovieGenreID { get; set; }
        public Nullable<int> MusicGenreID { get; set; }
        public string ProductImage { get; set; }
    
        public virtual Artist Artist { get; set; }
        public virtual Category Category { get; set; }
        public virtual MovieGenre MovieGenre { get; set; }
        public virtual MusicGenre MusicGenre { get; set; }
        public virtual Status Status { get; set; }
        public virtual Studio Studio { get; set; }
    }
}
