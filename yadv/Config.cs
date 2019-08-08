using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;

namespace yadv
{
    class Config
    {
        private static Dictionary<string, string> xmldocDescriptions;
        public static string lastFortmat;

        public static void Load()
        {
            xmldocDescriptions = loadXmlDocDescriptions();
            getLastFormat();
        }

        private static Dictionary<string, string> loadXmlDocDescriptions()
        {
            var msgDesc = new Dictionary<string, string>();
            XmlDocument doc = new XmlDocument();
            doc.Load(Const.App.MSG_DESCR);
            foreach (XmlNode node in doc.ChildNodes[1])
            {
                msgDesc[node["ModeID"].InnerText] = node["Description"].InnerText;
            }
            return msgDesc;
        }

        public static string getXmlDocDescription(string docID)
        {
            string desc;
            xmldocDescriptions.TryGetValue(docID, out desc);

            if (desc == null)
            {
                desc = "нет описания";
            }

            return desc;
        }

        private static void getLastFormat()
        {
            List<string> dirs = new List<string>(Directory.EnumerateDirectories(Const.App.XSLT_PATH));
            lastFortmat = "";


            string item;
            foreach (var str in dirs)
            {
                item = str.Split('\\').LastOrDefault();
                if (item.Split('.').Length>0)
                {
                    if (lastFortmat == "")
                    {
                        lastFortmat = item;
                        continue;
                    }
                    if(int.Parse(item.Split('.')[0])> int.Parse(lastFortmat.Split('.')[0]))
                    {
                        lastFortmat = item;
                    } else if (int.Parse(item.Split('.')[0]) == int.Parse(lastFortmat.Split('.')[0]) &&
                              int.Parse(item.Split('.')[1]) > int.Parse(lastFortmat.Split('.')[1]))
                    {
                        lastFortmat = item;
                    }
                    else if (int.Parse(item.Split('.')[0]) == int.Parse(lastFortmat.Split('.')[0]) &&
                             int.Parse(item.Split('.')[1]) == int.Parse(lastFortmat.Split('.')[1]) &&
                             int.Parse(item.Split('.')[2]) > int.Parse(lastFortmat.Split('.')[2]))
                    {
                        lastFortmat = item;
                    }



                }
            }


        }


    }
}
