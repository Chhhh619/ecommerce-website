using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class customerRegistration : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hfRole.Value = "Customer";
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFirstName.Text) ||
                string.IsNullOrWhiteSpace(txtLastName.Text) ||
                string.IsNullOrWhiteSpace(txtContactNumber.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtUsername.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblError.Text = "All fields are required.";
                lblError.CssClass = "error-label"; // Red color for errors
                return;
            }

            string contactNumber = txtContactNumber.Text.Trim();
            if (!System.Text.RegularExpressions.Regex.IsMatch(contactNumber, @"^\d{9,10}$"))
            {
                lblError.Text = "Contact number must be valid (9-10 digits).";
                lblError.CssClass = "error-label";
                return;
            }

            string email = txtEmail.Text.Trim();
            if (!System.Text.RegularExpressions.Regex.IsMatch(email, @"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                lblError.Text = "Invalid email format.";
                lblError.CssClass = "error-label"; // Red color for errors
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            string accountQuery = "INSERT INTO Account (Username, Password, Role) OUTPUT INSERTED.AccountNumericID VALUES (@Username, @Password, @Role)";
                            SqlCommand accountCmd = new SqlCommand(accountQuery, conn, transaction);
                            accountCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                            accountCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                            accountCmd.Parameters.AddWithValue("@Role", hfRole.Value);

                            int accountNumericID = (int)accountCmd.ExecuteScalar();

                            string customerQuery = @"
                            INSERT INTO Customer 
                            (LastName, FirstName, PhoneNum, Email, AccountNumericID) 
                            VALUES 
                            (@LastName, @FirstName, @PhoneNum, @Email, @AccountNumericID)";

                            SqlCommand customerCmd = new SqlCommand(customerQuery, conn, transaction);
                            customerCmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                            customerCmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                            customerCmd.Parameters.AddWithValue("@PhoneNum", txtContactNumber.Text.Trim());
                            customerCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                            customerCmd.Parameters.AddWithValue("@AccountNumericID", accountNumericID);

                            customerCmd.ExecuteNonQuery();

                            transaction.Commit();
                            lblError.Text = "Registration successful!";
                            lblError.CssClass = "success-label"; // Black color for success
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            lblError.Text = "Registration failed. Error: " + ex.Message;
                            lblError.CssClass = "error-label"; // Red color for errors
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
                lblError.CssClass = "error-label"; // Red color for errors
            }
        }
    }
}
