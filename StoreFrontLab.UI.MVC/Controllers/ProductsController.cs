using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using StoreFrontLab.DATA.EF;
using StoreFrontLab.UI.MVC.Models;
using StoreFrontLab.UI.MVC.Utilities;

namespace StoreFrontLab.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private VintageMediaStoreEntities db = new VintageMediaStoreEntities();

        // GET: Products
        public ActionResult Index()
        {
            
                return View(db.Products.ToList());            
        }

        public ActionResult GridProducts()
        {
            var products = db.Products;
            return View(products.ToList());
        }

        public ActionResult GridVinylFilter()
        {
            var vinyls = db.Products.Where(x => x.Category.CategoryName == "Record").ToList();

            return View(vinyls);
        }

        public ActionResult GridMovieFilter()
        {
            var movies = db.Products.Where(x => x.Category.CategoryName == "VHS" || x.Category.CategoryName == "LaserDisc").OrderBy(x => x.Category.CategoryName).ToList();

            return View(movies);
        }

        public ActionResult MovieFilter()
        {
            var movies = db.Products.Where(x => x.Category.CategoryName == "VHS" || x.Category.CategoryName == "LaserDisc").ToList();

            return View(movies);
        }

        public ActionResult VinylFilter()
        {
            var vinyls = db.Products.Where(x => x.Category.CategoryName == "Record").ToList();

            return View(vinyls);
        }

        [Authorize(Roles = "Admin, Employee")]
        [HttpGet]
        public PartialViewResult ProductsCreateAjax()
        {
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.StatusID = new SelectList(db.Statuses, "StatusID", "StatusName");
            ViewBag.ArtistID = new SelectList(db.Artists, "ArtistID", "ArtistName");
            ViewBag.StudioID = new SelectList(db.Studios, "StudioID", "StudioName");
            ViewBag.MovieGenreID = new SelectList(db.MovieGenres, "MovieGenreID", "MovieGenreName");
            ViewBag.MusicGenreID = new SelectList(db.MusicGenres, "MusicGenreID", "MusicGenreName");
            return PartialView();
        }

        [Authorize(Roles = "Admin, Employee")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Product product, HttpPostedFileBase productImage)
        {
            product.Category = db.Categories.Find(product.CategoryID);
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "NoImage.png";

                if (productImage != null)
                {
                    file = productImage.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    if (goodExts.Contains(ext.ToLower()) && productImage.ContentLength <= 4194304)
                    {
                        file = Guid.NewGuid() + ext;

                        #region Resize Image
                        string savePath = Server.MapPath("~/Content/img/shop/");

                        Image convertedImage = Image.FromStream(productImage.InputStream);

                        int maxImageSize = 500;
                        int maxThumbSize = 100;

                        ImageService.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion
                    }
                }
                product.ProductImage = file;

                #endregion

                db.Products.Add(product);
                db.SaveChanges();

                //Instead of returning the whole book object and all of its references to other tables, I am returning an object with only the data that is needed. 
                return Json(new { ProdID = product.ProdID, ProdName = product.ProdName, Price = product.Price, productImage = product.ProductImage, CategoryName = product.Category.CategoryName });
            }
            throw new Exception("Model state not valid");
        }

        // GET: Products/Details/5
        [Authorize(Roles = "Admin, Employee, Customer")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Create()
        {
            ViewBag.ArtistID = new SelectList(db.Artists, "ArtistID", "ArtistName");
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.MovieGenreID = new SelectList(db.MovieGenres, "MovieGenreID", "MovieGenreName");
            ViewBag.MusicGenreID = new SelectList(db.MusicGenres, "MusicGenreID", "MusicGenreName");
            ViewBag.StatusID = new SelectList(db.Statuses, "StatusID", "StatusName");
            ViewBag.StudioID = new SelectList(db.Studios, "StudioID", "StudioName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Create([Bind(Include = "ProdID,ProdName,CategoryID,StatusID,Price,ArtistID,Description,StudioID,MovieGenreID,MusicGenreID,ProductImage")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "NoImage.png";

                if (productImage != null)
                {
                    file = productImage.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    if (goodExts.Contains(ext) && productImage.ContentLength <= 4194304)
                    {
                        file = Guid.NewGuid() + ext;

                        #region Resize Image
                        string savePath = Server.MapPath("~/Content/img/shop/");

                        Image convertedImage = Image.FromStream(productImage.InputStream);

                        int maxImageSize = 500;
                        int maxThumbSize = 100;

                        ImageService.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion
                    }
                }
                product.ProductImage = file;
                #endregion


                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ArtistID = new SelectList(db.Artists, "ArtistID", "ArtistName", product.ArtistID);
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.MovieGenreID = new SelectList(db.MovieGenres, "MovieGenreID", "MovieGenreName", product.MovieGenreID);
            ViewBag.MusicGenreID = new SelectList(db.MusicGenres, "MusicGenreID", "MusicGenreName", product.MusicGenreID);
            ViewBag.StatusID = new SelectList(db.Statuses, "StatusID", "StatusName", product.StatusID);
            ViewBag.StudioID = new SelectList(db.Studios, "StudioID", "StudioName", product.StudioID);
            return View(product);
        }

        // GET: Products/Edit/5
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.ArtistID = new SelectList(db.Artists, "ArtistID", "ArtistName", product.ArtistID);
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.MovieGenreID = new SelectList(db.MovieGenres, "MovieGenreID", "MovieGenreName", product.MovieGenreID);
            ViewBag.MusicGenreID = new SelectList(db.MusicGenres, "MusicGenreID", "MusicGenreName", product.MusicGenreID);
            ViewBag.StatusID = new SelectList(db.Statuses, "StatusID", "StatusName", product.StatusID);
            ViewBag.StudioID = new SelectList(db.Studios, "StudioID", "StudioName", product.StudioID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Edit([Bind(Include = "ProdID,ProdName,CategoryID,StatusID,Price,ArtistID,Description,StudioID,MovieGenreID,MusicGenreID,ProductImage")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = product.ProductImage;

                if (productImage != null)
                {
                    file = productImage.FileName;


                    string ext = file.Substring(file.LastIndexOf('.'));

                    string[] goodExts = { ".jpg", ".jpeg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()) && productImage.ContentLength <= 4194304)
                    {
                        file = Guid.NewGuid() + ext;

                        #region resize image
                        string savePath = Server.MapPath("~/Content/img/shop/");

                        Image convertedImage = Image.FromStream(productImage.InputStream);

                        int maxImageSize = 500;
                        int maxThumbSize = 100;

                        ImageService.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion

                        if (product.ProductImage != null && product.ProductImage != "NoImage.png")
                        {
                            ImageService.Delete(savePath, product.ProductImage);
                        }

                        product.ProductImage = file;

                    }
                    #endregion

                }


                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ArtistID = new SelectList(db.Artists, "ArtistID", "ArtistName", product.ArtistID);
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.MovieGenreID = new SelectList(db.MovieGenres, "MovieGenreID", "MovieGenreName", product.MovieGenreID);
            ViewBag.MusicGenreID = new SelectList(db.MusicGenres, "MusicGenreID", "MusicGenreName", product.MusicGenreID);
            ViewBag.StatusID = new SelectList(db.Statuses, "StatusID", "StatusName", product.StatusID);
            ViewBag.StudioID = new SelectList(db.Studios, "StudioID", "StudioName", product.StudioID);
            return View(product);
        }

        // GET: Products/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);

            string path = Server.MapPath("~/Content/img/shop/");
            ImageService.Delete(path, product.ProductImage);

            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }




        public ActionResult AddToCart(int qty, int prodID)
        {
            //Create an empty shell for the LOCAL shopping cart variable
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            //Check if the session shopping cart exists. If so, use it to populate values into the LOCAL shopping
            //cart variable
            if (Session["cart"] != null)
            {
                //session cart DOES exist and we need to unbox it
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"]; //this is an example of explicit casting

            }
            else
            {
                //if session["cart"] doesn't exist, then we will new up an empty dictionary (initializing the collection)
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            //Find the product that the user is adding to their cart
            Product product = db.Products.Where(p => p.ProdID == prodID).FirstOrDefault();

            if (product == null)
            {
                //we got a bad Id. We need to kick them back to the index or some other page to try again
                return RedirectToAction("Index");
            }
            else
            {
                //we were able to find a book with the id passed to this method
                CartItemViewModel item = new CartItemViewModel(qty, product);

                //Put item in the LOCAL shopping cart variable. But if we already have one of the this product in
                //the cart, then we should just update QUANTITY
                if (shoppingCart.ContainsKey(product.ProdID))
                {
                    shoppingCart[product.ProdID].Qty += qty;
                }
                else
                {
                    shoppingCart.Add(product.ProdID, item);
                }

                //now we need to update Session so that we can persist the info in the cart between requests and
                //repsonse cycles
                Session["cart"] = shoppingCart; //implicit casting (boxing up - smaller container to a bigger container)

                Session["confirm"] = $"'{product.ProdName}' (Quantity: {qty}) added to cart";
            }

            //send the user to the index of the shopping cart controller
            return RedirectToAction("Index", "ShoppingCart");
        }//end AddToCart

    }//end of class
}//end of namespace
