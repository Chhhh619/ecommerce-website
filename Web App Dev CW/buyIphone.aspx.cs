using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class buyIphone : System.Web.UI.Page
    {
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            string model = ddlModel.SelectedValue;
            string colour = ddlColor.SelectedValue;
            string capacity = ddlStorage.SelectedValue;

            decimal price = GetProductPrice(model, capacity);

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
                Category = "iPhone",
                ProductName = model,
                Colour = colour,
                Capacity = capacity,
                Quantity = quantity,
                Price = price
            };

            List<CartItem> cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            cart.Add(cartItem);

            Session["Cart"] = cart;

            Response.Redirect("shoppingCart.aspx");
        }

        private decimal GetProductPrice(string model, string storage)
        {
            decimal price = -1;

            string query = @"
        SELECT P.PricePerUnit 
        FROM Product P
        INNER JOIN Capacity C ON P.CapacityNumericID = C.CapacityNumericID
        WHERE P.Name = @Name AND C.CapacityStorage = @CapacityStorage";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", model);
                    cmd.Parameters.AddWithValue("@CapacityStorage", storage);

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

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ddlModel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ddlColor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ddlStorage_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}