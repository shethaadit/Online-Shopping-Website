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

public partial class CLIENT_addtoshoppingcart : System.Web.UI.Page
{
    ArrayList productno = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["productno"] != null)
        {
            productno = (ArrayList)Session["productno"];
            int no = productno.Count;
            productno.Insert(no, Request.QueryString["productno"].ToString());
        }
        else
        {
            productno.Insert(0, Request.QueryString["productno"].ToString());
        }
        Session["productno"] = productno;
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            Response.Redirect("viewshoppingcartandlist.aspx");
        }
    }
}
