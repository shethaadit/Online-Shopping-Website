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

public partial class CLIENT_deletefromshoppingcart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {           
            int i = int.Parse(Request.QueryString["index"]);

            string userid = Session["user"].ToString();
            ArrayList productno = new ArrayList();
            productno = (ArrayList)Session["productno"];

            productno.RemoveAt(i);
            Session["productno"] = productno;

            Response.Redirect("viewshoppingcartandlist.aspx");
            
        }
    }
}
