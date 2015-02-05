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

public partial class changepassword : System.Web.UI.Page
{
    SqlConnection scon;
    SqlCommand scmd;
    SqlDataReader sdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
    }

    protected void ChangePasswordAdmin_ChangingPassword(object sender, LoginCancelEventArgs e)
    {
        string oldpwd = ChangePasswordAdmin.CurrentPassword;
        string newpwd = ChangePasswordAdmin.NewPassword;
        string confirmpwd = ChangePasswordAdmin.ConfirmNewPassword;

        scon.Open();
        try
        {
            string qry = "SELECT password FROM admin WHERE (user_name = '" + Session["user"].ToString() + "')";
            scmd = new SqlCommand(qry, scon);
            sdr = scmd.ExecuteReader();
            while (sdr.Read())
            {
                if (sdr.GetValue(0).ToString() == oldpwd)
                {
                    string uqry = "UPDATE admin SET password = '" + newpwd + "' WHERE (user_name = '" + Session["user"].ToString() + "')";
                    scmd = new SqlCommand(uqry, scon);
                    scmd.ExecuteNonQuery();
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Write("<script>");
                    Response.Write("alert('old password is wrong')");
                    Response.Write("</script>");
                }
            }
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
