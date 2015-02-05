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

public partial class CLIENT_UserControl_shippingaddressdetails : System.Web.UI.UserControl
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
            ddlCity.Items.Insert(0, new ListItem("-City--", "-1"));

            string qrys = "SELECT * from state";
            SqlCommand scmdstate = new SqlCommand(qrys, scon);
            SqlDataReader sdrs = scmdstate.ExecuteReader();
            ddlState.DataValueField = "state_no";
            ddlState.DataTextField = "state_name";
            ddlState.DataSource = sdrs;
            ddlState.DataBind();
            ddlState.Items.Insert(0, new ListItem("-State--", "-1"));
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
        ClearTextBox();        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            string m="select MAX(id) from shipping_address";
            SqlDataAdapter sda = new SqlDataAdapter(m, scon);
            DataTable dt=new DataTable();
            sda.Fill(dt);
            int max,id;
            if(dt.Rows.Count==1)
            {
                max=int.Parse(dt.Rows[0][0].ToString());
                id=max+1;
            }
            else
            {
                id=0;
            }
					
            string qry="INSERT into shipping_address values('" + id + "','"+ Session["user"] +"','" +ddlTitle.SelectedItem.Text+ "','" + txtFirstName.Text + "','"+txtMiddleName.Text+"','"+txtLastName.Text+"','"+txtEmail.Text+"','"+txtTelephoneNo.Text+"','"+txtMobileNo.Text+"','"+txtAddress.Text+"','"+ddlCity.SelectedItem.Text+"','"+ ddlState.SelectedItem.Text+"','"+ddlCountry.SelectedItem.Text+"','"+txtPINCode.Text+"')";
            SqlCommand scmd=new SqlCommand(qry,scon);
            scmd.ExecuteNonQuery();
            Session["shippingid"] = id;
            ClearTextBox();
            Response.Redirect("viewpaymentinfo.aspx");
        }
        catch
        {
        }
        finally
        {
            scon.Close();
        }
    }
    void ClearTextBox()
    {
        ddlTitle.SelectedIndex = 0;
        txtFirstName.Text = "";
        txtMiddleName.Text = "";
        txtLastName.Text = "";
        txtEmail.Text = "";
        txtTelephoneNo.Text = "";
        txtMobileNo.Text = "";
        txtAddress.Text = "";
        ddlCity.SelectedIndex = 0;
        ddlState.SelectedIndex = 0;
        txtPINCode.Text = "";
    }
}
