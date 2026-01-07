using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class buyMac : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ddlMacModel_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedModel = ddlMacModel.SelectedItem.Text;

            if (selectedModel == "MacBook Air")
            {
                SqlDataSource3.SelectCommand = "SELECT c.CapacityStorage FROM Capacity c WHERE c.CapacityNumericID IN ('2','3')";
                SqlDataSource6.SelectCommand = "SELECT ch.Chipset FROM Chipset ch WHERE ch.Chipset IN ('M2', 'M3')";
            }
            else if (selectedModel == "MacBook Pro")
            {
                SqlDataSource3.SelectCommand = "SELECT c.CapacityStorage FROM Capacity c WHERE c.CapacityNumericID IN ('3', '4','5')";
                SqlDataSource6.SelectCommand = "SELECT ch.Chipset FROM Chipset ch WHERE ch.Chipset IN ('M4', 'M4 Pro', 'M4 Max')";
                SqlDataSource2.SelectCommand = "SELECT co.ColourName FROM Colour co WHERE co.ColourNumericID IN ('12', '15')";
                SqlDataSource5.SelectCommand = "SELECT pa.PA_Watts FROM PowerAdapter pa WHERE pa.PowerAdapterNumericID IN ('3', '4')";
            }

            ddlMacChip.DataBind();
        }


        protected void ddlMacColor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlMacStorage_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            string model = ddlMacModel.SelectedValue;
            string chipset = ddlMacChip.SelectedValue;
            string colour = ddlMacColor.SelectedValue;
            string capacity = ddlMacStorage.SelectedValue;
            string memory = ddlMacMemory.SelectedValue;
            string power = ddlMacPower.SelectedValue;

            decimal price = GetProductPrice(model, capacity, chipset);

            if (price == -1)
            {
            
                lblErrorMessage.Text = "Product not found.";
                lblErrorMessage.Visible = true; 
                return;
            }

            if (!int.TryParse(txtQuantity.Text, out int quantity) || quantity <= 0)
            {
                lblErrorMessage.Text = "Invalid quantity. Please enter a valid number.";
                lblErrorMessage.Visible = true;
                return;
            }

            CartItem cartItem = new CartItem
            {
                Category = "Mac",
                ProductName = model,
                Chipset = chipset,
                Colour = colour,
                Capacity = capacity,
                Memory = memory,
                PowerAdapter = power,
                Quantity = quantity,
                Price = price
            };

            List<CartItem> cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            cart.Add(cartItem);

            Session["Cart"] = cart;

            Response.Redirect("shoppingCart.aspx");
        }

        private decimal GetProductPrice(string model, string storage, string chipset)
        {
            decimal price = -1;

            string query = "SELECT p.PricePerUnit " +
                           "FROM Product p " +
                           "JOIN Capacity c ON p.CapacityNumericID = c.CapacityNumericID " +
                           "JOIN Chipset ch ON p.ChipsetNumericID = ch.ChipsetNumericID " +
                           "WHERE p.Name = @Name AND c.CapacityStorage = @Capacity AND ch.Chipset = @Chipset";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", model);
                    cmd.Parameters.AddWithValue("@Capacity", storage);
                    cmd.Parameters.AddWithValue("@Chipset", chipset);

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


        protected void ddlMacMemory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlMacPower_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlMacChip_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }


}