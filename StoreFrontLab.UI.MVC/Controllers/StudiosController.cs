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
    public class StudiosController : Controller
    {
        private VintageMediaStoreEntities db = new VintageMediaStoreEntities();

        // GET: Studios
        [Authorize(Roles = "Admin, Employee")]
        public ActionResult Index()
        {
            return View(db.Studios.ToList());
        }

        #region Original synchronous actions
        //// GET: Studios/Details/5
        //[Authorize(Roles = "Admin, Employee")]
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Studio studio = db.Studios.Find(id);
        //    if (studio == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(studio);
        //}

        //// GET: Studios/Create
        //[Authorize(Roles = "Admin, Employee")]
        //public ActionResult Create()
        //{
        //    return View();
        //}

        //// POST: Studios/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin, Employee")]
        //public ActionResult Create([Bind(Include = "StudioID,StudioName")] Studio studio)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Studios.Add(studio);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(studio);
        //}

        //// GET: Studios/Edit/5
        //[Authorize(Roles = "Admin, Employee")]
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Studio studio = db.Studios.Find(id);
        //    if (studio == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(studio);
        //}

        //// POST: Studios/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin, Employee")]
        //public ActionResult Edit([Bind(Include = "StudioID,StudioName")] Studio studio)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(studio).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(studio);
        //}

        //// GET: Studios/Delete/5
        //[Authorize(Roles = "Admin")]
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Studio studio = db.Studios.Find(id);
        //    if (studio == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(studio);
        //}

        //// POST: Studios/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Studio studio = db.Studios.Find(id);
        //    db.Studios.Remove(studio);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //} 
        #endregion

        //******************************************************AJAX*******************************************************************//

        //*****************************************************DELETE******************************************************************//
        //Delete a studio and return JSON data ONLY
        [HttpPost]
        public JsonResult AjaxDelete(int id)
        {
            Studio studio = db.Studios.Find(id);
            db.Studios.Remove(studio);
            db.SaveChanges();

            string message = string.Format($"{studio.StudioName} has been deleted");
            return Json(new { id = id, message = message });
        }

        //*****************************************************INFO********************************************************************//
        //get a partial view for details using AJAX for display
        //generate the parital with details scaffolding
        [HttpGet]
        public PartialViewResult StudioDetails(int id)
        {
            Studio studio = db.Studios.Find(id);
            return PartialView(studio);
        }

        //*****************************************************CREATE********************************************************************//
        //No need for a [get] b/c called partial view and passed empty studio object from studio index view

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Studio studio)
        {
            db.Studios.Add(studio);
            db.SaveChanges();
            return Json(studio);
        }

        //*****************************************************EDIT********************************************************************//
        //get a partial view for a studio edit with AJAX display
        [HttpGet]
        public PartialViewResult StudioEdit(int id)
        {
            Studio studio = db.Studios.Find(id);
            return PartialView(studio);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Studio studio)
        {
            db.Entry(studio).State = EntityState.Modified;
            db.SaveChanges();
            return Json(studio);
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
