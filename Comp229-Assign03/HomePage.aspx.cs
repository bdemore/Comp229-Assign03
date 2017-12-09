using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Runtime.Serialization;

namespace Comp229_Assign03
{
    public partial class HomePage : Page
    {
        private int Id;
        private string LastName;
        private string FirstName;
        private DateTime EnrollmentDateTime;
        private readonly object student;

        public string whereClause { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Home";

            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;

            string connectionString = ConfigurationManager.ConnectionStrings["Student"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand(
                       whereClause = "where StudentID not in (" +
                                 "    select StudentID" +
                                 "    from   Enrollments " +
                                 "    where  CourseID = @CourseID " +
                                 ")");
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                studentsList.DataSource = reader;
                studentsList.DataBind();
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
        private void AddCommandParameter(SqlCommand cmd, string v, object id)
        {
            throw new NotImplementedException();
        }

        private string BuildCompleteSelectAndFromClauses()
        {
            throw new NotImplementedException();
        }

        public void Student(int studentID, string lastName, string firstName, DateTime enrollmentDate)
        {
            Id = studentID;
            LastName = lastName;
            FirstName = firstName;
            EnrollmentDateTime = enrollmentDate;
        }
    }

    [Serializable]
    internal class DatabaseException : Exception
    {
        public DatabaseException()
        {
        }

        public DatabaseException(string message) : base(message)
        {
        }

        public DatabaseException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected DatabaseException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}