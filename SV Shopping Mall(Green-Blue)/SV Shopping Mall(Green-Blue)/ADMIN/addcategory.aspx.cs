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

public partial class addcategory : System.Web.UI.Page
{
    SqlConnection scon;
    SqlCommand scmd;
        
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            txtCategoryNo.Focus();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            SqlCommand scmdcno = new SqlCommand("SELECT category_no from category where category_no='" + txtCategoryNo.Text + "'", scon);
            SqlDataReader sdrcno = scmdcno.ExecuteReader();

            SqlCommand scmdcnm = new SqlCommand("SELECT category_name from category where category_name='" + txtCategoryName.Text + "'", scon);
            SqlDataReader sdrcnm = scmdcnm.ExecuteReader();

            if (sdrcno.HasRows || sdrcnm.HasRows)
            {
                Response.Write("<script>alert('Category No or Name already exist!!')");
                Response.Write("</script>");
            }
            else
            {
                scmd = new SqlCommand("INSERT INTO category (category_no, category_name)VALUES ('" + txtCategoryNo.Text + "','" + txtCategoryName.Text + "')", scon);
                scmd.ExecuteNonQuery();
                txtCategoryNo.Text = "";
                txtCategoryName.Text = "";
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
