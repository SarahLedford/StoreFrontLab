using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontLab.DATA.EF;

namespace StoreFrontLab.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private VintageMediaStoreEntities db = new VintageMediaStoreEntities();

        // GET: Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Artist).Include(p => p.Category).Include(p => p.MovieGenre).Include(p => p.MusicGenre).Include(p => p.Status).Include(p => p.Studio);
            return View(products.ToList());
        }

        // GET: Products/Details/5
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
        public ActionResult Create([Bind(Include = "ProdID,ProdName,CategoryID,StatusID,Price,ArtistID,Description,StudioID,MovieGenreID,MusicGenreID,ProductImage")] Product product)
        {
            if (ModelState.IsValid)
            {
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
        public ActionResult Edit([Bind(Include = "ProdID,ProdName,CategoryID,StatusID,Price,ArtistID,Description,StudioID,MovieGenreID,MusicGenreID,ProductImage")] Product product)
        {
            if (ModelState.IsValid)
            {
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
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
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
