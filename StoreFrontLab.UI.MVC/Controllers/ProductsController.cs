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
    }
}
