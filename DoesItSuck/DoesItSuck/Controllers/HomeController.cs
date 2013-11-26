using DoesItSuck.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoesItSuck.Controllers
{
    public class HomeController : Controller
    {
        private DoesItSuckEntities db = new DoesItSuckEntities();

        public ActionResult Index(string category)
        {
            if (!String.IsNullOrEmpty(category))
            {
                return View(db.Review.Where(x => x.Category == category).ToList());
            }
            else
            {
                return View(db.Review.ToList());
            }
        }

        //
        // GET: /Review/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Review/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Review review)
        {
            if (ModelState.IsValid)
            {
                review.Date_Created = DateTime.Now;
                db.Review.Add(review);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(review);
        }


        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}
