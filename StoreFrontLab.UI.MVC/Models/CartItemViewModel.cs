using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StoreFrontLab.DATA.EF;
using System.ComponentModel.DataAnnotations;

namespace StoreFrontLab.UI.MVC.Models
{
    public class CartItemViewModel
    {
        [Range(1, int.MaxValue)]
        public int Qty { get; set; }
        public Product MediaItem { get; set; }

        public CartItemViewModel(int qty, Product mediaItem)
        {
            Qty = qty;
            MediaItem = mediaItem;
        }
    }
}