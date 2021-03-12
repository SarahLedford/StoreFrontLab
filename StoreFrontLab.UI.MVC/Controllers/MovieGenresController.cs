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
    public class MovieGenresController : Controller
    {
        private VintageMediaStoreEntities db = new VintageMediaStoreEntities();

        // GET: MovieGenres
        public ActionResult Index()
        {
            return View(db.MovieGenres.ToList());
        }

        // GET: MovieGenres/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieGenre movieGenre = db.MovieGenres.Find(id);
            if (movieGenre == null)
            {
                return HttpNotFound();
            }
            return View(movieGenre);
        }

        // GET: MovieGenres/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MovieGenres/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MovieGenreID,MovieGenreName")] MovieGenre movieGenre)
        {
            if (ModelState.IsValid)
            {
                db.MovieGenres.Add(movieGenre);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(movieGenre);
        }

        // GET: MovieGenres/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieGenre movieGenre = db.MovieGenres.Find(id);
            if (movieGenre == null)
            {
                return HttpNotFound();
            }
            return View(movieGenre);
        }

        // POST: MovieGenres/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MovieGenreID,MovieGenreName")] MovieGenre movieGenre)
        {
            if (ModelState.IsValid)
            {
                db.Entry(movieGenre).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(movieGenre);
        }

        // GET: MovieGenres/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MovieGenre movieGenre = db.MovieGenres.Find(id);
            if (movieGenre == null)
            {
                return HttpNotFound();
            }
            return View(movieGenre);
        }

        // POST: MovieGenres/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MovieGenre movieGenre = db.MovieGenres.Find(id);
            db.MovieGenres.Remove(movieGenre);
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
