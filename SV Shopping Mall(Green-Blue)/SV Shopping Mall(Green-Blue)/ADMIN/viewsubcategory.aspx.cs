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

public partial class viewsubcategory : System.Web.UI.Page
{
    SqlConnection scon;
    SqlDataAdapter sda;
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
    protected void dgSubCategory_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        dgSubCategory.CurrentPageIndex = e.NewPageIndex;
        BindDataGrid();
    }
    void BindDataGrid()
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        scon.Open();
        try
        {
            string qry = "SELECT s.subcategory_no, s.subcategory_name, s.category_no, s.subcategory_imagepath, c.category_name FROM subcategory AS s INNER JOIN category AS c ON s.category_no = c.category_no";
            sda = new SqlDataAdapter(qry, scon);
            sda.Fill(ds);
            dgSubCategory.DataSource = ds;
            dgSubCategory.DataBind();
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
