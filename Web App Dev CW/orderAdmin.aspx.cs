using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrders();
            }
        }

        
        private DataTable GetOrders()
        {
            DataTable dt = new DataTable();

            string query = @"
            SELECT 
    o.OrderID, 
    o.OrderDateTime, 
    o.TotalAmount, 
    c.FirstName + ' ' + c.LastName AS CustomerName
FROM 
    dbo.[Order] o
INNER JOIN 
    dbo.Customer c ON o.CustomerNumericID = c.CustomerNumericID
ORDER BY 
    o.OrderDateTime DESC;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;
        }

       
        private void BindOrders()
        {
            GridViewOrders.DataSource = GetOrders();
            GridViewOrders.DataBind();
        }
    }
}