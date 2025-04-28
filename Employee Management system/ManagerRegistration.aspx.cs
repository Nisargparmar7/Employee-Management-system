using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Employee_Management_system
{
    public partial class ManagerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sp = securityPassword.Text;
            if (sp != "nisarg123")
            {
                Response.Write("<script>alert('Please enter security password');</script>");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Staf (Username, FullName, Email, Role, PhoneNumber, Password) VALUES (@Username, @FullName, @Email, @Role, @PhoneNumber, @Password)";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Role", "Manager");
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Manager registered successfully!');</script>");
                        Response.Redirect("managerDashboard.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error while registering manager. Please try again.');</script>");
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
