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

public partial class CLIENT_UserControl_viewpaymentoptions : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void btnProceedToPay_Click(object sender, EventArgs e)
    {
        if (rdbaecc.Checked)
        {
            Session["paymenttype"] = rdbaecc.Text;
        }
        if(rdbcheque.Checked)
        {
            Session["paymenttype"] = rdbcheque.Text;
        }
        if (rdbchequeddpickup.Checked)
        {
            Session["paymenttype"] = rdbchequeddpickup.Text;
        }
        if (rdbcreditcard.Checked)
        {
            Session["paymenttype"] = rdbcreditcard.Text;
        }
        if (rdbib.Checked)
        {
            Session["paymenttype"] = rdbib.Text;
        }
        Response.Redirect("viewreviewandconfirm.aspx");
    }
}
