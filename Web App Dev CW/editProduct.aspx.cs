using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllCategories();
            }
        }

        private void LoadAllCategories()
        {
            LoadIPhones();
            LoadMacBooks();
            LoadAirPods();
        }


        private void LoadIPhones()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
            SELECT 
                p.ProductID, 
                p.Name, 
                c.ColourName AS Colour, 
                p.PricePerUnit, 
                cap.CapacityStorage AS Capacity, 
                p.Quantity,
                p.ProductPicture
            FROM 
                Product p
            INNER JOIN 
                Colour c ON p.ColourNumericID = c.ColourNumericID
            INNER JOIN 
                Capacity cap ON p.CapacityNumericID = cap.CapacityNumericID
            WHERE 
                p.CategoryNumericID = 1";

                SqlCommand command = new SqlCommand(query, connection);

                SqlDataReader reader = command.ExecuteReader();
                gvIPhones.DataSource = reader;
                gvIPhones.DataBind();
            }
        }

        private void LoadMacBooks()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
            SELECT 
                p.ProductID, 
                p.Name, 
                c.ColourName AS Colour, 
                p.PricePerUnit, 
                m.MemorySize AS Memory, 
                ch.Chipset AS Chipset, 
                pa.PA_Watts AS PowerAdapter, 
                cap.CapacityStorage AS Capacity, 
                p.Quantity,
                p.ProductPicture
            FROM 
                Product p
            INNER JOIN 
                Colour c ON p.ColourNumericID = c.ColourNumericID
            LEFT JOIN 
                Memory m ON p.MemoryNumericID = m.MemoryNumericID
            LEFT JOIN 
                Chipset ch ON p.ChipsetNumericID = ch.ChipsetNumericID
            LEFT JOIN 
                PowerAdapter pa ON p.PowerAdapterNumericID = pa.PowerAdapterNumericID
            INNER JOIN 
                Capacity cap ON p.CapacityNumericID = cap.CapacityNumericID
            WHERE 
                p.CategoryNumericID = 2";

                SqlCommand command = new SqlCommand(query, connection);

                SqlDataReader reader = command.ExecuteReader();
                gvMacBooks.DataSource = reader;
                gvMacBooks.DataBind();
            }
        }

        private void LoadAirPods()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
            SELECT 
                p.ProductID, 
                p.Name, 
                p.Quantity,
                p.PricePerUnit, 
                nc.NoiseCancellation AS NoiseCancellation,
                e.Engraving AS Engraving,
                p.ProductPicture
            FROM 
                Product p
            INNER JOIN 
                Colour c ON p.ColourNumericID = c.ColourNumericID
            LEFT JOIN 
                NoiseCancellation nc ON p.NoiseCancellationNumericID = nc.NoiseCancellationNumericID
            LEFT JOIN 
                Engraving e ON p.EngravingNumericID = e.EngravingNumericID
            WHERE 
                p.CategoryNumericID = 3";

                SqlCommand command = new SqlCommand(query, connection);

                SqlDataReader reader = command.ExecuteReader();
                gvAirPods.DataSource = reader;
                gvAirPods.DataBind();
            }
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView gridView = (GridView)sender;
            gridView.EditIndex = e.NewEditIndex;

            if (gridView.ID == "gvIPhones")
                LoadIPhones();
            else if (gridView.ID == "gvMacBooks")
                LoadMacBooks();
            else if (gridView.ID == "gvAirPods")
                LoadAirPods();
        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView gridView = (GridView)sender;
            gridView.EditIndex = -1;

            if (gridView.ID == "gvIPhones")
                LoadIPhones();
            else if (gridView.ID == "gvMacBooks")
                LoadMacBooks();
            else if (gridView.ID == "gvAirPods")
                LoadAirPods();
        }

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridView gridView = (GridView)sender;
            GridViewRow row = gridView.Rows[e.RowIndex];

            string productIDValue = gridView.DataKeys[e.RowIndex]?.Value?.ToString();
            if (string.IsNullOrEmpty(productIDValue))
            {
                lblMessage.Text = "Product ID is missing or invalid.";
                return;
            }

            string quantity = ((TextBox)row.FindControl("txtQuantity"))?.Text;
            string price = ((TextBox)row.FindControl("txtPrice"))?.Text;

            if (string.IsNullOrWhiteSpace(quantity) || string.IsNullOrWhiteSpace(price))
            {
                lblMessage.Text = "Quantity and Price cannot be empty.";
                return;
            }

            if (!decimal.TryParse(quantity, out decimal parsedQuantity) || !decimal.TryParse(price, out decimal parsedPrice))
            {
                lblMessage.Text = "Quantity and Price must be valid numbers.";
                return;
            }

            FileUpload fileUpload = (FileUpload)row.FindControl("fileUploadImage");
            string newImagePath = null;

            if (fileUpload.HasFile)
            {
                try
                {
                    string fileExtension = System.IO.Path.GetExtension(fileUpload.FileName).ToLower();
                    if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                    {
                        string fileName = fileUpload.FileName;
                        string savePath = Server.MapPath("image/") + fileName;
                        fileUpload.SaveAs(savePath);
                        newImagePath = "image/" + fileName;
                    }
                    else
                    {
                        lblMessage.Text = "Only .jpg, .jpeg, and .png files are allowed.";
                        return;
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Image upload failed: " + ex.Message;
                    return;
                }
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string updateQuery = "UPDATE Product SET Quantity = @Quantity, PricePerUnit = @Price";
                if (!string.IsNullOrEmpty(newImagePath))
                {
                    updateQuery += ", ProductPicture = @ProductPicture";
                }
                updateQuery += " WHERE ProductID = @ProductID";

                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@Quantity", parsedQuantity);
                    command.Parameters.AddWithValue("@Price", parsedPrice);
                    command.Parameters.AddWithValue("@ProductID", productIDValue);

                    if (!string.IsNullOrEmpty(newImagePath))
                    {
                        command.Parameters.AddWithValue("@ProductPicture", newImagePath);
                    }

                    int result = command.ExecuteNonQuery();
                    lblMessage.Text = result > 0 ? "Details updated successfully!" : "Update failed.";
                }
            }

            gridView.EditIndex = -1;
            if (gridView.ID == "gvIPhones") LoadIPhones();
            else if (gridView.ID == "gvMacBooks") LoadMacBooks();
            else if (gridView.ID == "gvAirPods") LoadAirPods();
        }
    }
}