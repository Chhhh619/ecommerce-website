using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.MDF;Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string phoneNumber = txtPhoneNumber.Text.Trim();
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string role = ddlRole.SelectedValue; 
            string picturePath = null;

            
            if (!System.Text.RegularExpressions.Regex.IsMatch(phoneNumber, @"^\d{10}$"))
            {
                lblError.Text = "Phone number must be exactly 10 digits.";
                lblError.ForeColor = System.Drawing.Color.Red;
                return; 
            }

            try
            {
               
                if (fileUpload.HasFile)
                {
                    try
                    {
                        
                        string folderPath = Server.MapPath("~/UploadedImages/");
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }

                        
                        string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                        string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(fileName);
                        picturePath = "~/UploadedImages/" + uniqueFileName;

                        
                        string fullPath = Path.Combine(folderPath, uniqueFileName);
                        fileUpload.SaveAs(fullPath);

                        
                        imgPreview.ImageUrl = picturePath;
                        imgPreview.Width = 150;
                        imgPreview.Height = 150;
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "Error uploading the image: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                        return; 
                    }
                }

                
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            
                            string accountQuery = "INSERT INTO Account (Username, Password, Role) OUTPUT INSERTED.AccountNumericID VALUES (@Username, @Password, @Role)";
                            SqlCommand accountCmd = new SqlCommand(accountQuery, conn, transaction);
                            accountCmd.Parameters.AddWithValue("@Username", username);
                            accountCmd.Parameters.AddWithValue("@Password", password);
                            accountCmd.Parameters.AddWithValue("@Role", role);

                            int accountNumericID = (int)accountCmd.ExecuteScalar();

                           
                            string adminQuery = "INSERT INTO Admin (AccountNumericID, FirstName, LastName, PhoneNumber, PicturePath) VALUES (@AccountNumericID, @FirstName, @LastName, @PhoneNumber, @PicturePath)";
                            SqlCommand adminCmd = new SqlCommand(adminQuery, conn, transaction);
                            adminCmd.Parameters.AddWithValue("@AccountNumericID", accountNumericID);
                            adminCmd.Parameters.AddWithValue("@FirstName", firstName);
                            adminCmd.Parameters.AddWithValue("@LastName", lastName);
                            adminCmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                            adminCmd.Parameters.AddWithValue("@PicturePath", picturePath ?? (object)DBNull.Value);

                            adminCmd.ExecuteNonQuery();

                            transaction.Commit();
                            lblError.Text = "Registration successful!";
                            lblError.ForeColor = System.Drawing.Color.Green;
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            lblError.Text = "Registration failed. Error: " + ex.Message;
                            lblError.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = $"Error: {ex.Message}";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminLogin.aspx");
        }
    }
}