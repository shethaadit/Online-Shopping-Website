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

public partial class viewproduct : System.Web.UI.Page
{
    SqlConnection scon;
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                BindDataGrid();
            }
        }
    }
    protected void dgProduct_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        dgProduct.CurrentPageIndex = e.NewPageIndex;
        BindDataGrid();
    }
    void BindDataGrid()
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        scon.Open();
        try
        {
            DataTable dt = new DataTable("products");

            string qryp = "SELECT p.product_no, p.product_name, s.subcategory_name, p.product_price, p.product_stock_qty, p.product_imagepath FROM product AS p INNER JOIN subcategory AS s ON p.product_subcategory_no = s.subcategory_no";
            SqlDataAdapter sdap = new SqlDataAdapter(qryp, scon);
            DataTable dtp = new DataTable("product");
            sdap.Fill(dtp);

            DataColumn dtcpno = new DataColumn("product_no", typeof(string));
            dt.Columns.Add(dtcpno);

            DataColumn dtcpname = new DataColumn("product_name", typeof(string));
            dt.Columns.Add(dtcpname);

            DataColumn dtcscno = new DataColumn("subcategory_name", typeof(string));
            dt.Columns.Add(dtcscno);

            DataColumn dtcprice = new DataColumn("product_price", typeof(int));
            dt.Columns.Add(dtcprice);

            DataColumn dtcqty = new DataColumn("product_stock_qty", typeof(int));
            dt.Columns.Add(dtcqty);

            DataColumn dtcpfeature = new DataColumn("product_feature", typeof(string));
            dt.Columns.Add(dtcpfeature);

            DataColumn dtcpipath = new DataColumn("product_imagepath", typeof(string));
            dt.Columns.Add(dtcpipath);

            DataRow dr;
            for (int i = 0; i < dtp.Rows.Count; i++)
            {
                string qrypf = "select * from product_features where product_no='" + dtp.Rows[i][0].ToString() + "'";
                SqlDataAdapter sdapf = new SqlDataAdapter(qrypf, scon);
                DataTable dtpf = new DataTable("product_feature");
                sdapf.Fill(dtpf);

                string pfs = "";
                for (int j = 0; j < dtpf.Rows.Count; j++)
                {
                    pfs = pfs + "<img src='../App_Themes/ADMIN/images/c_gray.gif'>" + dtpf.Rows[j][1].ToString() + "<br>";
                }
                dtpf.Clear();

                dr = dt.NewRow();
                dr["product_no"] = dtp.Rows[i][0].ToString();
                dr["product_name"] = dtp.Rows[i][1].ToString();
                dr["subcategory_name"] = dtp.Rows[i][2].ToString();
                dr["product_price"] = dtp.Rows[i][3];
                dr["product_stock_qty"] = dtp.Rows[i][4];
                dr["product_feature"] = pfs;
                dr["product_imagepath"] = dtp.Rows[i][5].ToString();

                dt.Rows.Add(dr);
            }
            ds.Tables.Add(dt);

            dgProduct.DataSource = ds;
            dgProduct.DataBind();
            dgProduct.PagerStyle.PageButtonCount = dgProduct.PageCount;
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