using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data;

using MySql.Data;
using MySql.Data.MySqlClient;
namespace publicat
{
    public partial class index : System.Web.UI.Page
    {
        public string con = "m y";
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = "server=localhost;user=root;database=world;port=3306;password=001985;";
            MySqlConnection conn = new MySqlConnection(connStr);
        }
    }
}