﻿using System;
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
    public class CategoriesController : Controller
    {
        private VintageMediaStoreEntities db = new VintageMediaStoreEntities();

        // GET: Categories
        public ActionResult Index()
        {
            return View(db.Categories.ToList());
        }

        #region original functionality
        //// GET: Categories/Details/5
        //[Authorize(Roles ="Admin, Employee")]
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Category category = db.Categories.Find(id);
        //    if (category == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(category);
        //}

        //// GET: Categories/Create
        //[Authorize(Roles = "Admin, Employee")]
        //public ActionResult Create()
        //{
        //    return View();
        //}

        //// POST: Categories/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin, Employee")]
        //public ActionResult Create([Bind(Include = "CategoryID,CategoryName")] Category category)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Categories.Add(category);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(category);
        //}

        //// GET: Categories/Edit/5
        //[Authorize(Roles = "Admin, Employee")]
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Category category = db.Categories.Find(id);
        //    if (category == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(category);
        //}

        //// POST: Categories/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin, Employee")]
        //public ActionResult Edit([Bind(Include = "CategoryID,CategoryName")] Category category)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(category).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(category);
        //}

        //// GET: Categories/Delete/5
        //[Authorize(Roles = "Admin")]
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Category category = db.Categories.Find(id);
        //    if (category == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(category);
        //}

        //// POST: Categories/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Category category = db.Categories.Find(id);
        //    db.Categories.Remove(category);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //} 
        #endregion

        //---------------------------------------AJAX------------------------------------------------
        //*****************************************************DELETE***********************************************************//
        [Authorize(Roles = "Admin")]
        [HttpPost]
        public JsonResult AjaxDelete(int id)
        {
            Category cat = db.Categories.Find(id);
            db.Categories.Remove(cat);
            db.SaveChanges();

            string message = string.Format($"{cat.CategoryName} has been deleted");
            return Json(new { id = id, message = message });
        }

        //*****************************************************INFO********************************************************************//
        //get a partial view for details using AJAX for display
        //generate the parital with details scaffolding
        [HttpGet]
        public PartialViewResult CategoryDetails(int id)
        {
            Category cat = db.Categories.Find(id);
            return PartialView(cat);
        }

        //*****************************************************CREATE********************************************************************//
        //No need for a [get] b/c called partial view and passed empty studio object from studio index view
        [Authorize(Roles = "Admin, Employee")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Category cat)
        {
            db.Categories.Add(cat);
            db.SaveChanges();
            return Json(cat);
        }

        //*****************************************************EDIT********************************************************************//
        //get a partial view for a studio edit with AJAX display
        [Authorize(Roles = "Admin, Employee")]
        [HttpGet]
        public PartialViewResult CategoryEdit(int id)
        {
            Category cat = db.Categories.Find(id);
            return PartialView(cat);
        }
        [Authorize(Roles = "Admin, Employee")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Category cat)
        {
            db.Entry(cat).State = EntityState.Modified;
            db.SaveChanges();
            return Json(cat);
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
