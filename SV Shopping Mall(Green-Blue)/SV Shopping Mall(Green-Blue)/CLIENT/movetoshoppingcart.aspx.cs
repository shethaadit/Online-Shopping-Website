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

public partial class CLIENT_movetoshoppingcart : System.Web.UI.Page
{
    SqlConnection scon;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            scon.Open();
            try
            {
                string pno = Request.QueryString["productno"].ToString();
                string dqry = "DELETE from shopping_list where user_id='" + Session["user"].ToString() + "' and product_no='" + Request.QueryString["productno"].ToString() + "'";
                SqlCommand scmd = new SqlCommand(dqry, scon);
                scmd.ExecuteNonQuery();
                Response.Redirect("addtoshoppingcart.aspx?productno=" + pno);
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
}
