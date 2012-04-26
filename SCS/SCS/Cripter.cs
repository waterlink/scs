using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Security;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for Cripter
/// </summary>
    public class Cripter
    {
        public Cripter()
        { 
            
        }

        public string CriptString(string toCript)
        {
            byte[] ClearData = Encoding.UTF8.GetBytes(toCript);
            HashAlgorithm Algorithm = HashAlgorithm.Create("MD5");
            byte[] CryptedData = Algorithm.ComputeHash(ClearData);
            return Encoding.UTF8.GetString(CryptedData);
        }
    }

