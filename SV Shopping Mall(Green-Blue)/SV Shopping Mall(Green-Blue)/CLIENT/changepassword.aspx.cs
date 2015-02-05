using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class CLIENT_changepassword : System.Web.UI.Page
{
    SqlConnection scon;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        scon=new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);

    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            string uqry="UPDATE users set user_password='" + txtNewPassword.Text + "' where user_id='" + Session["user"] + "'";
            SqlCommand scmd=new SqlCommand(uqry,scon);
            scmd.ExecuteNonQuery();

            Response.Redirect("myaccount.aspx");
        }
        catch
        {
        }
        finally
        {
            scon.Close();
        }	
    }
}
