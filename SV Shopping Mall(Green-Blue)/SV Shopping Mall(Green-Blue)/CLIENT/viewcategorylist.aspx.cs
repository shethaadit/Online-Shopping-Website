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

public partial class CLIENT_viewcategorylist : System.Web.UI.Page
{
    SqlConnection scon;
    SqlCommand scmdc;
    int i;

    protected void Page_Load(object sender, EventArgs e)
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);

        scon.Open();
        try
        {
            string cat = "SELECT * from category";
            scmdc = new SqlCommand(cat, scon);
            SqlDataReader sdrc = scmdc.ExecuteReader();
            while (sdrc.Read())
            {
                plhviewcategorylist.Controls.Add(new LiteralControl("<table width='100%' align='center' cellpadding='0' cellspacing='0'>"));
                plhviewcategorylist.Controls.Add(new LiteralControl("<tr><td colspan='2' style='height:20;' align='left'><a href='viewcategorydetails.aspx?category=" + sdrc.GetValue(0).ToString() + "' style='font-size:small;color:#2aa4d2;line-height:21px;'>" + sdrc.GetValue(1).ToString() + "</a></td></tr>"));
                plhviewcategorylist.Controls.Add(new LiteralControl("<tr style='background-color:#FFFFFF;'><td width='5%'>&nbsp;</td><td height='25' width='95%'>"));

                string sql = "SELECT * from subcategory where category_no='" + sdrc.GetValue(0).ToString() + "'";
                SqlCommand scmds = new SqlCommand(sql, scon);
                SqlDataReader sdrs = scmds.ExecuteReader();
                i=0;
                while (sdrs.Read())
                {
                    if(i<3)
                    {
                        plhviewcategorylist.Controls.Add(new LiteralControl("<img src='../App_Themes/CLIENT/background_images/d_gray.gif'>&nbsp;<a href='viewproductlist.aspx?category=" + sdrc.GetValue(0).ToString() + "&subcategory=" + sdrs.GetValue(0).ToString() + "'>"));
                        plhviewcategorylist.Controls.Add(new LiteralControl("<font color='#808080' face='Verdana, Arial, Helvetica, sans-serif' size='2' style='line-height:20px'>" + sdrs.GetValue(1).ToString() + "&nbsp;</font></a>"));
                        i++;
                    }
                }
                plhviewcategorylist.Controls.Add(new LiteralControl("<img src='../App_Themes/CLIENT/background_images/d_gray.gif'><a href='viewcategorydetails.aspx?category=" + sdrc.GetValue(0).ToString() + "'><font color='#808080' face='Verdana, Arial, Helvetica, sans-serif' size='2' style='line-height:20px'>more...</font></a></td></tr><tr><td>&nbsp;</td></tr></table>"));
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
