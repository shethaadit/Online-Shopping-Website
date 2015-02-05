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

public partial class CLIENT_viewcategorydetails : System.Web.UI.Page
{
    SqlConnection scon;
    SqlDataReader sdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        
        scon.Open();
        try
        {
            string cat = "SELECT category_name from category where category_no='" + Request.QueryString["category"].ToString() + "'";
            SqlCommand scmd = new SqlCommand(cat, scon);
            string catnm = scmd.ExecuteScalar().ToString();

            plhviewsubcategory.Controls.Add(new LiteralControl("<b style='font-size:medium;color:#87A019;'>" + catnm + "</b>"));
            plhviewsubcategory.Controls.Add(new LiteralControl("</td></tr><tr><td colspan='2' style='border-top: solid 2px #2aa4d2'>&nbsp;</td></tr>"));

            string sql = "SELECT subcategory_name,subcategory_imagepath,subcategory_no from subcategory where category_no=(select category_no from category where category_name='" + catnm + "')";
            SqlCommand scmdscat = new SqlCommand(sql, scon);
            sdr = scmdscat.ExecuteReader();
            while (sdr.Read())
            {
                plhviewsubcategory.Controls.Add(new LiteralControl("<tr><td style='border-bottom: solid 1px #2aa4d2'>&nbsp;</td><td valign'top' style='border-bottom: solid 1px #2aa4d2'>"));
                plhviewsubcategory.Controls.Add(new LiteralControl("<table width='100%' height='100%'><tr><td>&nbsp;</td></tr><tr>"));
                plhviewsubcategory.Controls.Add(new LiteralControl("<td width='30%' valign='middle'><a href='viewproductlist.aspx?category=" + Request.QueryString["category"].ToString() + "&subcategory=" + sdr.GetValue(2).ToString() + "' border='0'><img src='" + Server.MapPath("~/simages/") + sdr.GetValue(1).ToString() + "' width='75' height='75'></a></td>"));
                plhviewsubcategory.Controls.Add(new LiteralControl("<td align='left' width='70%'><a href='viewproductlist.aspx?category=" + Request.QueryString["category"].ToString() + "&subcategory=" + sdr.GetValue(2).ToString() + "' border='0'><font color='#2582A4'>" + sdr.GetValue(0).ToString() + "</font></a></td>"));
                plhviewsubcategory.Controls.Add(new LiteralControl("</tr><tr><td>&nbsp;</td></tr></table>"));
                plhviewsubcategory.Controls.Add(new LiteralControl("</td></tr>"));
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
