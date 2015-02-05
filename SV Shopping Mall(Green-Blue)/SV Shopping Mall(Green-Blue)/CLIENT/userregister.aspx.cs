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

public partial class CLIENT_userregister : System.Web.UI.Page
{
    SqlConnection scon;
    protected void Page_Load(object sender, EventArgs e)
    {
        scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        if (!IsPostBack)
        {
            BindDropDownList();
        }
    }
    void BindDropDownList()
    {
        for (int i = 1; i < 32; i++)
        {
            ddlDate.Items.Add(new ListItem(i.ToString()));
            ddlDate.DataBind();
        }
	    for(int i=1950;i<2020;i++)
	    {
            ddlYear.Items.Add(new ListItem(i.ToString()));
            ddlYear.DataBind();
	    }
        scon.Open();
        try
        {
            string qryc="SELECT * from city";
            SqlCommand scmdcity=new SqlCommand(qryc,scon);
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
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            string dob = ddlDate.SelectedItem.Text + "/" + ddlMonth.SelectedItem.Text + "/" + ddlYear.SelectedItem.Text;
            string iqry = "INSERT INTO users(user_id, user_password, user_first_name, user_middle_name, user_last_name, user_date_of_birth, user_phone_no, user_mobile_no, user_email,address, city, state, country, pincode) VALUES('" + txtUserId.Text + "', '" + txtPassword.Text + "', '" + txtFirstName.Text + "', '" + txtMiddleName.Text + "', '" + txtLastName.Text + "', '" + dob + "', '" + txtPhoneNo.Text + "', '" + txtMobileNo.Text + "', '" + txtEmail.Text + "', '" + txtAddress.Text + "', '" + ddlCity.SelectedItem.Text + "', '" + ddlState.SelectedItem.Text + "', '" + ddlCountry.SelectedItem.Text + "'," + txtPINCode.Text + ")";

            SqlCommand scmd = new SqlCommand(iqry, scon);
            scmd.ExecuteNonQuery();

            Session["user"] = txtUserId.Text;
            Session["firstname"] = txtFirstName.Text;

            string r = Request.QueryString.HasKeys().ToString();
            if (r == "True")
            {
                string key = Request.QueryString.GetKey(0).ToString();
                Response.Redirect(Request.QueryString[key].ToString() + ".aspx");
            }
            else
            {
                Response.Redirect("viewshoppingcartandlist.aspx");
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
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtUserId.Text = "";
        txtPassword.Text = "";
        txtFirstName.Text = "";
        txtMiddleName.Text = "";
        txtLastName.Text = "";
        txtPhoneNo.Text = "";
        txtMobileNo.Text = "";
        txtAddress.Text = "";
        txtEmail.Text = "";
        txtPINCode.Text = "";
        txtRetypePassword.Text = "";
        ddlCity.SelectedIndex = 0;
        ddlState.SelectedIndex = 0;
        ddlDate.SelectedIndex = 0;
        ddlMonth.SelectedIndex = 0;
        ddlYear.SelectedIndex = 0;
       
    }
}
