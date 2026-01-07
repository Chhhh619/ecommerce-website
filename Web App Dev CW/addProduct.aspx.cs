using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategoryDropdown();
                LoadColourDropdown();
                LoadDynamicDropdowns();
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "toggleFields", "toggleFields();", true);
        }
        private void LoadCategoryDropdown()
        {
            ddlCategory.Items.Clear();
            ddlCategory.Items.Add(new ListItem("Select Category", "0"));
            ddlCategory.Items.Add(new ListItem("iPhone", "1"));
            ddlCategory.Items.Add(new ListItem("MacBook", "2"));
            ddlCategory.Items.Add(new ListItem("AirPods", "3"));
        }


        private void LoadColourDropdown()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT ColourNumericID, ColourName FROM Colour", connection);
                SqlDataReader reader = command.ExecuteReader();

                ddlColour.Items.Clear();
                ddlColour.Items.Add(new ListItem("Select Colour", "0"));
                while (reader.Read())
                {
                    ddlColour.Items.Add(new ListItem(reader["ColourName"].ToString(), reader["ColourNumericID"].ToString()));
                }
            }
        }

        private void LoadCapacityDropdown()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT CapacityNumericID, CapacityStorage FROM Capacity", connection);
                SqlDataReader reader = command.ExecuteReader();

                ddlCapacity.Items.Clear();
                ddlCapacity.Items.Add(new ListItem("Select Capacity", "0"));
                while (reader.Read())
                {
                    ddlCapacity.Items.Add(new ListItem(reader["CapacityStorage"].ToString(), reader["CapacityNumericID"].ToString()));
                }
            }
        }

        private void LoadCapacityMacDropdown()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT CapacityNumericID, CapacityStorage FROM Capacity", connection);
                SqlDataReader reader = command.ExecuteReader();

                ddlCapacityMac.Items.Clear();
                ddlCapacityMac.Items.Add(new ListItem("Select Capacity", "0"));
                while (reader.Read())
                {
                    ddlCapacityMac.Items.Add(new ListItem(reader["CapacityStorage"].ToString(), reader["CapacityNumericID"].ToString()));
                }
            }
        }

        private void LoadChipsetDropdown()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT ChipsetNumericID, Chipset FROM Chipset", connection);
                SqlDataReader reader = command.ExecuteReader();

                ddlChipset.Items.Clear();
                ddlChipset.Items.Add(new ListItem("Select Chipset", "0"));
                while (reader.Read())
                {
                    ddlChipset.Items.Add(new ListItem(reader["Chipset"].ToString(), reader["ChipsetNumericID"].ToString()));
                }
            }
        }

        private void LoadMemoryDropdown()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT MemoryNumericID, MemorySize FROM Memory", connection);
                SqlDataReader reader = command.ExecuteReader();

                ddlMemory.Items.Clear();
                ddlMemory.Items.Add(new ListItem("Select Memory", "0"));
                while (reader.Read())
                {
                    ddlMemory.Items.Add(new ListItem(reader["MemorySize"].ToString(), reader["MemoryNumericID"].ToString()));
                }
            }
        }

        private void LoadPowerAdapterDropdown()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT PowerAdapterNumericID, PA_Watts FROM PowerAdapter", connection);
                SqlDataReader reader = command.ExecuteReader();

                ddlPowerAdapter.Items.Clear();
                ddlPowerAdapter.Items.Add(new ListItem("Select Power Adapter", "0"));
                while (reader.Read())
                {
                    ddlPowerAdapter.Items.Add(new ListItem(reader["PA_Watts"].ToString(), reader["PowerAdapterNumericID"].ToString()));
                }
            }
        }


        private void LoadDynamicDropdowns()
        {
            LoadDropdownData("Capacity", "CapacityNumericID", "CapacityStorage", ddlCapacity);
            LoadDropdownData("Capacity", "CapacityNumericID", "CapacityStorage", ddlCapacityMac);
            LoadDropdownData("Chipset", "ChipsetNumericID", "Chipset", ddlChipset);
            LoadDropdownData("Memory", "MemoryNumericID", "MemorySize", ddlMemory);
            LoadDropdownData("PowerAdapter", "PowerAdapterNumericID", "PA_Watts", ddlPowerAdapter);
            LoadDropdownData("NoiseCancellation", "NoiseCancellationNumericID", "NoiseCancellation", ddlNoiseCancellation);
            LoadDropdownData("Engraving", "EngravingNumericID", "Engraving", ddlEngraving);
        }

        private void LoadDropdownData(string tableName, string idColumn, string nameColumn, DropDownList dropdown)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = $"SELECT {idColumn}, {nameColumn} FROM {tableName}";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                dropdown.Items.Clear();
                dropdown.Items.Add(new ListItem("Select", "0"));
                while (reader.Read())
                {
                    dropdown.Items.Add(new ListItem(reader[nameColumn].ToString(), reader[idColumn].ToString()));
                }
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            int categoryID = int.Parse(ddlCategory.SelectedValue);
            int colourID = int.Parse(ddlColour.SelectedValue);
            string pricePerUnit = txtPrice.Text;
            string quantity = txtQuantity.Text;
            string imagePath = string.Empty;

            int? capacityID = null;
            int? chipsetID = null;
            int? memoryID = null;
            int? powerAdapterID = null;
            int? noiseCancellationID = null;
            int? engravingID = null;

            // Handle file upload
            if (fileUpload1.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileUpload1.PostedFile.FileName);
                    string savePath = Server.MapPath("image/" + fileName);
                    fileUpload1.SaveAs(savePath);
                    imagePath = "image/" + fileName;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error uploading image: " + ex.Message;
                    return;
                }
            }


            if (categoryID == 1)
            {
                capacityID = int.Parse(ddlCapacity.SelectedValue);
            }
            else if (categoryID == 2)
            {
                capacityID = int.Parse(ddlCapacityMac.SelectedValue);
            }

            if (categoryID == 2)
            {
                chipsetID = int.Parse(ddlChipset.SelectedValue);

                memoryID = int.Parse(ddlMemory.SelectedValue);
                powerAdapterID = int.Parse(ddlPowerAdapter.SelectedValue);
            }

            if (categoryID == 3)
            {
                noiseCancellationID = int.Parse(ddlNoiseCancellation.SelectedValue);
                engravingID = int.Parse(ddlEngraving.SelectedValue);
            }


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(
                    "INSERT INTO Product (Name, CategoryNumericID, ColourNumericID, PricePerUnit, Quantity, CapacityNumericID, ChipsetNumericID, MemoryNumericID, PowerAdapterNumericID, NoiseCancellationNumericID, EngravingNumericID,ProductPicture) " +
                    "VALUES (@Name, @CategoryID, @ColourID, @Price, @Quantity, @CapacityID, @ChipsetID, @MemoryID, @PowerAdapterID, @NoiseCancellationID, @EngravingID, @ProductPicture)",
                    connection);

                command.Parameters.AddWithValue("@Name", name);
                command.Parameters.AddWithValue("@CategoryID", categoryID);
                command.Parameters.AddWithValue("@ColourID", colourID);
                command.Parameters.AddWithValue("@Price", pricePerUnit);
                command.Parameters.AddWithValue("@Quantity", quantity);
                command.Parameters.AddWithValue("@CapacityID", capacityID > 0 ? (object)capacityID : DBNull.Value);
                command.Parameters.AddWithValue("@ChipsetID", chipsetID > 0 ? (object)chipsetID : DBNull.Value);
                command.Parameters.AddWithValue("@MemoryID", memoryID > 0 ? (object)memoryID : DBNull.Value);
                command.Parameters.AddWithValue("@PowerAdapterID", powerAdapterID > 0 ? (object)powerAdapterID : DBNull.Value);
                command.Parameters.AddWithValue("@NoiseCancellationID", noiseCancellationID > 0 ? (object)noiseCancellationID : DBNull.Value);
                command.Parameters.AddWithValue("@EngravingID", engravingID > 0 ? (object)engravingID : DBNull.Value);
                command.Parameters.AddWithValue("@ProductPicture", string.IsNullOrEmpty(imagePath) ? DBNull.Value : (object)imagePath);

                int result = command.ExecuteNonQuery();

                if (result > 0)
                {
                    lblMessage.Text = "Product added successfully!";

                    txtName.Text = string.Empty;
                    ddlCategory.SelectedIndex = 0;
                    ddlColour.SelectedIndex = 0;
                    txtPrice.Text = string.Empty;
                    txtQuantity.Text = string.Empty;
                    ddlCapacity.SelectedIndex = 0;
                    ddlChipset.SelectedIndex = 0;
                    ddlMemory.SelectedIndex = 0;
                    ddlPowerAdapter.SelectedIndex = 0;
                    ddlNoiseCancellation.SelectedIndex = 0;
                    ddlEngraving.SelectedIndex = 0;
                }
                else
                {
                    lblMessage.Text = "Failed to add product.";
                }
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {


            Response.Redirect("adminDashboard.aspx");

        }

        protected void btnAddColour_Click(object sender, EventArgs e)
        {
            string newColour = txtNewColour.Text.Trim();

            if (!string.IsNullOrEmpty(newColour))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("INSERT INTO Colour (ColourName) VALUES (@ColourName); SELECT SCOPE_IDENTITY();", connection);
                    command.Parameters.AddWithValue("@ColourName", newColour);

                    int newColourID = Convert.ToInt32(command.ExecuteScalar());
                    lblMessage.Text = "New Colour added successfully!";

                    txtNewColour.Text = string.Empty;
                    LoadColourDropdown();
                    ddlColour.SelectedValue = newColourID.ToString();
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid Colour.";
            }
        }

        protected void btnAddCapacity_Click(object sender, EventArgs e)
        {
            string newCapacity = txtNewCapacity.Text.Trim();

            if (!string.IsNullOrEmpty(newCapacity))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("INSERT INTO Capacity (CapacityStorage) VALUES (@CapacityStorage); SELECT SCOPE_IDENTITY();", connection);
                    command.Parameters.AddWithValue("@CapacityStorage", newCapacity);

                    int newCapacityID = Convert.ToInt32(command.ExecuteScalar());
                    lblMessage.Text = "New Capacity added successfully!";

                    txtNewCapacity.Text = string.Empty;
                    LoadCapacityDropdown();
                    ddlCapacity.SelectedValue = newCapacityID.ToString();
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid Capacity.";
            }
        }

        protected void btnAddCapacityMac_Click(object sender, EventArgs e)
        {
            string newCapacityMac = txtNewCapacityMac.Text.Trim();

            if (!string.IsNullOrEmpty(newCapacityMac))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("INSERT INTO Capacity (CapacityStorage) VALUES (@CapacityStorage); SELECT SCOPE_IDENTITY();", connection);
                    command.Parameters.AddWithValue("@CapacityStorage", newCapacityMac);

                    int newCapacityMacID = Convert.ToInt32(command.ExecuteScalar());
                    lblMessage.Text = "New Capacity for Mac added successfully!";

                    txtNewCapacityMac.Text = string.Empty;
                    LoadCapacityMacDropdown();
                    ddlCapacityMac.SelectedValue = newCapacityMacID.ToString();
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid Capacity for Mac.";
            }
        }

        protected void btnAddChipset_Click(object sender, EventArgs e)
        {
            string newChipset = txtNewChipset.Text.Trim();

            if (!string.IsNullOrEmpty(newChipset))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("INSERT INTO Chipset (Chipset) VALUES (@Chipset); SELECT SCOPE_IDENTITY();", connection);
                    command.Parameters.AddWithValue("@Chipset", newChipset);

                    int newChipsetID = Convert.ToInt32(command.ExecuteScalar());
                    lblMessage.Text = "New Chipset added successfully!";

                    txtNewChipset.Text = string.Empty;
                    LoadChipsetDropdown();
                    ddlChipset.SelectedValue = newChipsetID.ToString();
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid Chipset.";
            }
        }

        protected void btnAddMemory_Click(object sender, EventArgs e)
        {
            string newMemory = txtNewMemory.Text.Trim();

            if (!string.IsNullOrEmpty(newMemory))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("INSERT INTO Memory (MemorySize) VALUES (@MemorySize); SELECT SCOPE_IDENTITY();", connection);
                    command.Parameters.AddWithValue("@MemorySize", newMemory);

                    int newMemoryID = Convert.ToInt32(command.ExecuteScalar());
                    lblMessage.Text = "New Memory added successfully!";

                    txtNewMemory.Text = string.Empty;
                    LoadMemoryDropdown();
                    ddlMemory.SelectedValue = newMemoryID.ToString();
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid Memory.";
            }
        }

        protected void btnAddPowerAdapter_Click(object sender, EventArgs e)
        {
            string newPowerAdapter = txtNewPowerAdapter.Text.Trim();

            if (!string.IsNullOrEmpty(newPowerAdapter))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("INSERT INTO PowerAdapter (PA_Watts) VALUES (@PA_Watts); SELECT SCOPE_IDENTITY();", connection);
                    command.Parameters.AddWithValue("@PA_Watts", newPowerAdapter);

                    int newPowerAdapterID = Convert.ToInt32(command.ExecuteScalar());
                    lblMessage.Text = "New Power Adapter added successfully!";

                    txtNewPowerAdapter.Text = string.Empty;
                    LoadPowerAdapterDropdown();
                    ddlPowerAdapter.SelectedValue = newPowerAdapterID.ToString();
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid Power Adapter.";
            }
        }


    }
}