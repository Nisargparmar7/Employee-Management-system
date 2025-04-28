using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Employee_Management_system
{
    public partial class ManagerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT StafId, Username, Role FROM Staf WHERE Username = @Username AND Password = @Password AND Role = 'Manager'";
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

                        Response.Redirect("ManagerDashboard.aspx");
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
