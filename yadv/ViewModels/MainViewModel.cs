
using Microsoft.Win32;
using System;
using System.Collections.ObjectModel;
using System.IO;
using System.Windows;
using System.Windows.Input;
using System.Xml;
using System.Xml.Xsl;

namespace yadv.ViewModels
{
    class MainViewModel : BaseVM
    {

    

        private string _FileName;

        public string FileName
        {
            get { return _FileName; }
            set
            {
                _FileName = value;
                OnPropertyChanged(nameof(FileName));
            }
        }

        private string _WebBody;

        public string WebBody
        {
            get { return _WebBody; }
            set
            {
                _WebBody = value;
                OnPropertyChanged(nameof(WebBody));
            }
        }
        private string _XmlBody;

        public string XmlBody
        {
            get { return _XmlBody; }
            set
            {
                _XmlBody = value;
                OnPropertyChanged(nameof(XmlBody));
            }
        }

        private ObservableCollection<XMLFile> _XMLFiles;
        public ObservableCollection<XMLFile> XMLFiles
        {
            get { return _XMLFiles; }
            set
            {
                _XMLFiles = value;
                OnPropertyChanged(nameof(XMLFiles));
            }
        }

        public ICommand CloseApp
        {
            get
            {
                return new DelegateCommand((obj) =>
                {
                    System.Windows.Application.Current.Shutdown();
                });
            }

        }

        public ICommand ShowXmlDocument
        {
            get
            {
                return new DelegateCommand((obj) =>
                {
                    if (obj == null) return;
                    var doc = (XMLFile)obj;
                    XmlDocument xmldoc = new XmlDocument();
                    xmldoc.Load(FileName);
                    string xslt_path = GetXsltSchema(doc.DocumentId, Path.Combine(Const.App.XSLT_PATH, doc.Albom));
                    if (xslt_path == string.Empty)
                        xslt_path = GetXsltSchema(doc.DocumentId, Path.Combine(Const.App.XSLT_PATH, Config.lastFortmat));

                    XmlDocument xsltdoc = new XmlDocument();
                    xsltdoc.Load(xslt_path);

                    WebBody = transform(xsltdoc.InnerXml, xmldoc.SelectNodes("//*[@DocumentModeID]")[doc.cnt].ParentNode.InnerXml);
                    XmlNode xnode = xmldoc.SelectNodes("//*[@DocumentModeID]")[doc.cnt].ParentNode;
                    if (xnode.FirstChild.NodeType == XmlNodeType.XmlDeclaration)
                        xnode.RemoveChild(xnode.FirstChild);
                    XmlBody = Const.XML.HEADER + xnode.InnerXml;
                });
            }

        }

        public ICommand OpenFile
        {
            get
            {
                return new DelegateCommand((obj) =>
                {
                    var dlg = new OpenFileDialog();
                    dlg.Filter = "*.xml|*.xml";
                    if(dlg.ShowDialog() == true)
                    {
                        FileName = dlg.FileName;
                        XMLFiles.Clear();
                        XmlDocument xdoc = new XmlDocument();
                        xdoc.Load(FileName);
                        string docid;
                        int i = 0;
                        foreach (XmlNode item in xdoc.SelectNodes("//*[@DocumentModeID]"))
                        {
                            docid = item.Attributes["DocumentModeID"].InnerText;
                            XMLFiles.Add(
                                new XMLFile
                                {
                                    Image = "/img/doc.png",
                                    Name = item.LocalName,
                                    DocumentId = docid,
                                    Description = Config.getXmlDocDescription(docid),
                                    Albom = item.NamespaceURI.Split(':')[item.NamespaceURI.Split(':').Length-1],
                                    cnt = i
                                });
                            i++;
                        }
                    }
                });
           }
        }





        public ICommand SaveFile
        {
            get
            {
                return new DelegateCommand((obj) =>
                {
                    var dlg = new SaveFileDialog();
                    dlg.Filter = "*.html|*.html";
                    if (dlg.ShowDialog() == true)
                    {
                        File.WriteAllText(dlg.FileName, WebBody);
                        MessageBox.Show("Файл успешно сохранен", " Сохранение", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                        

                }, (obj)=> File.Exists(FileName));
            }
        }


        public ICommand About
        {
            get
            {
                return new DelegateCommand((obj) =>
                {
                    MessageBox.Show(Const.App.ABOUT_STR, " О программе", MessageBoxButton.OK, MessageBoxImage.Information);
                });
            }
        }





        private string GetXsltSchema(string schemaid, string path)
        {
            if (!Directory.Exists(path)) return string.Empty;

            string[] dirs = Directory.GetFiles(path, string.Format("{0}*.xslt", schemaid));
            if (dirs.Length <= 0) return string.Empty;

            return dirs[0];
        }


        private string transform(string xslInput, string xmlInput)
        {
            string output = String.Empty;
            using (StringReader srt = new StringReader(xslInput))
            using (StringReader sri = new StringReader(xmlInput)) 
            {
                using (XmlReader xrt = XmlReader.Create(srt))
                using (XmlReader xri = XmlReader.Create(sri))
                {
                    XslCompiledTransform xslt = new XslCompiledTransform();
                    xslt.Load(xrt);
                    using (StringWriter sw = new StringWriter())
                    using (XmlWriter xwo = XmlWriter.Create(sw, xslt.OutputSettings))
                    {
                        xslt.Transform(xri, xwo);
                        output = sw.ToString();
                    }
                }
            }
            return output;
        }


        public MainViewModel() {
            XMLFiles = new ObservableCollection<XMLFile>();
        }


    }
}
