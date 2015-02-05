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

public partial class CLIENT_loginmyaccount : System.Web.UI.Page
{
    SqlConnection scon;
    protected void Page_Load(object sender, EventArgs e)
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
    }
    protected void btnSignInMyAccount_Click(object sender, EventArgs e)
    {
        string usr = txtUserId.Text;
        string pwd = txtPassword.Text;

        string qryu = "SELECT user_id,user_first_name FROM users WHERE (user_id = '" + usr + "') AND (user_password = '" + pwd + "')";
        SqlDataAdapter sda = new SqlDataAdapter(qryu, scon);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["firstname"] = dt.Rows[0][1].ToString();
            Session["user"] = usr;

            Response.Redirect("myaccount.aspx");
        }
        else
        {
            plhloginmyaccount.Controls.Add(new LiteralControl("<tr><td colspan='2' style='color:#DD0000;font-size:smaller'>Invalid UserName or Password!</td></tr>"));
        }
    }
    protected void btnSignUpMyAccount_Click(object sender, EventArgs e)
    {

    }
}
