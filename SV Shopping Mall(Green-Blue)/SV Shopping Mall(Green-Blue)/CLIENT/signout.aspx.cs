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

public partial class CLIENT_signout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["user"] = null;
        Session["firstname"] = null;
        Session["productno"] = null;
        Session["productqty"] = null;
        Session["producttotalqty"] = null;
        Session["totalamt"] = null;
        Session["shippingid"] = null;
        Session["paymenttype"] = null;
        Response.Redirect("home.aspx");
    }
}
