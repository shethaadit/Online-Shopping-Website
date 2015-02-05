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

public partial class addproduct : System.Web.UI.Page
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
            FileUpload1.Attributes.Add("onChange", "return DisplayImage();");

            scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            scon.Open();
            try
            {
                if (!IsPostBack)
                {
                    BindDropDownList();
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
    protected void btnNext_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            SqlCommand scmdpno = new SqlCommand("SELECT product_no from product where product_no='" + txtProductNo.Text + "'", scon);
            SqlDataReader sdrpno = scmdpno.ExecuteReader();

            SqlCommand scmdpnm = new SqlCommand("SELECT product_name from product where product_name='" + txtProductName.Text + "'", scon);
            SqlDataReader sdrpnm = scmdpnm.ExecuteReader();

            if (sdrpno.HasRows || sdrpnm.HasRows)
            {
                Response.Write("<script>alert('Product No or Name already exist!!')");
                Response.Write("</script>");
            }
            else
            {
                string filename = FileUpload1.FileName;
                //string path = Server.MapPath("~/images/") + FileUpload1.FileName;
                if (ddlAddProduct_SubCategory.SelectedIndex==0 || filename == "")
                {
                    Response.Write("<script language='JavaScript'>");
                    Response.Write("alert('Please select Sub-Category or Image first.')");
                    Response.Write("</script>");
                }
                else
                {
                    
                    FileUpload1.PostedFile.SaveAs(MapPath("~/pimages/") + FileUpload1.FileName);
                    Response.Redirect("addproductfeature.aspx?no=" + txtProductNo.Text + "&name=" + txtProductName.Text + "&subcategory=" + ddlAddProduct_SubCategory.SelectedItem.Value + "&price=" + txtPrice.Text + "&qty=" + txtQuantity.Text + "&imagepath=" + filename);
                }
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
    void BindDropDownList()
    {
        scmd = new SqlCommand("SELECT * FROM subcategory  ORDER BY subcategory_no", scon);
        SqlDataReader sdr = scmd.ExecuteReader();
        ddlAddProduct_SubCategory.DataSource = sdr;
        ddlAddProduct_SubCategory.DataTextField = "subcategory_name";
        ddlAddProduct_SubCategory.DataValueField = "subcategory_no";
        ddlAddProduct_SubCategory.DataBind();
        ddlAddProduct_SubCategory.Items.Insert(0, new ListItem("Select a Sub-Category", "-1"));
    }
}
