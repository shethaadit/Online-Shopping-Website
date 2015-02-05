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

public partial class CLIENT_editbillingaddress : System.Web.UI.Page
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
                string sqry = "SELECT * FROM users where (user_id='" + Session["user"].ToString() + "')";
                SqlCommand scmds = new SqlCommand(sqry, scon);
                SqlDataReader sdr = scmds.ExecuteReader();
                while (sdr.Read())
                {
                    txtFirstName.Text = sdr.GetValue(2).ToString();
                    txtMiddleName.Text = sdr.GetValue(3).ToString();
                    txtLastName.Text = sdr.GetValue(4).ToString();
                    txtEmail.Text = sdr.GetValue(8).ToString();
                    txtPhoneNo.Text = sdr.GetValue(6).ToString();
                    txtMobileNo.Text = sdr.GetValue(7).ToString();
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
            string uqry = "UPDATE users set user_first_name='" + txtFirstName.Text + "',user_middle_name='" + txtMiddleName.Text + "',user_last_name='" + txtLastName.Text + "',user_phone_no='" + txtPhoneNo.Text + "',user_mobile_no='" + txtMobileNo.Text + "',user_email='" + txtEmail.Text + "',address='" + txtAddress.Text + "',city='" + ddlCity.SelectedItem.Text + "',state='" + ddlState.SelectedItem.Text + "',country='India',pincode='" + txtPINCode.Text + "'where user_id='" + Session["user"].ToString() + "'";
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
