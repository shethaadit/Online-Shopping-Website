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

public partial class ADMIN_vieworderdispatch : System.Web.UI.Page
{
    SqlConnection scon;
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
        	scon.Open();
	        try
            {
                string qry = "SELECT  * from order_master where dispatchornot='no' order by order_no";
                SqlCommand scmd = new SqlCommand(qry, scon);
                SqlDataReader sdr = scmd.ExecuteReader();
                while (sdr.Read())
                {
                    CheckBox chk=new CheckBox();
                    chk.ID=sdr["order_no"].ToString();
                    
                    plhod.Controls.Add(new LiteralControl("<tr style='background-color:#FFFFFF;height:1;'>"));
					plhod.Controls.Add(new LiteralControl("<td>"));
                    plhod.Controls.Add(chk);
                    plhod.Controls.Add(new LiteralControl("</td>"));
					plhod.Controls.Add(new LiteralControl("<td style='line-height:24px'>" + sdr.GetValue(0).ToString() + "</td>"));
                    plhod.Controls.Add(new LiteralControl("<td>" + sdr.GetValue(1).ToString() + "</td>"));
                    plhod.Controls.Add(new LiteralControl("<td>" + sdr.GetValue(2).ToString() + "</td>"));
                    plhod.Controls.Add(new LiteralControl("<td>" + sdr.GetValue(3).ToString() + "</td>"));
                    plhod.Controls.Add(new LiteralControl("<td>" + sdr.GetValue(5).ToString() + "</td>"));
                    plhod.Controls.Add(new LiteralControl("<td>" + sdr.GetValue(6).ToString() + "</td>"));					
				    plhod.Controls.Add(new LiteralControl("</tr>"));
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
    protected void btnDispatch_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            int c = 0;
            string qry = "SELECT  * from order_master where dispatchornot='no' order by order_no";
            SqlCommand scmd = new SqlCommand(qry, scon);
            SqlDataReader sdr = scmd.ExecuteReader();
            while (sdr.Read())
            {
                CheckBox chk = (CheckBox)plhod.FindControl(sdr["order_no"].ToString());
                if (chk.Checked)
                {
                    c++;
                    string uqry = "UPDATE order_master SET dispatchornot='yes' where order_no='" + chk.ID + "'";
                    SqlCommand scmdu = new SqlCommand(uqry, scon);
                    scmdu.ExecuteNonQuery();

                    string odqry = "SELECT * from order_details where order_no='" + chk.ID + "'";
                    SqlCommand scmdod = new SqlCommand(odqry, scon);
                    SqlDataReader sdrod = scmdod.ExecuteReader();
                    while (sdrod.Read())
                    {
                        int qty = Convert.ToInt32(sdrod.GetValue(2));
                        string upqry = "UPDATE product set product_stock_qty=product_stock_qty-" + qty + " where product_no='" + sdrod.GetValue(1).ToString() + "'";
                        SqlCommand scmdup = new SqlCommand(upqry, scon);
                        scmdup.ExecuteNonQuery();
                    }
                    int max = 0, billno = 0;
                    SqlDataAdapter bnomsda = new SqlDataAdapter("select MAX(bill_no) from bill", scon);
                    DataTable bnomdt = new DataTable();
                    bnomsda.Fill(bnomdt);
                    if (bnomdt.Rows.Count == 1)
                    {
                        if (bnomdt.Rows[0][0].ToString() == "")
                        {
                            billno = 1;
                        }
                        else
                        {
                            max = Convert.ToInt32(bnomdt.Rows[0][0].ToString());
                            billno = max + 1;
                        }
                    }
                    string ibqry = "INSERT INTO bill values('" + billno + "','" + DateTime.Today.ToShortDateString() + "','" + chk.ID + "')";
                    SqlCommand scmdib = new SqlCommand(ibqry, scon);
                    scmdib.ExecuteNonQuery();
                }
            }
            if (c == 0)
            {
                System.Windows.Forms.MessageBox.Show("No Orders  are selected!");
                Response.Redirect("vieworderdispatch.aspx");
            }
            else
            {
                Response.Redirect("vieworderdispatch.aspx");
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
