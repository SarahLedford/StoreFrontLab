using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StoreFrontLab.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "* Name is required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "* Email address is required")]
        [EmailAddress(ErrorMessage = "* Please enter a valid email address")]
        [Display(Name="Email")]
        public string EmailAddress { get; set; }

        [Required(ErrorMessage = "* Subject is required")]
        public string Subject { get; set; }

        [UIHint("MultilineText")]
        [Required(ErrorMessage = "* Message is required")]
        public string Message { get; set; }




    }//end class
}//namespace