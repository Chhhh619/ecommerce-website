using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class airpodsDetail : System.Web.UI.Page
    {
        protected HtmlGenericControl productContainer;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }
        private void LoadProducts()
        {
            string connString = ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = "SELECT DISTINCT p.Name, p.ColourNumericID, p.ProductPicture, c.ColourName FROM Product p JOIN Colour c ON p.ColourNumericID = c.ColourNumericID WHERE p.Name IN ('AirPods 4', 'AirPods Pro')";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        string productHtml = GenerateProductHtml(
                            reader["Name"].ToString(),
                            reader["ColourName"].ToString(),
                            reader["ProductPicture"].ToString()
                        );

                        LiteralControl literal = new LiteralControl(productHtml);
                        productContainer.Controls.Add(literal);
                    }
                }
            }
        }
        private string GenerateProductHtml(string name, string colour, string image)
        {
            string productHtml = $@"
<div class='containershop5'>
            <div class='newTag'>
                <h3>New</h3>
            </div>
            <img class='shopimage' src='{image}'/>
            <div class='itemname'>{name}</div>
            <div class='itemprice'>{colour}</div>
            <a  class='buybutton' href='buyAirpods.aspx'>
Buy
</a>

</div>";

            return productHtml;
        }

    }
}