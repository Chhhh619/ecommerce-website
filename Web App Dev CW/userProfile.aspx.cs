using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class userProfile : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null)
            {

                Response.Redirect("login.aspx?returnUrl=userProfile.aspx");
            }

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            string username = Session["UserName"]?.ToString();
            if (string.IsNullOrEmpty(username))
            {
                lblError.Text = "Session expired. Please log in again.";
                Response.Redirect("login.aspx");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT FirstName, LastName, Email, PhoneNum, Username FROM Customer INNER JOIN Account ON Customer.AccountNumericID = Account.AccountNumericID WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtFirstName.Text = reader["FirstName"].ToString();
                        txtLastName.Text = reader["LastName"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                        txtPhone.Text = reader["PhoneNum"].ToString();
                        txtUsername.Text = reader["Username"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred: " + ex.Message;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblError.Text = string.Empty;
            lblMessage.Text = string.Empty;

            string username = Session["UserName"]?.ToString();

            if (string.IsNullOrEmpty(username))
            {
                lblError.Text = "Session expired. Please log in again.";
                Response.Redirect("login.aspx");
                return;
            }


            string email = txtEmail.Text.Trim();
            if (!System.Text.RegularExpressions.Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblError.Text = "Please enter a valid email address.";
                return;
            }


            string phone = txtPhone.Text.Trim();
            if (!System.Text.RegularExpressions.Regex.IsMatch(phone, @"^\d{9,10}$"))
            {
                lblError.Text = "Phone number must be 9 to 10 digits.";
                return;
            }


            string newPassword = txtPassword.Text.Trim();
            if (string.IsNullOrEmpty(newPassword))
            {
                lblError.Text = "New password cannot be empty. Please enter a valid password.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {

                string validatePasswordQuery = "SELECT Password FROM Account WHERE Username = @Username";
                SqlCommand validateCmd = new SqlCommand(validatePasswordQuery, conn);
                validateCmd.Parameters.AddWithValue("@Username", username);

                try
                {
                    conn.Open();
                    string currentPasswordInDb = validateCmd.ExecuteScalar()?.ToString();

                    if (currentPasswordInDb != txtOldPassword.Text.Trim())
                    {
                        lblError.Text = "Current password is incorrect. Please try again.";
                        return;
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while validating the current password: " + ex.Message;
                    return;
                }


                string updateCustomerQuery = @"UPDATE Customer 
                                   SET FirstName = @FirstName, 
                                       LastName = @LastName, 
                                       Email = @Email, 
                                       PhoneNum = @PhoneNum 
                                   WHERE AccountNumericID = (SELECT AccountNumericID FROM Account WHERE Username = @Username)";

                string updateAccountQuery = @"UPDATE Account 
                                   SET Username = @NewUsername, 
                                       Password = @NewPassword 
                                   WHERE Username = @Username";

                SqlCommand cmdCustomer = new SqlCommand(updateCustomerQuery, conn);
                SqlCommand cmdAccount = new SqlCommand(updateAccountQuery, conn);


                cmdCustomer.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                cmdCustomer.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                cmdCustomer.Parameters.AddWithValue("@Email", email);
                cmdCustomer.Parameters.AddWithValue("@PhoneNum", phone);
                cmdCustomer.Parameters.AddWithValue("@Username", username);


                cmdAccount.Parameters.AddWithValue("@NewUsername", txtUsername.Text.Trim());
                cmdAccount.Parameters.AddWithValue("@NewPassword", newPassword);
                cmdAccount.Parameters.AddWithValue("@Username", username);

                try
                {

                    cmdCustomer.ExecuteNonQuery();
                    cmdAccount.ExecuteNonQuery();

                    lblMessage.Text = "Profile updated successfully!";
                    Session["UserName"] = txtUsername.Text.Trim();
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while updating the profile: " + ex.Message;
                }
            }
        }
    }
}