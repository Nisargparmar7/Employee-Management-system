using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

namespace Employee_Management_system
{
    public partial class StaffLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: If the user is already logged in, redirect to dashboard
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT StafId, Username, Role FROM Staf WHERE Username = @Username AND Password = @Password GROUP BY StafId, Username, Role";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text); 

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["IsLoggedIn"] = true;
                        Session["Username"] = reader["Username"].ToString();
                        Session["UserId"] = (int)reader["StafId"];
                        Session["Role"] = reader["Role"].ToString();

                        Response.Redirect("StaffDashboard.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid username or password.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }
            }
        }

    }
}
