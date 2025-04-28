using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace Employee_Management_system
{
    public partial class AddTask : System.Web.UI.Page
    {
        protected int managerId;
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
                if (Session["userId"] != null)
                {
                    managerId = Convert.ToInt32(Session["userId"]);
                }

                if (Request.QueryString["StaffId"] != null)
                {
                    int.TryParse(Request.QueryString["StaffId"], out stafId);
                }
            }
        }

        protected void btnSubmitTask_Click(object sender, EventArgs e)
        {
            string taskMessage = txtTaskMessage.Text.Trim();

            if (!string.IsNullOrEmpty(taskMessage) && managerId > 0 && stafId > 0)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();
                        string query = "INSERT INTO Task (TaskMessage, ManagerId, EmployeeId, IsComplete) VALUES (@TaskMessage, @ManagerId, @EmployeeId, @IsComplete)";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@TaskMessage", taskMessage);
                            cmd.Parameters.AddWithValue("@ManagerId", managerId);
                            cmd.Parameters.AddWithValue("@EmployeeId", stafId);
                            cmd.Parameters.AddWithValue("@IsComplete", false);

                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                Response.Write("<script>alert('Task assigned successfully!'); window.location='ManagerDashboard.aspx';</script>");
                            }
                            else
                            {
                                Response.Write("<script>alert('Error while assigning the task. Please try again.');</script>");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Please enter a valid task message and ensure that both manager and staff are selected.');</script>");
            }
        }
    }
}
