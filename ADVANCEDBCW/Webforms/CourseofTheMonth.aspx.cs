using Oracle.ManagedDataAccess.Client;
using System.Collections.Generic;
using System.Data;
using System;

namespace ADVANCEDBCW.Webforms
{
    public partial class CourseofTheMonth : System.Web.UI.Page
    {
        private string constr = "Data Source=localhost;Persist Security Info=True;User ID=ADVANCEDATABASE; Password=ESHALAMASAMDEN;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                List<string> months = new List<string> { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
                foreach (string month in months)
                {
                    monthDropDown.Items.Add(month);
                }
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            using (OracleConnection con = new OracleConnection(constr))
            {
                con.Open();

                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = @"SELECT *
FROM (
    SELECT c.COURSE_ID,
           c.COURSE_TITLE,
           COUNT(DISTINCT e.STUDENT_ID) AS ENROLL_COUNT
    FROM course c
         JOIN enrollment e ON c.COURSE_ID = e.COURSE_ID
    WHERE ('Jan' IS NULL OR e.ENROL_MONTH = 'Jan')
      AND ('2024' IS NULL OR e.ENROL_YEAR = '2024')
    GROUP BY c.COURSE_ID, c.COURSE_TITLE
    ORDER BY ENROLL_COUNT DESC
)
WHERE ROWNUM <= 3
";
                    cmd.CommandType = CommandType.Text;

                    DataTable dt = new DataTable("enrollment");

                    using (OracleDataReader sdr = cmd.ExecuteReader())
                    {
                        dt.Load(sdr);
                    }

                    CourseofTheMonthGV.DataSource = dt;
                    CourseofTheMonthGV.DataBind();
                }
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            string year = yearTextbox.Text;
            string month = monthDropDown.Text;

            using (OracleConnection con = new OracleConnection(constr))
            {
                con.Open();

                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.Connection = con;

                    // Set bind variables
                    cmd.Parameters.Add(new OracleParameter(":enrol_month", OracleDbType.Varchar2)).Value = month;
                    cmd.Parameters.Add(new OracleParameter(":enrol_year", OracleDbType.Varchar2)).Value = year;

                    cmd.CommandText = @"SELECT *
FROM (
    SELECT c.COURSE_ID,
           c.COURSE_TITLE,
           COUNT(DISTINCT e.STUDENT_ID) AS ENROLL_COUNT
    FROM course c
         JOIN enrollment e ON c.COURSE_ID = e.COURSE_ID
    WHERE ('Jan' IS NULL OR e.ENROL_MONTH = 'Jan')
      AND ('2024' IS NULL OR e.ENROL_YEAR = '2024')
    GROUP BY c.COURSE_ID, c.COURSE_TITLE
    ORDER BY ENROLL_COUNT DESC
)
WHERE ROWNUM <= 3
";
                    cmd.CommandType = CommandType.Text;

                    DataTable dt = new DataTable("enrollment");

                    using (OracleDataReader sdr = cmd.ExecuteReader())
                    {
                        dt.Load(sdr);
                    }

                    CourseofTheMonthGV.DataSource = dt;
                    CourseofTheMonthGV.DataBind();
                }
            }
        }
    }
}
