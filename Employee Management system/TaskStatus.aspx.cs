using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace Employee_Management_system
{
    public partial class TaskStatus : System.Web.UI.Page
    {
        protected int stafId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("ManagerLogin.aspx");
            }
            else if (Session["Role"] != null && Session["Role"].ToString() == "Staff")
            {
                Response.Redirect("StaffDashboard.aspx");
            }
            else
            {
                
                    if (Request.QueryString["StaffId"] != null)
                    {
                        int.TryParse(Request.QueryString["StaffId"], out stafId);
                    }

                    LoadTasks();
                
            }
        }

        private void LoadTasks()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open(); 

                string query = "SELECT TaskId, TaskMessage, IsComplete FROM Task WHERE EmployeeId = @EmployeeId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EmployeeId", stafId);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader); 
                    gvTasks.DataSource = dt; 
                    gvTasks.DataBind(); 
                }
            }
        }

        

        protected void gvTasks_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int taskId = Convert.ToInt32(gvTasks.DataKeys[e.RowIndex].Value);
            string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open(); 
                string query = "DELETE FROM Task WHERE TaskId = @TaskId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TaskId", taskId);

                cmd.ExecuteNonQuery();
            }

            LoadTasks();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagerDashboard.aspx");
        }

    }
}
