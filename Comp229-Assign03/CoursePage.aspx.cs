using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Comp229_Assign03
{
    public partial class CoursePage : Page
    {
        private string whereClause;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Course";

            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;

            string connectionString = ConfigurationManager.ConnectionStrings["Student"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand(
                       whereClause = "where CourseID not in (" +
                                 "    select CourseID" +
                                 "    from   Enrollments " +
                                 "    where  StudentID = @StudentID " +
                                 ")");
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                courseList.DataSource = reader;
                courseList.DataBind();
                reader.Close();
            }

            catch (System.Exception)
            {
                throw new DatabaseException(string.Format("An error has occurred when getting student from the database"));
            }

            finally
            {
                conn.Close();
            }
        }
    }
}