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
    public class MusicGenresController : Controller
    {
        private VintageMediaStoreEntities db = new VintageMediaStoreEntities();

        // GET: MusicGenres
        public ActionResult Index()
        {
            return View(db.MusicGenres.ToList());
        }

        // GET: MusicGenres/Details/5
        [Authorize(Roles ="Admin, Employee")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MusicGenre musicGenre = db.MusicGenres.Find(id);
            if (musicGenre == null)
            {
                return HttpNotFound();
            }
            return View(musicGenre);
        }

        // GET: MusicGenres/Create
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: MusicGenres/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Create([Bind(Include = "MusicGenreID,MusicGenreName")] MusicGenre musicGenre)
        {
            if (ModelState.IsValid)
            {
                db.MusicGenres.Add(musicGenre);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(musicGenre);
        }

        // GET: MusicGenres/Edit/5
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MusicGenre musicGenre = db.MusicGenres.Find(id);
            if (musicGenre == null)
            {
                return HttpNotFound();
            }
            return View(musicGenre);
        }

        // POST: MusicGenres/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Edit([Bind(Include = "MusicGenreID,MusicGenreName")] MusicGenre musicGenre)
        {
            if (ModelState.IsValid)
            {
                db.Entry(musicGenre).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(musicGenre);
        }

        // GET: MusicGenres/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MusicGenre musicGenre = db.MusicGenres.Find(id);
            if (musicGenre == null)
            {
                return HttpNotFound();
            }
            return View(musicGenre);
        }

        // POST: MusicGenres/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            MusicGenre musicGenre = db.MusicGenres.Find(id);
            db.MusicGenres.Remove(musicGenre);
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
