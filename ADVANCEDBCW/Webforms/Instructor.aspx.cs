using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADVANCEDBCW
{
    public partial class Instructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            // Validate the page when changing the index (e.g., inserting new data)
            Page.Validate("InsertValidationGroup");

            if (Page.IsValid)
            {
                // Your existing logic for inserting data
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            // Your code for the Selecting event
        }


    }
}