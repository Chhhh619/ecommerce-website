using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.admin
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateProductsDropdown();
            }
        }

        private void PopulateProductsDropdown()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                
                string query = @"
            SELECT 
                Product.ProductNumericID, 
                CASE 
                    WHEN CategoryNumericID = 1 THEN CONCAT(Name, ' - ', Colour.ColourName, ' - ', Capacity.CapacityStorage) -- iPhone
                    WHEN CategoryNumericID = 2 THEN CONCAT(Name, ' - ', Colour.ColourName, ' - ', Chipset.Chipset,' Chip', ' - ', Memory.MemorySize, ' RAM - ', Capacity.CapacityStorage, ' SSD Storage', ' - ', PowerAdapter.PA_Watts, ' Adapter') -- MacBook
                    WHEN CategoryNumericID = 3 THEN CONCAT(Name, ' - ', ' Noise Cancellation: ', NoiseCancellation.NoiseCancellation, ' - Engraving: ', Engraving.Engraving) -- AirPods
                    ELSE Name -- Fallback for other categories
                END AS ProductDetails
            FROM Product
            LEFT JOIN Colour ON Product.ColourNumericID = Colour.ColourNumericID
            LEFT JOIN Capacity ON Product.CapacityNumericID = Capacity.CapacityNumericID
            LEFT JOIN Chipset ON Product.ChipsetNumericID = Chipset.ChipsetNumericID
            LEFT JOIN Memory ON Product.MemoryNumericID = Memory.MemoryNumericID
            LEFT JOIN PowerAdapter ON Product.PowerAdapterNumericID = PowerAdapter.PowerAdapterNumericID
            LEFT JOIN NoiseCancellation ON Product.NoiseCancellationNumericID = NoiseCancellation.NoiseCancellationNumericID
            LEFT JOIN Engraving ON Product.EngravingNumericID = Engraving.EngravingNumericID";

                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    ddlProducts.DataSource = reader;
                    ddlProducts.DataTextField = "ProductDetails";
                    ddlProducts.DataValueField = "ProductNumericID"; 
                    ddlProducts.DataBind();

                    reader.Close();

                    ddlProducts.Items.Insert(0, new ListItem("Select Product", "0"));
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading products: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (ddlProducts.Items.Count == 0)
            {
                lblMessage.Text = "No products available to remove.";
                lblMessage.CssClass = "text-warning";
                return;
            }

            int productId = int.Parse(ddlProducts.SelectedValue);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Product WHERE ProductNumericID = @ProductNumericID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ProductNumericID", productId);

                try
                {
                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Product removed successfully!";
                        lblMessage.CssClass = "text-success";

                       
                        PopulateProductsDropdown();
                    }
                    else
                    {
                        lblMessage.Text = "Error: Product could not be removed.";
                        lblMessage.CssClass = "text-danger";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminDashboard.aspx");
        }
    }
}