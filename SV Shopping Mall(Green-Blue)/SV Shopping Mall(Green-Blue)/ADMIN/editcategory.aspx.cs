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

public partial class editcategory : System.Web.UI.Page
{
    SqlConnection scon;
    SqlCommand scmd;
    string uqry;
    string cno;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string tablename = Request.QueryString["table"];
            cno = Request.QueryString["no"];
            SqlDataReader sdr;

            scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            if (!IsPostBack)
            {
                scon.Open();
                try
                {
                    scmd = new SqlCommand("SELECT * from category where category_no='" + cno + "'", scon);
                    sdr = scmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        txtCategoryNo.Text = sdr.GetValue(0).ToString();
                        txtCategoryName.Text = sdr.GetValue(1).ToString();
                    }
                }
                catch { }
                finally
                {
                    scon.Close();
                }
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            SqlCommand scmdcnm = new SqlCommand("SELECT category_name from category where category_name='" + txtCategoryName.Text + "' AND category_no!='" + txtCategoryNo.Text + "'", scon);
            SqlDataReader sdrcnm = scmdcnm.ExecuteReader();

            if (sdrcnm.HasRows)
            {
                Response.Write("<script>alert('Category Name already exist!!')");
                Response.Write("</script>");
            }
            else
            {
                uqry = "UPDATE category SET category_name = '" + txtCategoryName.Text + "'WHERE (category_no = '" + cno + "')";
                scmd = new SqlCommand(uqry, scon);
                scmd.ExecuteNonQuery();
                Response.Redirect("viewcategory.aspx");
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