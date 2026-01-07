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
    public partial class WebForm2 : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFeedback();
            }
        }

        private DataTable GetFeedback()
        {
            DataTable dt = new DataTable();

            string query = @"
            SELECT 
                Id, 
                SelectedIssues, 
                Comments, 
                SubmissionDate
            FROM 
                dbo.SupportRequests
            ORDER BY 
                SubmissionDate DESC;";

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

        
        private void BindFeedback()
        {
            GridViewFeedback.DataSource = GetFeedback();
            GridViewFeedback.DataBind();
        }
    }
}
