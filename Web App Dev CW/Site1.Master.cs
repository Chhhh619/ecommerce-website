using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                bool isLoggedIn = Session["UserName"] != null;


                loginMenuItem.Visible = !isLoggedIn;
                registerMenuItem.Visible = !isLoggedIn;
                profileMenuItem.Visible = isLoggedIn;
                logoutMenuItem.Visible = isLoggedIn;


                if (isLoggedIn)
                {
                    profileLink.NavigateUrl = "userProfile.aspx";
                }
                else
                {
                    profileLink.NavigateUrl = "login.aspx";
                }
            }
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("addToCart.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminLogin.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("SupportPage.aspx");
        }
    }
}