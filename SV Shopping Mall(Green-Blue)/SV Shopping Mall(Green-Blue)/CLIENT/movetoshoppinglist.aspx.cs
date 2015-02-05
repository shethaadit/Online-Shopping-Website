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

public partial class CLIENT_movetoshoppinglist : System.Web.UI.Page
{
    SqlConnection scon;
    protected void Page_Load(object sender, EventArgs e)
    {
         scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        scon.Open();
        try
        {
            int i=int.Parse(Request.QueryString["index"]);

            string userid = Session["user"].ToString();
            ArrayList productno=new ArrayList();
            productno=(ArrayList)Session["productno"];
            string pno=productno[i].ToString();

            string iqry = "INSERT INTO shopping_list VALUES('" + userid + "','" + pno + "')";
            SqlCommand scmd = new SqlCommand(iqry, scon);
            scmd.ExecuteNonQuery();

            productno.RemoveAt(i);
            Session["productno"]=productno;

            Response.Redirect("viewshoppingcartandlist.aspx");
        }
        catch
        {
        }
        finally
        {
            scon.Close();
        }
        
        if(Session["user"]==null)
        {
            Response.Redirect("login.aspx");
        }
    }
}
