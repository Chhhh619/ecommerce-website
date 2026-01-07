using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace Web_App_Dev_CW
{
    public partial class shop : System.Web.UI.Page
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
                string query = "SELECT DISTINCT Name, PricePerUnit, MIN(ProductPicture) AS ProductPicture FROM Product GROUP BY Name, PricePerUnit ORDER BY Name, PricePerUnit;";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        string productHtml = GenerateProductHtml(
                            reader["Name"].ToString(),
                            reader["PricePerUnit"].ToString(),
                            reader["ProductPicture"].ToString()
                        );

                        LiteralControl literal = new LiteralControl(productHtml);
                        productContainer.Controls.Add(literal);
                    }
                }
            }
        }
        private string GenerateProductHtml(string name, string price, string image)
        {
            string productHtml = $@"
<div class='containershop5'>
            <div class='newTag'>
                <h3>New</h3>
            </div>
            <img class='shopimage' src='{image}'/>
            <div class='itemname'>{name}</div>
            <div class='itemprice'>MYR{price}</div>
            <a  class='buybutton' href='buyIphonePro.aspx'>
Buy
</a>

</div>";

            return productHtml;
        }

    }
}