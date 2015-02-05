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

public partial class addproductfeature : System.Web.UI.Page
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
            txtProductFeatureNo.Text = Request.QueryString["no"];
            txtProductFeatureName.Text = Request.QueryString["name"];
        }
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            string ProductNo = Request.QueryString["no"];
            string ProductName = Request.QueryString["name"];
            string SubCategoryNo=Request.QueryString["subcategory"];
            string Price = Request.QueryString["price"];
            string Quantity=Request.QueryString["qty"];
            string path=Request.QueryString["imagepath"];

            string iqry = "INSERT INTO product(product_no, product_name, product_subcategory_no, product_price, product_stock_qty, product_imagepath)VALUES('" + ProductNo + "', '" + ProductName + "', '" + SubCategoryNo + "', " + Price + ", " + Quantity + ", '" + path + "')";
            scmd = new SqlCommand(iqry,scon);
            scmd.ExecuteNonQuery();

            for(int i=0;i<=lstProductFeature.Items.Count-1;i++)
            {
                string iqry1 = "INSERT INTO product_features(product_no, product_feature)VALUES('" + txtProductFeatureNo.Text + "', '" + lstProductFeature.Items[i].Value + "')";
                scmd = new SqlCommand(iqry1, scon);
                scmd.ExecuteNonQuery();
            }
            Response.Redirect("addproduct.aspx");
        }
        catch
        {
        }
        finally
        {
            scon.Close();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
       lstProductFeature.Items.Add(txtProductFeature.Text);
       lstProductFeature.DataBind();
       txtProductFeature.Text = "";
       if (lstProductFeature.Items.Count != 0)
       {
           lstProductFeature.Visible = true;
       }
    }
}
