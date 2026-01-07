using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.admin
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Username"] != null)
            {
                
                lblWelcome.Text = "Welcome " + Session["Username"].ToString() + "!";
            }
            else
            {
                
                Response.Redirect("adminLogin.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
          
            Session.Clear();

           
            Response.Redirect("adminLogin.aspx");

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("adminDashboard.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminRegister.aspx");
        }
    }
}