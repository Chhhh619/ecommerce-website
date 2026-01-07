using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Web_App_Dev_CW
{
    
    public partial class add_product : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"");
        string a, b;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void b1_Click(object sender, EventArgs e)
        {

            f1.SaveAs(Request.PhysicalApplicationPath + "./image/" + f1.FileName.ToString());
        }
    }
}