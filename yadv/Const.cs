using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows;

namespace yadv
{
    class Const
    {
        public struct App
        {
            public const string VERSION = "0.01";
            public readonly static string ABOUT_STR = String.Format("yadv v.{0}", VERSION);
            public readonly static string PATH = System.AppDomain.CurrentDomain.BaseDirectory;
            public readonly static string MSG_DESCR = Path.Combine(App.PATH, "xmldoc_description.xml");
            public readonly static string XSLT_PATH = Path.Combine(App.PATH, "xslt");

        }

        public struct XML
        {
            public const string HEADER = "<?xml version=\"1.0\" ?>";
        }
    }
}
