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

public partial class CLIENT_editshippingaddress : System.Web.UI.Page
{
    SqlConnection scon;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        if (!IsPostBack)
        {
            BindDropDownList();
            scon.Open();
            try
            {
                string sqry = "SELECT * FROM shipping_address where (user_id='" + Session["user"].ToString() + "' and id='" + Request.QueryString["id"].ToString() + "')";
                SqlCommand scmds = new SqlCommand(sqry, scon);
                SqlDataReader sdr = scmds.ExecuteReader();
                while (sdr.Read())
                {
                    ListItem lt = ddlTitle.Items.FindByText(sdr.GetValue(2).ToString());
                    ddlTitle.SelectedIndex = ddlTitle.Items.IndexOf(lt);

                    txtFirstName.Text = sdr.GetValue(3).ToString();
                    txtMiddleName.Text = sdr.GetValue(4).ToString();
                    txtLastName.Text = sdr.GetValue(5).ToString();
                    txtEmail.Text = sdr.GetValue(6).ToString();
                    txtTelephoneNo.Text = sdr.GetValue(7).ToString();
                    txtMobileNo.Text = sdr.GetValue(8).ToString();
                    txtAddress.Text = sdr.GetValue(9).ToString();
                    ListItem lc = ddlCity.Items.FindByText(sdr.GetValue(10).ToString());
                    ddlCity.SelectedIndex = ddlCity.Items.IndexOf(lc);

                    ListItem ls = ddlState.Items.FindByText(sdr.GetValue(11).ToString());
                    ddlState.SelectedIndex = ddlState.Items.IndexOf(ls);

                    txtPINCode.Text = sdr.GetValue(13).ToString();
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
    void BindDropDownList()
    {
        scon.Open();
        try
        {
            string qryc = "SELECT * from city";
            SqlCommand scmdcity = new SqlCommand(qryc, scon);
            SqlDataReader sdrc = scmdcity.ExecuteReader();
            ddlCity.DataValueField = "city_no";
            ddlCity.DataTextField = "city_name";
            ddlCity.DataSource = sdrc;
            ddlCity.DataBind();

            string qrys = "SELECT * from state";
            SqlCommand scmdstate = new SqlCommand(qrys, scon);
            SqlDataReader sdrs = scmdstate.ExecuteReader();
            ddlState.DataValueField = "state_no";
            ddlState.DataTextField = "state_name";
            ddlState.DataSource = sdrs;
            ddlState.DataBind();
        }
        catch
        {
        }
        finally
        {
            scon.Close();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            string uqry = "UPDATE shipping_address set title='" + ddlTitle.SelectedItem.Text + "',first_name='" + txtFirstName.Text + "',middle_name='"+ txtMiddleName.Text +"',last_name='"+ txtLastName.Text +"',email='" + txtEmail.Text + "',phone_no='"+ txtTelephoneNo.Text +"',mobile_no='"+ txtMobileNo.Text +"',address='"+ txtAddress.Text +"',city='"+ ddlCity.SelectedItem.Text +"',state='"+ ddlState.SelectedItem.Text +"',pincode='"+ txtPINCode.Text +"' where user_id='" + Session["user"].ToString() + "' and id='" + Request.QueryString["id"].ToString() + "'";
            SqlCommand scmd = new SqlCommand(uqry, scon);
            scmd.ExecuteNonQuery();
            Response.Redirect("myaddressbook.aspx");
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
