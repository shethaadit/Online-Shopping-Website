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

public partial class editsubcategory : System.Web.UI.Page
{
    SqlConnection scon;
    SqlCommand scmd;
    SqlDataReader sdr;

    string uqry;
    string scno;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            FileUpload1.Attributes.Add("onChange", "return DisplayImage();");

            string tablename = Request.QueryString["table"];
            scno = Request.QueryString["no"];


            scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            if (!IsPostBack)
            {
                scon.Open();
                try
                {
                    scmd = new SqlCommand("SELECT * from subcategory where subcategory_no='" + scno + "'", scon);
                    sdr = scmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        txtSubCategoryNo.Text = sdr.GetValue(0).ToString();
                        txtSubCategoryName.Text = sdr.GetValue(1).ToString();
                        ddlAddSubCategory_Category.SelectedIndex = int.Parse(sdr.GetValue(2).ToString())-1;
                        Image1.Src = Server.MapPath("~/simages/") + sdr.GetValue(3).ToString();
                    }
                    sdr.Close();
                    BindDropDownList();
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
            SqlCommand scmdscnm = new SqlCommand("SELECT subcategory_name from subcategory where subcategory_name='" + txtSubCategoryName.Text + "' AND subcategory_no!='" + txtSubCategoryNo.Text +"'", scon);
            SqlDataReader sdrscnm = scmdscnm.ExecuteReader();

            if (sdrscnm.HasRows)
            {
                Response.Write("<script>alert('Sub-Category Name already exist!!')");
                Response.Write("</script>");
            }
            else
            {
                int i = ddlAddSubCategory_Category.SelectedIndex;
                if (i == 0)
                {
                    Response.Write("<script>");
                    Response.Write("alert('Please select any Category.')");
                    Response.Write("</script>");
                }
                else
                {
                    string filename = FileUpload1.FileName;

                    if (filename == "")
                    {
                        scmd = new SqlCommand("SELECT * from subcategory where subcategory_no='" + scno + "'", scon);
                        sdr = scmd.ExecuteReader();
                        while (sdr.Read())
                        {
                            filename = sdr.GetValue(3).ToString();
                        }
                        sdr.Close();

                    }
                    else
                    {
                        FileUpload1.PostedFile.SaveAs(MapPath("~/simages/") + filename);
                    }
                    uqry = "UPDATE subcategory SET subcategory_name = '" + txtSubCategoryName.Text + "', category_no = '" + ddlAddSubCategory_Category.SelectedItem.Value + "', subcategory_imagepath ='" + filename + "' WHERE (subcategory_no = '" + scno + "')";
                    scmd = new SqlCommand(uqry, scon);
                    scmd.ExecuteNonQuery();
                    Response.Redirect("viewsubcategory.aspx");
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
        ddlAddSubCategory_Category.Items.Insert(0, new ListItem("Select a Category", "-1"));
        sdr.Close();
    }
   
}
