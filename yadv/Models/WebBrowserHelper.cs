using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace yadv.Models
{
    public class WebBrowserHelper
    {
        public static readonly DependencyProperty BodyProperty =
            DependencyProperty.RegisterAttached("Body", typeof(string), typeof(WebBrowserHelper), new PropertyMetadata(OnBodyChanged));

        public static readonly DependencyProperty ZoomProperty =
       DependencyProperty.RegisterAttached("Zoom", typeof(double), typeof(WebBrowserHelper), new PropertyMetadata(OnBodyChanged));



        public static string GetBody(DependencyObject dependencyObject)
        {
            return (string)dependencyObject.GetValue(BodyProperty);
        }

        public static void SetBody(DependencyObject dependencyObject, string body)
        {
            dependencyObject.SetValue(BodyProperty, body);
        }

        private static void OnBodyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var webBrowser = (WebBrowser)d;
            if (e.Property.Name == "Body")
            {
                webBrowser.NavigateToString((string)e.NewValue);
            }
            else if (e.Property.Name == "Zoom")
            {
             
            }
        }




        public static double GetZoom(DependencyObject dependencyObject)
        {
            return (double)dependencyObject.GetValue(ZoomProperty);
        }

        public static void SetZoom(DependencyObject dependencyObject, double zoom)
        {
            dependencyObject.SetValue(ZoomProperty, zoom);
        }


  


    }
}
