using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using System.Web.UI;

namespace Web_App_Dev_CW
{
    public partial class checkout : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                string username = Session["UserName"].ToString();
                LoadUserInfo(username);
                LoadTotalPrice();
            }
        }

        private void LoadUserInfo(string username)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT AccountNumericID FROM Account WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                try
                {
                    conn.Open();
                    object accountNumericIdObj = cmd.ExecuteScalar();
                    if (accountNumericIdObj != null)
                    {
                        int accountNumericId = Convert.ToInt32(accountNumericIdObj);

                        string customerQuery = "SELECT FirstName, LastName, PhoneNum, Email FROM Customer WHERE AccountNumericID = @AccountNumericID";
                        SqlCommand customerCmd = new SqlCommand(customerQuery, conn);
                        customerCmd.Parameters.AddWithValue("@AccountNumericID", accountNumericId);

                        SqlDataReader reader = customerCmd.ExecuteReader();
                        if (reader.Read())
                        {
                            firstNameTextBox.Text = reader["FirstName"].ToString();
                            lastNameTextBox.Text = reader["LastName"].ToString();
                            phoneNumberTextBox.Text = reader["PhoneNum"].ToString();
                            emailTextBox.Text = reader["Email"].ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while loading user information: " + ex.Message;
                }
            }
        }

        private void LoadTotalPrice()
        {
            if (Session["TotalPrice"] != null)
            {
                string totalPrice = Session["TotalPrice"].ToString();
                totalPriceLbl.Text = "Total: " + totalPrice;
            }
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
            List<CartItem> cart = Session["Cart"] as List<CartItem>;
            if (cart == null || cart.Count == 0)
            {
                lblError.Text = "Your cart is empty. Please add items to your cart.";
                return;
            }

            string address = addressTextBox.Text.Trim();

            decimal totalAmount = 0;
            foreach (var item in cart)
            {
                totalAmount += item.Price * item.Quantity;
            }

            string username = Session["UserName"].ToString();
            int customerNumericID = GetCustomerNumericId(username);
            if (customerNumericID == 0)
            {
                lblError.Text = "An error occurred while retrieving user information.";
                return;
            }


            string paymentMethod = DropDownList1.SelectedValue;
            int paymentNumericID = SavePayment(totalAmount, paymentMethod);

            if (paymentNumericID == 0)
            {
                lblError.Text = "An error occurred while processing the payment.";
                return;
            }

            int orderId = InsertOrder(customerNumericID, totalAmount, address, paymentNumericID);

            foreach (var item in cart)
            {
                int productNumericId = GetProductNumericId(item);

                if (productNumericId == 0)
                {
                    lblError.Text = $"Error: Product '{item.ProductName}' not found in the database.";
                    return;
                }

                InsertOrderDetails(productNumericId, item.Quantity, item.Price, orderId);

                UpdateProductStock(productNumericId, item.Quantity);
            }

            Session["Cart"] = null;

            lblError.Text = "Your order has been placed successfully!";
        }


        private int GetCustomerNumericId(string username)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT AccountNumericID FROM Account WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        int accountNumericId = Convert.ToInt32(result);

                        string customerQuery = "SELECT CustomerNumericID FROM Customer WHERE AccountNumericID = @AccountNumericID";
                        SqlCommand customerCmd = new SqlCommand(customerQuery, conn);
                        customerCmd.Parameters.AddWithValue("@AccountNumericID", accountNumericId);

                        object customerResult = customerCmd.ExecuteScalar();
                        return customerResult != null ? Convert.ToInt32(customerResult) : 0;
                    }
                    else
                    {
                        return 0;
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while retrieving customer information: " + ex.Message;
                    return 0;
                }
            }
        }
        private int InsertOrder(int CustomerNumericID, decimal totalAmount, string Address, int PaymentNumericID)
        {


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO [Order] (OrderDateTime, TotalAmount, Address, CustomerNumericID, PaymentNumericID) " +
                               "VALUES (@OrderDateTime, @TotalAmount, @Address, @CustomerNumericID, @PaymentNumericID); " +
                               "SELECT SCOPE_IDENTITY();";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@OrderDateTime", DateTime.Now);
                cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                cmd.Parameters.AddWithValue("@Address", Address);
                cmd.Parameters.AddWithValue("@CustomerNumericID", CustomerNumericID);
                cmd.Parameters.AddWithValue("@PaymentNumericID", PaymentNumericID);

                try
                {
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar()); // Return the OrderNumericID
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while creating the order: " + ex.Message;
                    return 0;
                }
            }
        }
        private void InsertOrderDetails(int productNumericId, int quantity, decimal pricePerUnit, int orderNumericId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO OrderDetails (Quantity, PricePerUnit, ProductNumericID, OrderNumericID) " +
                               "VALUES (@Quantity, @PricePerUnit, @ProductNumericID, @OrderNumericID)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@PricePerUnit", pricePerUnit);
                cmd.Parameters.AddWithValue("@ProductNumericID", productNumericId);
                cmd.Parameters.AddWithValue("@OrderNumericID", orderNumericId); // Set OrderNumericID parameter

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery(); // Execute the insert query
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while inserting order details: " + ex.Message;
                }
            }
        }

        private void UpdateProductStock(int productNumericId, int quantityOrdered)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Product SET Quantity = Quantity - @QuantityOrdered WHERE ProductNumericID = @ProductNumericID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@QuantityOrdered", quantityOrdered);
                cmd.Parameters.AddWithValue("@ProductNumericID", productNumericId);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while updating product stock: " + ex.Message;
                }
            }
        }
        private int GetProductNumericId(CartItem item)
        {

            string connString = ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd;

                int? capacityId = null, colourId = null, memoryId = null, powerAdapterId = null, chipsetId = null;
                int? engravingId = null, noiseCancellationId = null;

                if (item.Category == "AirPods")
                {
                    cmd = new SqlCommand("SELECT EngravingNumericID FROM Engraving WHERE Engraving = @Engraving", conn);
                    cmd.Parameters.AddWithValue("@Engraving", item.Engraving);
                    engravingId = cmd.ExecuteScalar() as int?;

                    cmd = new SqlCommand("SELECT NoiseCancellationNumericID FROM NoiseCancellation WHERE NoiseCancellation = @NoiseCancellation", conn);
                    cmd.Parameters.AddWithValue("@NoiseCancellation", item.NoiseCancellation);
                    noiseCancellationId = cmd.ExecuteScalar() as int?;
                }
                else if (item.Category == "iPhone" || item.Category == "Mac")
                {
                    cmd = new SqlCommand("SELECT CapacityNumericID FROM Capacity WHERE CapacityStorage = @Capacity", conn);
                    cmd.Parameters.AddWithValue("@Capacity", item.Capacity);
                    capacityId = cmd.ExecuteScalar() as int?;

                    // Resolve ColourNumericID
                    cmd = new SqlCommand("SELECT ColourNumericID FROM Colour WHERE ColourName = @Colour", conn);
                    cmd.Parameters.AddWithValue("@Colour", item.Colour);
                    colourId = cmd.ExecuteScalar() as int?;
                }

                if (item.Category == "Mac")
                {
                    // Resolve MemoryNumericID
                    cmd = new SqlCommand("SELECT MemoryNumericID FROM Memory WHERE MemorySize = @Memory", conn);
                    cmd.Parameters.AddWithValue("@Memory", item.Memory);
                    memoryId = cmd.ExecuteScalar() as int?;

                    // Resolve PowerAdapterNumericID
                    cmd = new SqlCommand("SELECT PowerAdapterNumericID FROM PowerAdapter WHERE PA_Watts = @PowerAdapter", conn);
                    cmd.Parameters.AddWithValue("@PowerAdapter", item.PowerAdapter);
                    powerAdapterId = cmd.ExecuteScalar() as int?;

                    // Resolve ChipsetNumericID
                    cmd = new SqlCommand("SELECT ChipsetNumericID FROM Chipset WHERE Chipset = @Chipset", conn);
                    cmd.Parameters.AddWithValue("@Chipset", item.Chipset);
                    chipsetId = cmd.ExecuteScalar() as int?;
                }

                // Validate all resolved IDs
                if ((item.Category == "AirPods" && (engravingId == null || noiseCancellationId == null)) ||
                    (item.Category == "iPhone" && (capacityId == null || colourId == null)) ||
                    (item.Category == "Mac" && (capacityId == null || colourId == null || memoryId == null || powerAdapterId == null || chipsetId == null)))
                {
                    return 0; // Return 0 if any required ID is missing
                }

                string productQuery = "SELECT ProductNumericID FROM Product WHERE Name = @Name";
                if (item.Category == "AirPods")
                {
                    productQuery += " AND EngravingNumericID = @EngravingID AND NoiseCancellationNumericID = @NoiseCancellationID";
                }
                else if (item.Category == "iPhone")
                {
                    productQuery += " AND CapacityNumericID = @CapacityID AND ColourNumericID = @ColourID";
                }
                else if (item.Category == "Mac")
                {
                    productQuery += " AND CapacityNumericID = @CapacityID AND ColourNumericID = @ColourID AND MemoryNumericID = @MemoryID AND PowerAdapterNumericID = @PowerAdapterID AND ChipsetNumericID = @ChipsetID";
                }

                cmd = new SqlCommand(productQuery, conn);
                cmd.Parameters.AddWithValue("@Name", item.ProductName);
                if (item.Category == "AirPods")
                {
                    cmd.Parameters.AddWithValue("@EngravingID", engravingId);
                    cmd.Parameters.AddWithValue("@NoiseCancellationID", noiseCancellationId);
                }
                else if (item.Category == "iPhone" || item.Category == "Mac")
                {
                    cmd.Parameters.AddWithValue("@CapacityID", capacityId);
                    cmd.Parameters.AddWithValue("@ColourID", colourId);
                }
                if (item.Category == "Mac")
                {
                    cmd.Parameters.AddWithValue("@MemoryID", memoryId);
                    cmd.Parameters.AddWithValue("@PowerAdapterID", powerAdapterId);
                    cmd.Parameters.AddWithValue("@ChipsetID", chipsetId);
                }

                object result = cmd.ExecuteScalar();
                return result != null ? Convert.ToInt32(result) : 0;
            }
        }

        private int SavePayment(decimal amountPaid, string paymentMethod)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Payment (AmountPaid, PaymentMethod) " +
                               "VALUES (@AmountPaid, @PaymentMethod); " +
                               "SELECT SCOPE_IDENTITY();";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@AmountPaid", amountPaid);
                cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);

                try
                {
                    conn.Open();
                    return Convert.ToInt32(cmd.ExecuteScalar()); // Return the PaymentNumericID
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred while saving payment: " + ex.Message;
                    return 0;
                }
            }
        }
    }
}
