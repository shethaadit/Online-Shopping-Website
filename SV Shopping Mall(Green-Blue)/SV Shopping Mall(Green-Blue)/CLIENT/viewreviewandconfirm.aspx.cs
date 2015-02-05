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

public partial class CLIENT_viewreviewandconfirm : System.Web.UI.Page
{
    SqlConnection scon;
    protected void Page_Load(object sender, EventArgs e)
    {
        scon=new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);

        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            if (Session["paymenttype"].ToString() == "American Express Credit Card")
            {
                ASP.client_usercontrol_americanexpressdetails_ascx aed1;
                aed1 = (ASP.client_usercontrol_americanexpressdetails_ascx)LoadControl("~/CLIENT/UserControl/americanexpressdetails.ascx");
                aed1.ID = "aed1";
                plhrc.Controls.Add(aed1);
            }
            else if (Session["paymenttype"].ToString() == "Credit Card (Visa/Master)")
            {
                ASP.client_usercontrol_visamasterdetails_ascx vmd1;
                vmd1 = (ASP.client_usercontrol_visamasterdetails_ascx)LoadControl("~/CLIENT/UserControl/visamasterdetails.ascx");
                vmd1.ID = "vmd1";
                plhrc.Controls.Add(vmd1);
            }
        }
    }
    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            int max=0, ordno=0;
            string ommqry = "SELECT MAX(order_no) FROM order_master";
            SqlDataAdapter ommsda = new SqlDataAdapter(ommqry, scon);
            DataTable ommdt = new DataTable();
            ommsda.Fill(ommdt);
            if (ommdt.Rows.Count == 1)
            {
                if (ommdt.Rows[0][0].ToString() == "")
                {
                    ordno = 1;
                }
                else
                {
                    max = Convert.ToInt32(ommdt.Rows[0][0].ToString());
                    ordno = max + 1;
                }
            }

            string omqry = "INSERT INTO order_master values(" + ordno + ",'" + Session["user"].ToString() + "','" + DateTime.Today.ToShortDateString() + "','" + Session["paymenttype"].ToString() + "','" + Session["shippingid"] + "','" + Session["producttotalqty"] + "','" + Session["totalamt"] + "','no')";
            SqlCommand omscmd = new SqlCommand(omqry, scon);
            omscmd.ExecuteNonQuery();
            

            ArrayList productno = new ArrayList();
            productno = (ArrayList)Session["productno"];

            ArrayList productqty = new ArrayList();
            productqty = (ArrayList)Session["productqty"];

            for (int i = 0; i < productno.Count; i++)
            {
                string pqry = "SELECT product_price from product where product_no='" + productno[i].ToString() + "'";
                SqlCommand pscmd = new SqlCommand(pqry, scon);
                double price = Convert.ToDouble(pscmd.ExecuteScalar());
                double amt = price * Convert.ToDouble(productqty[i]);

                string odqry = "INSERT INTO order_details values(" + ordno + ",'" + productno[i].ToString() + "','" + productqty[i].ToString() + "','" + amt + "')";
                SqlCommand odscmd = new SqlCommand(odqry, scon);
                odscmd.ExecuteNonQuery();
            }
            Response.Redirect("viewthankyou.aspx");
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
