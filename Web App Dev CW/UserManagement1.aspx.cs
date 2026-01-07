using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.MDF;Integrated Security=True;Encrypt=False";

        // Show Admin Table
        protected void btnShowAdmin_Click(object sender, EventArgs e)
        {
            ShowAdminTable();
        }

        // Show Customer Table
        protected void btnShowCustomer_Click(object sender, EventArgs e)
        {
            ShowCustomerTable();
        }

        // Method to Display Admin Table
        private void ShowAdminTable()
        {
            gvAdminList.Visible = true;
            gvCustomerList.Visible = false;


        }

        // Method to Display Customer Table
        private void ShowCustomerTable()
        {
            gvAdminList.Visible = false;
            gvCustomerList.Visible = true;


        }


        protected void gvAdminList_Sorting(object sender, GridViewSortEventArgs e)
        {
            // Get the current sort direction and toggle it for the next sort
            string sortDirection = GetSortDirection(e.SortExpression);

            // Set the SelectCommand to include the sorting clause
            SqlDataSource2.SelectCommand = "SELECT a.AdminID, a.FirstName, a.LastName, a.PhoneNumber, a.PicturePath, b.Username " +
                                           "FROM Admin a " +
                                           "INNER JOIN Account b ON a.AccountNumericID = b.AccountNumericID " +
                                           "ORDER BY " + e.SortExpression + " " + sortDirection;
        }

        // Helper method to get sort direction (ascending or descending)
        private string GetSortDirection(string sortExpression)
        {
            string sortDirection = "ASC";
            string lastSortExpression = ViewState["SortExpression"] as string;

            if (lastSortExpression != null)
            {
                if (lastSortExpression == sortExpression)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if (lastDirection == "ASC")
                    {
                        sortDirection = "DESC";
                    }
                }
            }

            ViewState["SortExpression"] = sortExpression;
            ViewState["SortDirection"] = sortDirection;

            return sortDirection;
        }

        // Paging event for GridView
        protected void gvAdminList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAdminList.PageIndex = e.NewPageIndex;
        }

        // Row Editing event for GridView (for editing data directly in the grid)
        protected void gvAdminList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAdminList.EditIndex = e.NewEditIndex;
        }

        // Row Updating event for GridView (to save edited data to the database)
        protected void gvAdminList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Ensure the row index is valid
            if (e.RowIndex < 0 || e.RowIndex >= gvAdminList.Rows.Count)
            {
                // Handle invalid row index (optional)
                return;
            }

            GridViewRow row = gvAdminList.Rows[e.RowIndex]; // This ensures we get the correct row

            // Retrieve values from the TextBox controls in each cell of the row (if available)
            string firstName = string.Empty;
            string lastName = string.Empty;
            string phoneNumber = string.Empty;
            string userName = string.Empty;

            // First Name (Cell 1)
            if (row.Cells.Count > 1)
            {
                var firstNameTextBox = row.Cells[1].Controls.OfType<TextBox>().FirstOrDefault();
                if (firstNameTextBox != null)
                {
                    firstName = firstNameTextBox.Text.Trim();
                }
            }

            // Last Name (Cell 2)
            if (row.Cells.Count > 2)
            {
                var lastNameTextBox = row.Cells[2].Controls.OfType<TextBox>().FirstOrDefault();
                if (lastNameTextBox != null)
                {
                    lastName = lastNameTextBox.Text.Trim();
                }
            }

            // Phone Number (Cell 3)
            if (row.Cells.Count > 3)
            {
                var phoneNumberTextBox = row.Cells[3].Controls.OfType<TextBox>().FirstOrDefault();
                if (phoneNumberTextBox != null)
                {
                    phoneNumber = phoneNumberTextBox.Text.Trim();
                }
            }

            // Username (Cell 4)
            if (row.Cells.Count > 4)
            {
                var userNameTextBox = row.Cells[4].Controls.OfType<TextBox>().FirstOrDefault();
                if (userNameTextBox != null)
                {
                    userName = userNameTextBox.Text.Trim();
                }
            }

            // Get the AdminID for updating the record (from DataKey)
            string adminID = gvAdminList.DataKeys[e.RowIndex].Value.ToString();

            // Use a SqlConnection and SqlCommand to perform the update directly
            string connString = ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // 1st Update query: Admin Table
                string adminUpdateQuery = "UPDATE Admin SET FirstName = @FirstName, LastName = @LastName, PhoneNumber = @PhoneNumber WHERE AdminID = @AdminID";
                using (SqlCommand cmd = new SqlCommand(adminUpdateQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    cmd.Parameters.AddWithValue("@AdminID", adminID);
                    cmd.ExecuteNonQuery();
                }

                // 2nd Update query: Account Table
                string accountUpdateQuery = "UPDATE Account SET Username = @Username WHERE AccountNumericID = (SELECT AccountNumericID FROM Admin WHERE AdminID = @AdminID)";
                using (SqlCommand cmd = new SqlCommand(accountUpdateQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", userName);
                    cmd.Parameters.AddWithValue("@AdminID", adminID);
                    cmd.ExecuteNonQuery();
                }

                conn.Close();
            }

            // Exit edit mode
            gvAdminList.EditIndex = -1;
        }

        // Row Deleting event for GridView (to delete a row from the database)
        protected void gvAdminList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string adminID = gvAdminList.DataKeys[e.RowIndex].Value.ToString();

            // Delete the record from the database
            string query = "DELETE FROM Admin WHERE AdminID = @AdminID";
            string connString = ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@AdminID", adminID);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        // Row Canceling Edit event (to cancel the edit mode)
        protected void gvAdminList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAdminList.EditIndex = -1;
        }

        // SelectedIndexChanged event (when a row is selected)
        protected void gvAdminList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected row from GridView
            GridViewRow row = gvAdminList.SelectedRow;

            // Find the Label control that holds the PicturePath
            Label lblPicturePath = (Label)row.FindControl("lblPicturePath");

            if (lblPicturePath != null)
            {
                // Retrieve the image path from the label
                string picturePath = lblPicturePath.Text;

                // Check if the picturePath is not null or empty
                if (!string.IsNullOrEmpty(picturePath))
                {
                    // Set the ImageUrl of imgPreview to the picture path
                    imgPreview.ImageUrl = picturePath;

                    // Set the profile picture size (adjust width and height as needed)
                    imgPreview.Width = Unit.Pixel(150); // Example: 150px width
                    imgPreview.Height = Unit.Pixel(150); // Example: 150px height

                    // Optional: Add CSS class for additional styling
                    imgPreview.CssClass = "profile-picture";
                }
                else
                {
                    // If no picture is found, show a default image or handle it as needed
                    imgPreview.ImageUrl = "~/Images/default.jpg";  // Replace with your default image path
                    imgPreview.Width = Unit.Pixel(150);
                    imgPreview.Height = Unit.Pixel(150);
                }
            }
            else
            {
                // Handle the case where lblPicturePath is not found
                lblMessage.Text = "Picture path not found for the selected row.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

            // Optional: If you want to show other details in TextBoxes, you can do that here as well
            string adminID = row.Cells[1].Text; // Assuming AdminID is in the first column
            string firstName = row.Cells[2].Text;
            string lastName = row.Cells[3].Text;
            string phoneNumber = row.Cells[4].Text;

            // Display these details in TextBoxes if needed
            txtFirstName.Text = firstName;
            txtLastName.Text = lastName;
            txtPhoneNumber.Text = phoneNumber;
        }



        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                // Step 1: Retrieve values from the TextBox controls
                string firstName = txtFirstName.Text.Trim();
                string lastName = txtLastName.Text.Trim();
                string phoneNumber = txtPhoneNumber.Text.Trim();
                string userName = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();
                string role = ddlRole.SelectedValue;

                // Step 2: Handle file upload and save the file to the specified directory
                if (fileUpload.HasFile)
                {
                    string fileName = Path.GetFileName(fileUpload.FileName);
                    // Use a folder inside your web application for storing images
                    string folderPath = Server.MapPath("~/image/UserPicture/");

                    // Ensure the directory exists
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    // Combine the folder path with the file name
                    string filePath = Path.Combine(folderPath, fileName);

                    // Save the file to the folder
                    fileUpload.SaveAs(filePath);

                    // Step 3: Save the relative path to the database
                    string relativePath = "~/image/UserPicture/" + fileName;

                    // Step 4: Call your database method to save this data
                    SaveUserDetailsToDatabase(userName, password, role, firstName, lastName, phoneNumber, relativePath);

                    // Step 5: Show success message
                    lblMessage.Text = "File uploaded and data saved successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    // Step 6: Update the imgPreview control to display the uploaded image
                    imgPreview.ImageUrl = relativePath;
                    imgPreview.Width = 150; // Adjust to your preferred display size
                    imgPreview.Height = 150;
                }
                else
                {
                    lblMessage.Text = "Please select a file to upload.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                // Show error message if an exception occurs
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void SaveUserDetailsToDatabase(string userName, string password, string role, string firstName, string lastName, string phoneNumber, string picturePath)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Pineapple.MDF;Integrated Security=True;Encrypt=False";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Step 1: Check if the username already exists
                string checkQuery = "SELECT COUNT(1) FROM Account WHERE Username = @Username";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@Username", userName);
                    int count = (int)checkCmd.ExecuteScalar();
                    if (count > 0)
                    {
                        throw new Exception("Username already exists. Please use a different username.");
                    }
                }

                // Step 2: Insert into Account table and retrieve the generated AccountNumericID
                string accountInsertQuery = @"INSERT INTO Account (Username, Password, Role) 
                                       VALUES (@Username, @Password, @Role);
                                       SELECT SCOPE_IDENTITY();";

                int accountNumericID;
                using (SqlCommand accountCmd = new SqlCommand(accountInsertQuery, conn))
                {
                    accountCmd.Parameters.AddWithValue("@Username", userName);
                    accountCmd.Parameters.AddWithValue("@Password", password);
                    accountCmd.Parameters.AddWithValue("@Role", role);

                    accountNumericID = Convert.ToInt32(accountCmd.ExecuteScalar());
                }

                // Step 3: Insert into Admin table using the retrieved AccountNumericID
                string adminInsertQuery = @"INSERT INTO Admin (FirstName, LastName, PhoneNumber, AccountNumericID, PicturePath)
                                    VALUES (@FirstName, @LastName, @PhoneNumber, @AccountNumericID, @PicturePath)";

                using (SqlCommand adminCmd = new SqlCommand(adminInsertQuery, conn))
                {
                    adminCmd.Parameters.AddWithValue("@FirstName", firstName);
                    adminCmd.Parameters.AddWithValue("@LastName", lastName);
                    adminCmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    adminCmd.Parameters.AddWithValue("@AccountNumericID", accountNumericID);
                    adminCmd.Parameters.AddWithValue("@PicturePath", picturePath);

                    adminCmd.ExecuteNonQuery();
                }
            }
        }



        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtPhoneNumber.Text = "";
            txtUsername.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPassword.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowAdminTable();
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            SqlDataSource2.DataBind();
            gvAdminList.DataBind();
            SqlDataSource1.DataBind();
            gvCustomerList.DataBind();
        }
    }

}