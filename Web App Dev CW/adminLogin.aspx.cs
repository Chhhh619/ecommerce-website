using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Admin.admin
{
    public partial class adminLogin : System.Web.UI.Page
    {

        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Session.Clear();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (ValidateUser(username, password))
            {
                
                Session["UserName"] = username;

              
                Response.Redirect("adminDashboard.aspx");
            }
            else
            {
               
                lblError.Text = "Invalid username or password. Please try again.";
            }
        }

        private bool ValidateUser(string username, string password)
        {
            bool isValid = false;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Role FROM Account WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    conn.Open();
                    object role = cmd.ExecuteScalar();
                    if (role != null)
                    {
                        
                        Session["UserRole"] = role.ToString();
                        isValid = true;
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while validating the user: " + ex.Message;
                }
            }

            return isValid;
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("homePage1.aspx");
        }
    }
}