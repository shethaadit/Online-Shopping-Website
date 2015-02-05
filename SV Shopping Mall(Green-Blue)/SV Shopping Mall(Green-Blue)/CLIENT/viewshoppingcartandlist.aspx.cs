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

public partial class CLIENT_viewshoppingcartandlist : System.Web.UI.Page
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
            if (Session["productno"] != null)
            {
                ArrayList productno = new ArrayList();
                productno = (ArrayList)Session["productno"];


                if (productno.Count > 0)
                {
                    for (int i = 0; i < productno.Count; i++)
                    {
                        string p = productno[i].ToString();
                        if (p != " ")
                        {
                            scon.Open();
                            try
                            {
                                string plqry = "SELECT * from product where product_no='" + productno[i].ToString() + "'";
                                SqlCommand scmdpl = new SqlCommand(plqry, scon);
                                SqlDataReader sdrpl = scmdpl.ExecuteReader();
                                while (sdrpl.Read())
                                {
                                    TextBox t = new TextBox();
                                    t.ID = "txtqty" + i.ToString();
                                    t.Width = 30;
                                    t.Text = "1";
                                    t.MaxLength = 2;
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("<tr>"));
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("<td style='border-bottom: solid 1px #2aa4d2'>&nbsp;</td>"));
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("<td colspan='2' style='border-bottom: solid 1px #2aa4d2'>" + sdrpl.GetValue(2).ToString() + "<br /><br />"));
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("<a href='movetoshoppinglist.aspx?index=" + i + "' style='font-size:small;color:#DD0000'>Save For Later</a><br />"));
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("<a href='deletefromshoppingcart.aspx?index=" + i + "' style='font-size:small;color:#DD0000'>Delete</a><br />&nbsp;"));
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("</td>"));
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("<td style='border-bottom: solid 1px #2aa4d2' align='right'>" + sdrpl.GetValue(4).ToString() + "</td>"));
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("<td align='center' style='border-bottom: solid 1px #2aa4d2'>"));
                                    plhviewshoppingcart.Controls.Add(t);
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("</td>"));
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("<td style='border-bottom: solid 1px #2aa4d2;width:10%;'>&nbsp;</td>"));
                                    plhviewshoppingcart.Controls.Add(new LiteralControl("</tr>"));

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
                }
                else
                {
                }
            }
            else
            {
                plhviewshoppingcart.Controls.Add(new LiteralControl("<tr><td colspan='2'>&nbsp;</td></tr>"));
                plhviewshoppingcart.Controls.Add(new LiteralControl("<tr><td colspan='2' style='color:#DD0000;'>|<b> &nbsp;&nbsp;No Products saved!</b></td></tr>"));
                plhviewshoppingcart.Controls.Add(new LiteralControl("<tr><td colspan='2'>&nbsp;</td></tr>"));

            }
        }
    }
    protected void btnProceedToCheckOut_Click(object sender, EventArgs e)
    {
        if (Session["productno"] != null)
        {
            ArrayList productno = new ArrayList();
            productno = (ArrayList)Session["productno"];
            int totalqty = 0;
            ArrayList productqty = new ArrayList();
            for (int i = 0; i < productno.Count; i++)
            {
                TextBox txtqty = (TextBox)plhviewshoppingcart.FindControl("txtqty" + i);
                string qty = txtqty.Text;
                productqty.Insert(i, qty);
                totalqty += int.Parse(qty);
            }
            Session["productqty"] = productqty;
            Session["producttotalqty"] = totalqty;
            Response.Redirect("viewshippinginfo.aspx");
        }
        else
        {
            System.Windows.Forms.MessageBox.Show("Cannot Proceed! Shopping Cart is empty.");
            Response.Redirect("viewshoppingcartandlist.aspx");
        }
    }
}
