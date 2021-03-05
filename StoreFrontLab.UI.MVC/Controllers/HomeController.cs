using StoreFrontLab.UI.MVC.Models;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace StoreFrontLab.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        //[Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return View(cvm);
            }

            string message = $"Message from {cvm.Name} at {cvm.EmailAddress}<br />" +
                $"Subject: {cvm.Subject}<br />" +
                $"Message:<br />{cvm.Message}";

            MailMessage mm = new MailMessage("admin@sarahledford.com", "Sarah_Ledford@outlook.com", cvm.Subject, message);

            mm.IsBodyHtml = true;

            mm.Priority = MailPriority.High;

            mm.ReplyToList.Add(cvm.EmailAddress);

            SmtpClient client = new SmtpClient("mail.sarahledford.com");

            client.Credentials = new NetworkCredential("admin@sarahledford.com", "aKmS2FhiQp_");

            try
            {
                client.Send(mm);
            }
            catch (System.Exception)
            {
                ViewBag.CustomerMessage = $"We're sorry. Your request could not be processed at this time.";

                return View(cvm);
            }

            return View("EmailConfirmation", cvm);
        }


    }//end class
}//end namespace
