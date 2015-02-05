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

public partial class ADMIN_viewuser : System.Web.UI.Page
{
    SqlConnection scon;
    SqlDataAdapter sda;
    DataTable dt= new DataTable();
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
    void BindDataGrid()
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        scon.Open();
        try
        {
            string qry = "SELECT * from users";
            sda = new SqlDataAdapter(qry, scon);
            sda.Fill(dt);
            dguser.DataSource = dt;
            dguser.DataBind();
        }
        catch
        {
        }
        finally
        {
            scon.Close();
        }
    }
    protected void dguser_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        dguser.CurrentPageIndex = e.NewPageIndex;
        BindDataGrid();
    }
}
