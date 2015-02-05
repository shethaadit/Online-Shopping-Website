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

public partial class CLIENT_UserControl_categorymenubar : System.Web.UI.UserControl
{
    SqlConnection scon;
    protected void Page_Load(object sender, EventArgs e)
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            string sqry = "SELECT * from subcategory where subcategory_name like '%" + txtSearchProductName.Text + "%'";
            SqlDataAdapter sdas = new SqlDataAdapter(sqry, scon);
            DataTable dts = new DataTable();
            sdas.Fill(dts);

            string cqry = "SELECT * from category where category_name like '%" + txtSearchProductName.Text + "%'";
            SqlDataAdapter sdac = new SqlDataAdapter(cqry, scon);
            DataTable dtc = new DataTable();
            sdac.Fill(dtc);

            if (dts.Rows.Count > 0)
            {
                string cno = dts.Rows[0][2].ToString();
                string sno = dts.Rows[0][0].ToString();
                Response.Redirect("viewproductlist.aspx?category=" + cno + "&subcategory=" + sno);
            }
            else if (dtc.Rows.Count > 0)
            {
                string cno = dtc.Rows[0][0].ToString();
                Response.Redirect("viewcategorydetails.aspx?category=" + cno);
            }
            else
            {
                Response.Redirect("searched.aspx");
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
