using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFrontLab.UI.MVC.Models;

namespace StoreFrontLab.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        public ActionResult Index()
        {
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                //user either hasn't put anything in the cart, or removed all items, OR session expired
                //set cart to an empty object (can still send that to the view, unlike null)
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                //create a message about the empty cartUpdateCart               
                ViewBag.Message = "There are no items in your cart";
            }
            else
            {
                ViewBag.Message = null;//explicitly clears out ViewBag variable
            }

            return View(shoppingCart);
        }


        public ActionResult UpdateCart(int prodID, int qty)
        {
            //get the cart out of session and into a local variable
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //target the correct cartItem using BookID - then change the quantity
            shoppingCart[prodID].Qty = qty;

            //update session with new cart info
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

        public ActionResult RemoveFromCart(int id)
        {
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            shoppingCart.Remove(id);

            //if all items were removed, give user a message
            //This didn't work because 1) I'm using a redirectoaction and viewbag info will not persist
            //2) even if it did persist, we reassign the value for ViewBag.Message in the index action
            //if (shoppingCart.Count == 0)
            //{
            //    ViewBag.Message = "You've removed all items from your cart.";
            //}           

            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

    }//end class
}//end namespace