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

public partial class _Default : System.Web.UI.Page
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
    protected void dgCategory_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        dgCategory.CurrentPageIndex = e.NewPageIndex;
        BindDataGrid();
    }
    void BindDataGrid()
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        scon.Open();
        try
        {
            string qry = "SELECT * FROM category";
            sda = new SqlDataAdapter(qry, scon);
            sda.Fill(ds);
            dgCategory.DataSource = ds;
            dgCategory.DataBind();
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
