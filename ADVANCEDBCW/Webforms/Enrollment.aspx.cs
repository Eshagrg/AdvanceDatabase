using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADVANCEDBCW
{
    public partial class Enrollment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            TextBox enrolMonthTextBox = (TextBox)FormView1.FindControl("TextBox1");
            TextBox enrolYearTextBox = (TextBox)FormView1.FindControl("TextBox2");

            // Set the values for ENROL_MONTH and ENROL_YEAR
            e.Values["ENROL_MONTH"] = enrolMonthTextBox.Text;
            e.Values["ENROL_YEAR"] = Convert.ToInt32(enrolYearTextBox.Text);
        }

    }
}