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

public partial class editproductfeature : System.Web.UI.Page
{
    SqlConnection scon;
    SqlCommand scmd;
    string uqry;
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

            scon.Open();
            try
            {
                SqlCommand scmd = new SqlCommand("SELECT * from product_features where product_no='" + Request.QueryString["oldpno"] + "'", scon);
                SqlDataReader sdr = scmd.ExecuteReader();

                int i = 1;
                while (sdr.Read())
                {
                    PlaceHolder1.Controls.Add(new LiteralControl("<tr>"));
                    PlaceHolder1.Controls.Add(new LiteralControl("<td>"));

                    Label l = new Label();
                    l.ID = "lblFeature" + i;
                    l.Text = "Feature" + i;

                    PlaceHolder1.Controls.Add(l);
                    PlaceHolder1.Controls.Add(new LiteralControl("</td>"));
                    PlaceHolder1.Controls.Add(new LiteralControl("<td>"));

                    TextBox t = new TextBox();
                    t.ID = "txtFeature" + i;
                    t.Text = sdr.GetValue(1).ToString();

                    PlaceHolder1.Controls.Add(t);
                    PlaceHolder1.Controls.Add(new LiteralControl("</td>"));
                    PlaceHolder1.Controls.Add(new LiteralControl("</tr>"));

                    i++;
                }
                sdr.Close();
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
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        PlaceHolder PlaceHolder1 = (PlaceHolder)Page.Form.FindControl("cntmaincontent").FindControl("PlaceHolder1");

        scon.Open();
        try
        {
            string oldpno = Request.QueryString["oldpno"];
            string ProductNo = Request.QueryString["no"];
            string ProductName = Request.QueryString["name"];
            string SubCategoryNo = Request.QueryString["subcategory"];
            string Price = Request.QueryString["price"];
            string Quantity = Request.QueryString["qty"];
            string path = Request.QueryString["imagepath"];

            uqry = "UPDATE product SET product_name = '" + ProductName + "', product_subcategory_no = '" + SubCategoryNo + "', product_price = " + Price + ", product_stock_qty = " + Quantity + ", product_imagepath = '" + path + "'WHERE (product_no = '" + oldpno + "')";
            scmd = new SqlCommand(uqry, scon);
            scmd.ExecuteNonQuery();

            scmd = new SqlCommand("SELECT * from product_features where product_no='" + Request.QueryString["oldpno"] + "'", scon);
            SqlDataReader sdr = scmd.ExecuteReader();

            int i = 1;
            while (sdr.Read())
            {
                TextBox t1 = (TextBox)PlaceHolder1.FindControl("txtFeature" + i);
                string ans = t1.Text;

                uqry = "UPDATE product_features SET product_feature = '" + t1.Text + "' WHERE (product_feature = '" + sdr.GetValue(1).ToString() + "') AND (product_no = '" + oldpno + "')";
                scmd = new SqlCommand(uqry, scon);
                scmd.ExecuteNonQuery();

                i++;
            }
            sdr.Close();
            Response.Redirect("viewproduct.aspx");
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
