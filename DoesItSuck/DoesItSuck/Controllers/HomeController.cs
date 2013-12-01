using DoesItSuck.Extensions;
using DoesItSuck.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace DoesItSuck.Controllers
{
    public class HomeController : Controller
    {
        private DoesItSuckEntities db = new DoesItSuckEntities();

        //TODO kick this out to config
        private Arrangement[] arrangements = new Arrangement[] {
            Arrangement.Alpha,
            Arrangement.Foxtrot,
            Arrangement.Charlie,
            Arrangement.Alpha,
            Arrangement.Hotel,
            Arrangement.Bravo,
            Arrangement.Echo,
            Arrangement.India,
            Arrangement.Echo,
            Arrangement.Golf,
            Arrangement.Alpha,
            Arrangement.Hotel
        };

        public ActionResult Index(string category)
        {
            var reviewList = new List<Review>();
            if (!String.IsNullOrEmpty(category))
            {
                reviewList = db.Review.Where(x => x.Category == category).ToList();
            }
            else
            {
                reviewList = db.Review.ToList();
            }

            reviewList.SetArrangments(arrangements);

            return View(reviewList);
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