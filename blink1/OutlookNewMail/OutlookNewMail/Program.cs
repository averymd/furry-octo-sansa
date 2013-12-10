using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Office.Interop.Outlook;
using System.Runtime.InteropServices;

namespace OutlookNewMail
{
    class Program
    {
        static void Main(string[] args)
        {
            Application outlookApp;
            System.Diagnostics.Process[] processes = System.Diagnostics.Process.GetProcessesByName("OUTLOOK");
            if (processes.Length > 0)
            {
                outlookApp = Marshal.GetActiveObject("Outlook.Application") as Application;
            }
            else
            {
                outlookApp = new Application();
            }
            var inbox = outlookApp.GetNamespace("mapi").GetDefaultFolder(OlDefaultFolders.olFolderInbox);

            if (inbox.UnReadItemCount == 0)
            {
                Console.Out.Write("\"#000000\"");
                return;
            }

            Console.Out.Write("\"pattern: \"NewMail\"\"");
        }
    }
}
