using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using publicat.Data;


namespace publicat
{
    public partial class mes_articles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.grid.DataSource = Data.Data.getArticlesByAuteur(1);
            this.grid.DataBind();
        }

        public string getStatusText(bool status) {

            if (status)
                return "Traite";

            return "en cours";
        }
        
    }
}