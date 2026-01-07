using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Get the input from the search textbox
            string searchQuery = t1.Text.Trim();

            // Perform some action with the search query
            // Example: Redirect to a search results page
            if (!string.IsNullOrEmpty(searchQuery))
            {
                Response.Redirect($"SearchResults.aspx?query={Server.UrlEncode(searchQuery)}");
            }
            else
            {
                // Handle the case where the search box is empty
                // For example, display an error message
            }
        }
    }
}