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

public partial class delete : System.Web.UI.Page
{
    SqlConnection scon;
    SqlCommand scmd;
    SqlDataReader sdr;
    string dqry;
    string sqry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string tablename = Request.QueryString["table"];
            string no = Request.QueryString["no"];
           
            scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);

            if (tablename == "category")
            {
                scon.Open();
                try
                {
                    sqry = "select * from subcategory where category_no='" + no + "'";
                    scmd = new SqlCommand(sqry, scon);
                    sdr = scmd.ExecuteReader();

                    if (sdr.HasRows)
                    {
                        Response.Write("<script language='JavaScript'>");
                        Response.Write("alert('category can not be delete because it has sub-category')");
                        Response.Write("</script>");
                        sdr.Close();
                    }
                    else
                    {
                        sdr.Close();
                        dqry = "DELETE FROM " + tablename + " WHERE(category_no = '" + no + "')";
                        scmd = new SqlCommand(dqry, scon);
                        scmd.ExecuteNonQuery();
                    }
                }
                catch
                {
                }
                finally
                {
                    sdr.Close();
                    scon.Close();
                }
            }
            else if (tablename == "subcategory")
            {
                scon.Open();
                try
                {
                    sqry = "select * from product where product_subcategory_no='" + no + "'";
                    scmd = new SqlCommand(sqry, scon);
                    sdr = scmd.ExecuteReader();

                    if (sdr.HasRows)
                    {
                        Response.Write("<script language='JavaScript'>");
                        Response.Write("alert('sub -category can not be delete because it has product')");
                        Response.Write("</script>");
                        sdr.Close();
                    }
                    else
                    {
                        sdr.Close();
                        dqry = "DELETE FROM " + tablename + " WHERE(subcategory_no = '" + no + "')";
                        scmd = new SqlCommand(dqry, scon);
                        scmd.ExecuteNonQuery();
                    }
                }
                catch
                {
                }
                finally
                {
                    sdr.Close();
                    scon.Close();
                }
            }
            else if (tablename == "product")
            {
                scon.Open();
                try
                {
                    dqry = "DELETE FROM " + tablename + " WHERE(product_no = '" + no + "')";
                    scmd = new SqlCommand(dqry, scon);
                    scmd.ExecuteNonQuery();

                    dqry = "DELETE FROM product_features WHERE(product_no = '" + no + "')";
                    scmd = new SqlCommand(dqry, scon);
                    scmd.ExecuteNonQuery();
                }
                catch
                {
                }
                finally
                {
                    scon.Close();
                }
            }
            else if (tablename == "users")
            {
                scon.Open();
                try
                {
                    dqry = "DELETE FROM " + tablename + " WHERE(user_id = '" + no + "')";
                    scmd = new SqlCommand(dqry, scon);
                    scmd.ExecuteNonQuery();
                }
                catch
                {
                }
                finally
                {
                    scon.Close();
                }
            }
            Response.Redirect("view" + tablename + ".aspx");
        }
    }
}
