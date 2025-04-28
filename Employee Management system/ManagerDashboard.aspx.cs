using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Employee_Management_system
{
    public partial class ManagerDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"] || Session["Role"] == null || Session["Role"].ToString() != "Manager")
            {
                Response.Redirect("ManagerLogin.aspx");
            }
            else if (!IsPostBack)
            {
                LoadStaffList();
            }
        }

        private void LoadStaffList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT StafId, FullName, Email, PhoneNumber FROM Staf WHERE Role = 'Staff'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvStaffList.DataSource = dt;
                gvStaffList.DataBind();
            }
        }

        protected void gvStaffList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int staffId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "AssignTask")
            {
                Response.Redirect($"AssignTask.aspx?StaffId={staffId}");
            }
            else if (e.CommandName == "TaskStatus")
            {
                Response.Redirect($"TaskStatus.aspx?StaffId={staffId}");
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("ManagerLogin.aspx");
        }
    }
}
