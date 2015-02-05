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

public partial class login : System.Web.UI.Page
{
    SqlConnection scon;
    SqlCommand scmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
    }
    protected void LoginAdmin_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string unm = LoginAdmin.UserName;
        string pwd = LoginAdmin.Password;

        scon.Open();
        try
        {
            string qry = "select password from admin where user_name='" + unm + "'";
            scmd = new SqlCommand(qry, scon);
            SqlDataReader sdr = scmd.ExecuteReader();
            while (sdr.Read())
            {
                if (pwd == sdr.GetValue(0).ToString())
                {
                    Session["admin"] = unm;
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Redirect("login.aspx");
                    Session.Abandon();
                }
            }
            sdr.Close();
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
