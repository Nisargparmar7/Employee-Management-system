using System;
using System.Web;

namespace Employee_Management_system
{
    public partial class Staffdashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                Response.Redirect("StaffLogin.aspx");
            }
            string staf = Session["Role"].ToString();
            if (Session["IsLoggedIn"] != null && staf != "Staff")
            {
                Response.Redirect("ManagerDashboard.aspx");
            }
            else
            {
                litWelcomeMessage.Text = "Hello, " + Session["Username"] + "! Welcome to your dashboard.";
            }
        }

       
        protected void Logout(object sender, EventArgs e)
        {
            Session.Clear(); 
            Session.Abandon(); 
            Response.Redirect("StaffLogin.aspx"); 
        }
    }
}
