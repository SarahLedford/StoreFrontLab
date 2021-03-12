using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFrontLab.DATA.EF//.Metadata
{
    //TODO check all buttons in view

    #region Artist
    [MetadataType(typeof(ArtistMetadata))]
    public partial class Artist { }

    public class ArtistMetadata
    {
        //public int ArtistID { get; set; }

        [Required(ErrorMessage ="* Artist is required")]
        [Display(Name ="Artist")]
        [StringLength(50, ErrorMessage ="* Must not exceed 50 characters")]
        public string ArtistName { get; set; }
    }
    #endregion

    #region Category
    [MetadataType(typeof(CategoryMetadata))]
    public partial class Category { }

    public class CategoryMetadata
    {
        //public int CategoryID { get; set; }

        [Required(ErrorMessage ="* Category name required")]
        [StringLength(50, ErrorMessage ="* Must not exceed 50 characters")]
        [Display(Name ="Category")]
        public string CategoryName { get; set; }
    }
    #endregion

    #region MovieGenre
    [MetadataType(typeof(MovieGenreMetadata))]
    public partial class MovieGenre { }

    public class MovieGenreMetadata
    {

        //public int MovieGenreID { get; set; }

        [Required(ErrorMessage ="* Genre name required")]
        [StringLength(25, ErrorMessage ="* Must not exceed 25 characters")]
        [Display(Name ="Movie Genre")]
        public string MovieGenreName { get; set; }
    }
    #endregion

    #region MusicGenre
    [MetadataType(typeof(MusicGenreMetadata))]
    public partial class MusicGenre { }

    public class MusicGenreMetadata
    {

       // public int MusicGenreID { get; set; }

        [Required(ErrorMessage ="* Genre name required")]
        [Display(Name ="Music Genre")]
        [StringLength(25, ErrorMessage = "* Must not exceed 25 characters")]
        public string MusicGenreName { get; set; }
    }
    #endregion

    #region Product
    [MetadataType(typeof(ProductMetadata))]
    public partial class Product { }

    public class ProductMetadata
    {
       // public int ProdID { get; set; }

        [Required(ErrorMessage ="* Name is required")]
        [StringLength(50, ErrorMessage ="* Must not exceed 50 characters")]
        [Display(Name ="Title")]
        public string ProdName { get; set; }

        [Required(ErrorMessage = "* Category is required")]
        [Display(Name = "Category")]
        public int CategoryID { get; set; }

        [Required(ErrorMessage = "* Status is required")]
        [Display(Name = "Status")]
        public int StatusID { get; set; }

        [Required(ErrorMessage = "* Price is required")]
        public decimal Price { get; set; }

        [Display(Name = "Artist")]
        public Nullable<int> ArtistID { get; set; }

        [StringLength(500, ErrorMessage = "* Must not exceed 500 characters")]
        public string Description { get; set; }

        [Display(Name = "Movie Studio")]
        public Nullable<int> StudioID { get; set; }

        [Display(Name = "Movie Genre")]
        public Nullable<int> MovieGenreID { get; set; }

        [Display(Name = "Music Genre")]
        public Nullable<int> MusicGenreID { get; set; }

        [StringLength(50, ErrorMessage = "* Must not exceed 50 characters")]
        public string ProductImage { get; set; }
    }
    #endregion

    #region Status
    [MetadataType(typeof(StatusMetadata))]
    public partial class Status { }

    public class StatusMetadata
    {
        //public int StatusID { get; set; }
        [Required(ErrorMessage ="* Status name is required")]
        [StringLength(25, ErrorMessage ="* Must not exceed 25 characters")]
        [Display(Name ="Status")]
        public string StatusName { get; set; }
    }
    #endregion

    #region Studio
    [MetadataType(typeof(StudioMetadata))]
    public partial class Studio { }

    public class StudioMetadata
    {
        //public int StudioID { get; set; }

        [Required(ErrorMessage ="* Studio name is required")]
        [StringLength(50, ErrorMessage ="* Must not exceed 50 characters")]
        [Display(Name ="Movie Studio")]
        public string StudioName { get; set; }
    }
    #endregion
}
