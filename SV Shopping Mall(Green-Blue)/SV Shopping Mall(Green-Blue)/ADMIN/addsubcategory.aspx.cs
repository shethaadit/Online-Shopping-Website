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

public partial class addsubcategory : System.Web.UI.Page
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            SqlCommand scmdscno = new SqlCommand("SELECT subcategory_no from subcategory where subcategory_no='" + txtSubCategoryNo.Text + "'", scon);
            SqlDataReader sdrscno = scmdscno.ExecuteReader();

            SqlCommand scmdscnm = new SqlCommand("SELECT subcategory_name from subcategory where subcategory_name='" + txtSubCategoryName.Text + "'", scon);
            SqlDataReader sdrscnm = scmdscnm.ExecuteReader();

            if (sdrscno.HasRows || sdrscnm.HasRows)
            {
                Response.Write("<script>alert('Sub-Category No or Name already exist!!')");
                Response.Write("</script>");
            }
            else
            {
                string filename = FileUpload1.FileName;
                if (ddlAddSubCategory_Category.SelectedIndex == 0 || filename == "")
                {
                    Response.Write("<script>alert('Please Select Category or Image.!!')");
                    Response.Write("</script>");
                }
                else
                {

                    //string path = Server.MapPath("~/images/") + FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(MapPath("~/simages/") + FileUpload1.FileName);

                    scmd = new SqlCommand("INSERT INTO subcategory (subcategory_no, subcategory_name, category_no, subcategory_imagepath) VALUES ('" + txtSubCategoryNo.Text + "','" + txtSubCategoryName.Text + "','" + ddlAddSubCategory_Category.SelectedItem.Value + "','" + filename + "')", scon);
                    scmd.ExecuteNonQuery();
                    txtSubCategoryNo.Text = "";
                    txtSubCategoryName.Text = "";
                    ddlAddSubCategory_Category.SelectedIndex = -1;
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
        scmd = new SqlCommand("SELECT * FROM category ORDER BY category_no", scon);
        SqlDataReader sdr = scmd.ExecuteReader();
        ddlAddSubCategory_Category.DataSource = sdr;
        ddlAddSubCategory_Category.DataTextField = "category_name";
        ddlAddSubCategory_Category.DataValueField = "category_no";
        ddlAddSubCategory_Category.DataBind();
        ddlAddSubCategory_Category.Items.Insert(0, new ListItem("select a category", "-1"));
    }
}
