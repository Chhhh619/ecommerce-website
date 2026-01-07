using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class buyAirpods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            string engraving = ddlEngrave.SelectedValue;
            string noiseCancellation = ddlNoise.SelectedValue;
            string model = ddlModel.SelectedValue;

            decimal price = GetProductPrice(model, engraving, noiseCancellation);

            if (price == -1)
            {
                throw new Exception("Product not found.");
            }

            if (!int.TryParse(txtQuantity.Text, out int quantity) || quantity <= 0)
            {
                throw new Exception("Invalid quantity. Please enter a positive number.");
            }

            CartItem cartItem = new CartItem
            {
                Category = "AirPods",
                ProductName = model,
                Engraving = engraving,
                NoiseCancellation = noiseCancellation,
                Quantity = quantity,
                Price = price
            };

            List<CartItem> cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            cart.Add(cartItem);

            Session["Cart"] = cart;

            Response.Redirect("shoppingCart.aspx");
        }

        private decimal GetProductPrice(string model, string engraving, string noiseCancellation)
        {
            decimal price = -1; 

            string query = "SELECT PricePerUnit FROM Product WHERE Name = @Name";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", model); 

                    conn.Open();

                    var result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        price = Convert.ToDecimal(result);
                    }
                }
            }

            return price;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
        }


    }
}
