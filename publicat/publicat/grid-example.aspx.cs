using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace publicat
{
    public partial class grid_example : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.grid.DataSource = makeTable();
            this.grid.DataBind();
        }

        private DataTable makeTable()
        {
            // Create a new DataTable.
            DataTable table = new DataTable("Personne");
            // Declare variables for DataColumn and DataRow objects.
            DataColumn column;
            DataRow row;

            // Create new DataColumn, set DataType,  
            // ColumnName and add to DataTable.    
            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "firstname";
            
            // Add the Column to the DataColumnCollection.
            table.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "lastname";
            
            // Add the column to the table.
            table.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "checkbox";

            // Add the column to the table.
            table.Columns.Add(column);

            

            

            // Create three new DataRow objects and add  
            // them to the DataTable 
            for (int i = 0; i <= 12; i++)
            {
                row = table.NewRow();
                row["checkbox"] = "<label><input type='checkbox' /><span class='lbl'></span></label>";
                row["firstname"] = "firstname" + i;
                row["lastname"] = "lastname " + i;
                string actions = "<td class='td-actions'>"+
                        "<div class='hidden-phone visible-desktop action-buttons'>" +
							"<a class='blue' href='#'>"+
								"<i class='icon-zoom-in bigger-130'></i>"+
							"</a>"+

							"<a class='green' href='#'>"+
								"<i class='icon-check bigger-130'></i>"+
							"</a>"+

							"<a class='red' href='#'>"+
								"<i class='icon-trash bigger-130'></i>"+
							"</a>"+
						"</div>";
                table.Rows.Add(row);
            }
            return table;
        }
    }
}