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

public partial class editproduct : System.Web.UI.Page
{
    SqlConnection scon;
    SqlCommand scmd;
    SqlDataReader sdr;

    string uqry,pno;
    
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
            pno = Request.QueryString["no"];

            scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            if (!IsPostBack)
            {
                scon.Open();
                try
                {
                    scmd = new SqlCommand("SELECT * from product where product_no='" + pno + "'", scon);
                    sdr = scmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        txtProductNo.Text = sdr.GetValue(1).ToString();
                        txtProductName.Text = sdr.GetValue(2).ToString();
                        ddlAddProduct_SubCategory.SelectedIndex = int.Parse(sdr.GetValue(3).ToString())-1;
                        txtPrice.Text = sdr.GetValue(4).ToString();
                        txtQuantity.Text = sdr.GetValue(5).ToString();
                        Image1.Src = Server.MapPath("~/pimages/") + sdr.GetValue(6).ToString();
                    }
                    sdr.Close();
                    BindDropDownList();
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
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            SqlCommand scmdpnm = new SqlCommand("SELECT product_name from product where product_name='" + txtProductName.Text + "' AND product_no!='" + txtProductNo.Text + "'", scon);
            SqlDataReader sdrpnm = scmdpnm.ExecuteReader();

            if (sdrpnm.HasRows)
            {
                Response.Write("<script>alert('Product Name already exist!!')");
                Response.Write("</script>");
            }
            else
            {
                string filename = FileUpload1.FileName;
                string scno = ddlAddProduct_SubCategory.SelectedItem.Value;
                if (filename == "")
                {
                    scmd = new SqlCommand("SELECT * from product where product_no='" + pno + "'", scon);
                    sdr = scmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        filename = sdr.GetValue(6).ToString();
                    }
                    sdr.Close();

                }
                else
                {
                    FileUpload1.PostedFile.SaveAs(MapPath("~/images/") + filename);
                }
                if (scno == "-1")
                {
                    scmd = new SqlCommand("SELECT * from product where product_no='" + pno + "'", scon);
                    sdr = scmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        scno = sdr.GetValue(3).ToString();
                    }
                    sdr.Close();
                }

                //Response.Redirect("editproductfeature.aspx?oldpno=" + pno + "&no=" + txtProductNo.Text + "&name=" + txtProductName.Text + "&subcategory=" + ddlAddProduct_SubCategory.SelectedItem.Value + "&price=" + txtPrice.Text + "&qty=" + txtQuantity.Text + "&imagepath=" + filename);
                Response.Redirect("editproductfeature.aspx?oldpno=" + pno + "&no=" + txtProductNo.Text + "&name=" + txtProductName.Text + "&subcategory=" + scno + "&price=" + txtPrice.Text + "&qty=" + txtQuantity.Text + "&imagepath=" + filename);
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
        sdr.Close();
    }
   
}
