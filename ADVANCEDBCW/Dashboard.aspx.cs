using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADVANCEDBCW
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private string constr = "Data Source=localhost;Persist Security Info=True;User ID=ADVANCEDATABASE; Password=ESHALAMASAMDEN;";


        protected void Page_Load(object sender, EventArgs e)
        {
            using (OracleConnection con = new OracleConnection(constr))
            {
                con.Open();

                // Define a SQL query with JOIN operations
                string query = @"
                    SELECT 
                        (SELECT COUNT(*) FROM student) AS StudentCount,
                        (SELECT COUNT(*) FROM course) AS CourseCount,
                        (SELECT COUNT(*) FROM instructor) AS InstructorCount,
                        (SELECT COUNT(*) FROM QANDA_SECTION) AS QnACount

                    FROM DUAL";

                using (OracleCommand cmd = new OracleCommand(query, con))
                using (OracleDataAdapter adapter = new OracleDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    // Display the counts in textboxes or perform further processing as needed
                    TextBox1.Text = dt.Rows[0]["StudentCount"].ToString();
                    TextBox2.Text = dt.Rows[0]["InstructorCount"].ToString();
                    TextBox3.Text = dt.Rows[0]["CourseCount"].ToString();
                    TextBox4.Text = dt.Rows[0]["QnACount"].ToString();

                }
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

      
    }
}