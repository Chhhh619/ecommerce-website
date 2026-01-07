using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Dev_CW
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Pineapple.mdf;Integrated Security=True;Connect Timeout=30;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                string selectedIssues = string.Join(", ", new string[]
                {
                    chkScreen.Checked ? "Screen not responding" : null,
                    chkBattery.Checked ? "Battery draining quickly" : null,
                    chkCharge.Checked ? "Unable to charge" : null,
                    chkFaceID.Checked ? "Face ID not working" : null,
                    chkOverheating.Checked ? "Overheating" : null,
                    chkAppsCrashing.Checked ? "Apps crashing" : null,
                    chkIOSUpdate.Checked ? "iOS update failed" : null,
                    chkDataLoss.Checked ? "Data loss" : null,
                    chkSyncIssue.Checked ? "Unable to sync with iCloud" : null,
                    chkAppDownload.Checked ? "App download issues" : null,
                    chkWifi.Checked ? "Unable to connect to Wi-Fi" : null,
                    chkCellular.Checked ? "Cellular data not working" : null,
                    chkSignal.Checked ? "Poor signal strength" : null,
                    chkBluetooth.Checked ? "Bluetooth connectivity issue" : null,
                    chkAirdrop.Checked ? "AirDrop not working" : null
                }.Where(issue => issue != null));


                string comments = txtComments.Text;


                if (string.IsNullOrWhiteSpace(selectedIssues) && string.IsNullOrWhiteSpace(comments))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select at least one issue or add a comment.');", true);
                    return;
                }


                string connectionString = ConfigurationManager.ConnectionStrings["Pineapple"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [dbo].[SupportRequests] ([SelectedIssues], [Comments]) VALUES (@SelectedIssues, @Comments)";
                    SqlCommand cmd = new SqlCommand(query, conn);


                    if (string.IsNullOrEmpty(selectedIssues))
                    {
                        cmd.Parameters.AddWithValue("@SelectedIssues", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@SelectedIssues", selectedIssues);
                    }

                    if (string.IsNullOrEmpty(comments))
                    {
                        cmd.Parameters.AddWithValue("@Comments", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Comments", comments);
                    }


                    conn.Open();
                    cmd.ExecuteNonQuery();
                }


                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your report has been submitted successfully!');", true);


                ClearForm();
            }
            catch (Exception ex)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        private void ClearForm()
        {

            chkScreen.Checked = false;
            chkBattery.Checked = false;
            chkCharge.Checked = false;
            chkFaceID.Checked = false;
            chkOverheating.Checked = false;
            chkAppsCrashing.Checked = false;
            chkIOSUpdate.Checked = false;
            chkDataLoss.Checked = false;
            chkSyncIssue.Checked = false;
            chkAppDownload.Checked = false;
            chkWifi.Checked = false;
            chkCellular.Checked = false;
            chkSignal.Checked = false;
            chkBluetooth.Checked = false;
            chkAirdrop.Checked = false;


            txtComments.Text = string.Empty;
        }
    }
}