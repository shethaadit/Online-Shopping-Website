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

public partial class CLIENT_UserControl_viewshippingaddressbook : System.Web.UI.UserControl
{
    SqlConnection scon;
    protected void Page_Load(object sender, EventArgs e)
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        scon.Open();
        try
        {
            string qry = "SELECT * from shipping_address where user_id='"+ Session["user"].ToString() +"'";
            SqlCommand scmd = new SqlCommand(qry, scon);
            SqlDataReader sdr = scmd.ExecuteReader();
            while (sdr.Read())
            {
                string name = sdr["title"].ToString() + " " + sdr["first_name"].ToString() + " " + sdr["middle_name"].ToString() + " " + sdr["last_name"].ToString();
                string address = sdr["address"].ToString() + "<br>" + sdr["city"].ToString() + "<br> " + sdr["state"].ToString() + "(" + sdr["country"].ToString() + ")<br> PIN Code-" + sdr["pincode"].ToString();

                RadioButton rdb = new RadioButton();
                rdb.ID = sdr["id"].ToString();
                rdb.GroupName = "si";

                plhvsab.Controls.Add(new LiteralControl("<tr valign='top' style='font-size:12px;line-height:20px'>"));
                plhvsab.Controls.Add(new LiteralControl("<td>"));
                plhvsab.Controls.Add(rdb);
                plhvsab.Controls.Add(new LiteralControl("</td>"));
                plhvsab.Controls.Add(new LiteralControl("<td><b>" + name + "</b></td>"));
                plhvsab.Controls.Add(new LiteralControl("<td>" + address + "</td>"));
                plhvsab.Controls.Add(new LiteralControl("<td>" + sdr["mobile_no"].ToString() + "</td>"));
                plhvsab.Controls.Add(new LiteralControl("<td>" + sdr["phone_no"].ToString() + "</td>"));
                plhvsab.Controls.Add(new LiteralControl("<td>" + sdr["email"].ToString() + "</td>"));
                plhvsab.Controls.Add(new LiteralControl("</tr><tr><td colspan='10'><hr color='#CCCCCC'/ ></td></tr>"));
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
    protected void btnShipFromAddress_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            string qry = "SELECT * from shipping_address where user_id='"+ Session["user"].ToString() +"'";
            SqlCommand scmd = new SqlCommand(qry, scon);
            SqlDataReader sdr = scmd.ExecuteReader();
            while (sdr.Read())
            {
                RadioButton rdb = (RadioButton)plhvsab.FindControl(sdr["id"].ToString());
                if (rdb.Checked)
                {
                    Session["shippingid"] = rdb.ID;
                    break;
                }
            }
            if (Session["shippingid"] == null)
            {
                System.Windows.Forms.MessageBox.Show("No Shipping Address selected!");
                Response.Redirect("viewshippinginfo.aspx");
            }
            else
            {
                Response.Redirect("viewpaymentinfo.aspx");
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
