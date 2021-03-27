using System.Web.Optimization;

namespace StoreFrontLab.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/css/bootstrap.min.css",
                "~/Content/css/flaticon.css",
                "~/Content/css/barfiller.css",
                "~/Content/css/magnific-popup.css",
                "~/Content/css/font-awesome.min.css",
                "~/Content/css/elegant-icons.css",
                "~/Content/css/nice-select.css",
                "~/Content/css/owl.carousel.min.css",
                "~/Content/css/slicknav.min.css"
                ));

            bundles.Add(new ScriptBundle("~/bundles/template").Include(
                "~/Content/js/jquery-3.3.1.min.js",
                "~/Content/js/bootstrap.min.js",
                "~/Content/js/jquery.nice-select.min.js",
                "~/Content/js/jquery.barfiller.js",
                "~/Content/js/jquery.magnific-popup.min.js",
                "~/Content/js/jquery.slicknav.js",
                "~/Content/js/owl.carousel.min.js",
                "~/Content/js/jquery.nicescroll.min.js",
                "~/Content/js/main.js"
                ));
        }
    }
}
