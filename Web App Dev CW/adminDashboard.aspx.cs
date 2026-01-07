using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
                LoadMonthlySalesData();
            }
        }

        private void LoadDashboardData()
        {


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    decimal todaysSales = 0;
                    decimal yesterdaysSales = 0;
                    int todaysOrders = 0;
                    int yesterdaysOrders = 0;


                    string todaysSalesQuery = @"
                        SELECT SUM(CAST(TotalAmount AS FLOAT)) AS TodaySales 
                        FROM [dbo].[Order] 
                        WHERE CAST(OrderDateTime AS DATE) = CAST(GETDATE() AS DATE);";
                    using (SqlCommand command = new SqlCommand(todaysSalesQuery, connection))
                    {
                        object result = command.ExecuteScalar();
                        todaysSales = result != DBNull.Value ? Convert.ToDecimal(result) : 0;
                        todaysSalesLiteral.Text = "RM " + todaysSales.ToString("F2");
                    }


                    string todaysOrdersQuery = @"
                SELECT COUNT(*) AS TodayOrders 
                FROM [dbo].[Order] 
                WHERE CAST(OrderDateTime AS DATE) = CAST(GETDATE() AS DATE);";
                    using (SqlCommand command = new SqlCommand(todaysOrdersQuery, connection))
                    {
                        object result = command.ExecuteScalar();
                        todaysOrders = result != DBNull.Value ? Convert.ToInt32(result) : 0;
                        todaysOrdersLiteral.Text = todaysOrders.ToString();
                    }

                    string yesterdaysOrdersQuery = @"
                SELECT COUNT(*) AS YesterdayOrders 
                FROM [dbo].[Order] 
                WHERE CAST(OrderDateTime AS DATE) = CAST(GETDATE() - 1 AS DATE);";
                    using (SqlCommand command = new SqlCommand(yesterdaysOrdersQuery, connection))
                    {
                        object result = command.ExecuteScalar();
                        yesterdaysOrders = result != DBNull.Value ? Convert.ToInt32(result) : 0;
                    }


                    int orderDifference = todaysOrders - yesterdaysOrders;
                    string comparisonText;

                    if (orderDifference > 0)
                    {
                        comparisonText = $"{orderDifference} more than yesterday";
                    }
                    else if (orderDifference < 0)
                    {
                        comparisonText = $"{Math.Abs(orderDifference)} fewer than yesterday";
                    }
                    else
                    {
                        comparisonText = "Same as yesterday";
                    }


                    ordersComparisonLiteral.Text = $"<span style='color: {((orderDifference >= 0) ? "green" : "red")};'>{comparisonText}</span>";


                    string yesterdaysSalesQuery = @"
                        SELECT SUM(CAST(TotalAmount AS FLOAT)) AS YesterdaySales 
                        FROM [dbo].[Order] 
                        WHERE CAST(OrderDateTime AS DATE) = CAST(GETDATE() - 1 AS DATE);";
                    using (SqlCommand command = new SqlCommand(yesterdaysSalesQuery, connection))
                    {
                        object result = command.ExecuteScalar();
                        yesterdaysSales = result != DBNull.Value ? Convert.ToDecimal(result) : 0;
                    }


                    decimal salesGrowth = 0;
                    if (yesterdaysSales > 0)
                    {
                        salesGrowth = ((todaysSales - yesterdaysSales) / yesterdaysSales) * 100;
                    }


                    string growthColor = salesGrowth >= 0 ? "green" : "red";
                    string growthText = salesGrowth >= 0
                        ? $"Increased by +{salesGrowth:F2}% since yesterday"
                        : $"Decreased by {salesGrowth:F2}% since yesterday";

                    salesGrowthLiteral.Text = $"<span style='color: {growthColor};'>{growthText}</span>";


                    string allTimeSalesQuery = @"
                        SELECT SUM(CAST(TotalAmount AS FLOAT)) AS AllTimeSales 
                        FROM [dbo].[Order];";
                    using (SqlCommand command = new SqlCommand(allTimeSalesQuery, connection))
                    {
                        object result = command.ExecuteScalar();
                        decimal allTimeSales = result != DBNull.Value ? Convert.ToDecimal(result) : 0;
                        totalSalesAllTimeLiteral.Text = "RM " + allTimeSales.ToString("F2");
                    }


                    string totalUsersQuery = @"
                        SELECT COUNT(*) AS TotalUsers 
                        FROM [dbo].[Account];";
                    using (SqlCommand command = new SqlCommand(totalUsersQuery, connection))
                    {
                        object result = command.ExecuteScalar();
                        int totalUsers = result != DBNull.Value ? Convert.ToInt32(result) : 0;
                        totalUsersLiteral.Text = totalUsers.ToString();
                    }
                }
                catch (Exception ex)
                {

                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        private void LoadMonthlySalesData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string monthlySalesQuery = @"
    SELECT 
    FORMAT(o.OrderDateTime, 'yyyy-MM') AS Month,
    p.Name AS ProductName,
    SUM(CAST(od.Quantity AS INT) * CAST(od.PricePerUnit AS FLOAT)) AS TotalSales
FROM [dbo].[Order] o
JOIN [dbo].[OrderDetails] od ON o.OrderNumericID = od.OrderNumericID
JOIN [dbo].[Product] p ON od.ProductNumericID = p.ProductNumericID
GROUP BY FORMAT(o.OrderDateTime, 'yyyy-MM'), p.Name
ORDER BY Month, ProductName;";

                    using (SqlCommand command = new SqlCommand(monthlySalesQuery, connection))
                    {
                        SqlDataReader reader = command.ExecuteReader();
                        var salesData = new System.Collections.Generic.Dictionary<string, System.Collections.Generic.Dictionary<string, decimal>>();

                        while (reader.Read())
                        {
                            string month = reader["Month"].ToString();
                            string product = reader["ProductName"].ToString();
                            decimal totalSales = Convert.ToDecimal(reader["TotalSales"]);

                            if (!salesData.ContainsKey(month))
                            {
                                salesData[month] = new System.Collections.Generic.Dictionary<string, decimal>();
                            }

                            salesData[month][product] = totalSales;
                        }

                        reader.Close();

                        
                        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
                        string salesDataJson = jsSerializer.Serialize(salesData);

                        ClientScript.RegisterStartupScript(this.GetType(), "salesDataScript", $"window.salesData = {salesDataJson};", true);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        protected Literal todaysSalesLiteral;
        protected Literal todaysOrdersLiteral;
        protected Literal totalSalesAllTimeLiteral;
        protected Literal totalUsersLiteral;
    }
}