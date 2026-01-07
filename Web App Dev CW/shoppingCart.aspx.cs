using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_App_Dev_CW
{
    public partial class shoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string category = (e.Row.DataItem as dynamic)?.Category;

                e.Row.Cells[1].Visible = category == "iPhone" || category == "Mac";
                e.Row.Cells[2].Visible = category == "iPhone" || category == "Mac";
                e.Row.Cells[3].Visible = category == "Mac";
                e.Row.Cells[4].Visible = category == "Mac";
                e.Row.Cells[5].Visible = category == "Mac";
                e.Row.Cells[6].Visible = category == "AirPods";
                e.Row.Cells[7].Visible = category == "AirPods";
            }
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                List<CartItem> cart = Session["Cart"] as List<CartItem>;
                if (cart != null && index >= 0 && index < cart.Count)
                {
                    cart.RemoveAt(index);
                    Session["Cart"] = cart;

                    LoadCart();
                }
            }
        }

        protected void ddlQuantity_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;

            int index = row.RowIndex;
            int newQuantity = int.Parse(ddl.SelectedValue);

            List<CartItem> cart = Session["Cart"] as List<CartItem>;
            if (cart != null && index >= 0 && index < cart.Count)
            {
                cart[index].Quantity = newQuantity;
                Session["Cart"] = cart;

                LoadCart();
            }
        }

        private void LoadCart()
        {
            List<CartItem> cart = Session["Cart"] as List<CartItem>;

            if (cart != null && cart.Count > 0)
            {
                gvCart.DataSource = cart.Select((item, index) => new
                {
                    Index = index,
                    item.ProductName,
                    item.Category,
                    Colour = (item.Category == "iPhone" || item.Category == "Mac") ? item.Colour : null,
                    Capacity = (item.Category == "iPhone" || item.Category == "Mac") ? item.Capacity : null,
                    Chipset = item.Category == "Mac" ? item.Chipset : null,
                    Memory = item.Category == "Mac" ? item.Memory : null,
                    PowerAdapter = item.Category == "Mac" ? item.PowerAdapter : null,
                    Engraving = item.Category == "AirPods" ? item.Engraving : null,
                    NoiseCancellation = item.Category == "AirPods" ? item.NoiseCancellation : null,
                    item.Quantity,
                    item.Price,
                    Total = item.Price * item.Quantity
                }).ToList();

                gvCart.DataBind();

                decimal totalAmount = cart.Sum(item => item.Price * item.Quantity);
                decimal monthlyCost = totalAmount / 24;

                Session["TotalPrice"] = totalAmount.ToString("F2");

                ttlLbl.Text = totalAmount.ToString("F2");
                ttlMonthLbl.Text = monthlyCost.ToString("F2");
                lblMessage.Text = string.Empty;
                gvCart.Visible = true;

                foreach (GridViewRow row in gvCart.Rows)
                {
                    string category = (row.DataItem as dynamic)?.Category ?? string.Empty;

                    gvCart.Columns[1].Visible = category == "iPhone" || category == "Mac";
                    gvCart.Columns[2].Visible = category == "iPhone" || category == "Mac";
                    gvCart.Columns[3].Visible = category == "Mac";
                    gvCart.Columns[4].Visible = category == "Mac";
                    gvCart.Columns[5].Visible = category == "Mac";
                    gvCart.Columns[6].Visible = category == "AirPods";
                    gvCart.Columns[7].Visible = category == "AirPods";
                }
            }
            else
            {
                gvCart.Visible = false;
                lblMessage.Text = "Your cart is empty.";
                lblMessage.CssClass = "alert alert-info";
                ttlLbl.Text = "0.00";
                ttlMonthLbl.Text = "0.00";
            }

        }

        private void UpdateProductStock(List<CartItem> cart)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                foreach (CartItem item in cart)
                {
                    string updateQuery = "UPDATE Products SET Stock = Stock - @Quantity WHERE ProductName = @ProductName";
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Quantity", item.Quantity);
                        cmd.Parameters.AddWithValue("@ProductName", item.ProductName);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }

        protected void btnDecrement_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int index = Convert.ToInt32(btn.CommandArgument);

            List<CartItem> cart = Session["Cart"] as List<CartItem>;
            if (cart != null && index >= 0 && index < cart.Count)
            {
                if (cart[index].Quantity > 1)
                {
                    cart[index].Quantity--;
                    Session["Cart"] = cart;
                    LoadCart();
                }
            }
        }

        protected void btnIncrement_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int index = Convert.ToInt32(btn.CommandArgument);

            List<CartItem> cart = Session["Cart"] as List<CartItem>;
            if (cart != null && index >= 0 && index < cart.Count)
            {
                cart[index].Quantity++;
                Session["Cart"] = cart;
                LoadCart();
            }
        }

        protected void checkoutBtn_Click1(object sender, EventArgs e)
        {
            Response.Redirect("checkout.aspx");
        }
    }
}
