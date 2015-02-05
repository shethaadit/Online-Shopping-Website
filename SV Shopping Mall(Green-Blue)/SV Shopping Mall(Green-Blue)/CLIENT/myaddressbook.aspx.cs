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

public partial class CLIENT_myaddressbook : System.Web.UI.Page
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
        }
            scon.Open();
            try
            {
                string baqry = "SELECT * from users where user_id='" + Session["user"].ToString() + "'";
                SqlCommand scmdba = new SqlCommand(baqry, scon);
                SqlDataReader sdrba = scmdba.ExecuteReader();
                while (sdrba.Read())
                {
                    string name = sdrba.GetValue(2).ToString() + " " + sdrba.GetValue(3).ToString() + " " + sdrba.GetValue(4).ToString();
                    plhbadd.Controls.Add(new LiteralControl("<tr style='color:#000000;font-size:small;'>"));
                    plhbadd.Controls.Add(new LiteralControl("<td style='height:25px;' class='mab'>&nbsp;" + name + "</td>"));
                    plhbadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrba.GetValue(9).ToString() + "</td>"));
                    plhbadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrba.GetValue(10).ToString() + "</td>"));
                    plhbadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrba.GetValue(11).ToString() + "</td>"));
                    plhbadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrba.GetValue(6).ToString() + "</td>"));
                    plhbadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrba.GetValue(7).ToString() + "</td>"));
                    plhbadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrba.GetValue(8).ToString() + "</td>"));
                    plhbadd.Controls.Add(new LiteralControl("</tr>"));
                }

                string saqry = "SELECT * from shipping_address where user_id='" + Session["user"].ToString() + "'";
                //string baqry="SELECT * from users where user_id='".$_SESSION['user']."'";
                SqlCommand scmdsa = new SqlCommand(saqry, scon);
                SqlDataReader sdrsa = scmdsa.ExecuteReader();
                while (sdrsa.Read())
                {
                    string name = sdrsa.GetValue(2).ToString() + " " + sdrsa.GetValue(3).ToString() + " " + sdrsa.GetValue(4).ToString() + " " + sdrsa.GetValue(5).ToString();

                    RadioButton rdb = new RadioButton();
                    rdb.ID = sdrsa.GetValue(0).ToString();
                    rdb.GroupName = "rdb";

                    plhsadd.Controls.Add(new LiteralControl("<tr style='color:#000000;font-size:small;'>"));
                    plhsadd.Controls.Add(new LiteralControl("<td align='center' class='mab'>"));
                    plhsadd.Controls.Add(rdb);
                    plhsadd.Controls.Add(new LiteralControl("</td>"));
                    plhsadd.Controls.Add(new LiteralControl("<td style='height:25px;' class='mab'>&nbsp;" + name + "</td>"));
                    plhsadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrsa.GetValue(9).ToString() + "</td>"));
                    plhsadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrsa.GetValue(10).ToString() + "</td>"));
                    plhsadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrsa.GetValue(11).ToString() + "</td>"));
                    plhsadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrsa.GetValue(7).ToString() + "</td>"));
                    plhsadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrsa.GetValue(8).ToString() + "</td>"));
                    plhsadd.Controls.Add(new LiteralControl("<td class='mab'>&nbsp;" + sdrsa.GetValue(6).ToString() + "</td>"));
                    plhsadd.Controls.Add(new LiteralControl("</tr>"));
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
            ddlCity.Items.Insert(0,new ListItem("-City--","-1"));

            string qrys = "SELECT * from state";
            SqlCommand scmdstate = new SqlCommand(qrys, scon);
            SqlDataReader sdrs = scmdstate.ExecuteReader();
            ddlState.DataValueField = "state_no";
            ddlState.DataTextField = "state_name";
            ddlState.DataSource = sdrs;
            ddlState.DataBind();
            ddlState.Items.Insert(0,new ListItem("-State--","-1"));
        }
        catch
        {
        }
        finally
        {
            scon.Close();
        }
    }
    protected void btnDeleteShippingAddress_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            string qry = "SELECT * from shipping_address where user_id='" + Session["user"].ToString() + "'";
            SqlCommand scmd = new SqlCommand(qry, scon);
            SqlDataReader sdr = scmd.ExecuteReader();
            string id = "";
            while (sdr.Read())
            {

                RadioButton rdb = (RadioButton)plhsadd.FindControl(sdr["id"].ToString());
                if (rdb.Checked)
                {
                    id = rdb.ID;
                }
            }
            if (id == "")
            {
                System.Windows.Forms.MessageBox.Show("No Shipping Address selected!");
                Response.Redirect("myaddressbook.aspx");
            }
            else
            {
                string dqry="DELETE from shipping_address where user_id='" +  Session["user"].ToString() + "' and id='" + id + "'";
                SqlCommand scmdd=new SqlCommand(dqry,scon);
                scmdd.ExecuteNonQuery();
                Response.Redirect("myaddressbook.aspx");
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            int max=0, id=0;
            string idqry = "SELECT MAX(id) FROM shipping_address";
            SqlDataAdapter idsda = new SqlDataAdapter(idqry, scon);
            DataTable iddt = new DataTable();
            idsda.Fill(iddt);
            if (iddt.Rows.Count == 1)
            {
                if (iddt.Rows[0][0].ToString() == "")
                {
                    id = 1;
                }
                else
                {
                    max = Convert.ToInt32(iddt.Rows[0][0].ToString());
                    id = max + 1;
                }
            }

            string iqry="INSERT INTO shipping_address values('" + id + "','" + Session["user"].ToString() +"','" + ddlTitle.SelectedItem.Text + "','" + txtFirstName.Text + "','"+ txtMiddleName.Text + "','"+ txtLastName.Text + "','"+ txtEmail.Text + "','"+ txtTelephoneNo.Text + "','" + txtMobileNo.Text + "','"+ txtAddress.Text + "','" + ddlCity.SelectedItem.Text + "','" + ddlState.SelectedItem.Text + "','" + ddlCountry.SelectedItem.Text + "','" + txtPINCode.Text + "')";
            SqlCommand scmdsp = new SqlCommand(iqry, scon);
            scmdsp.ExecuteNonQuery();

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
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtFirstName.Text = " ";
        txtMiddleName.Text = " ";
        txtLastName.Text = " ";
        txtEmail.Text = " ";
        txtTelephoneNo.Text = " ";
        txtMobileNo.Text = " ";
        txtAddress.Text = " ";
        txtPINCode.Text = " ";
        ddlCity.SelectedIndex = 0;
        ddlState.SelectedIndex = 0;

    }
    protected void btnEditShippingAddress_Click(object sender, EventArgs e)
    {
        scon.Open();
        try
        {
            string qry = "SELECT * from shipping_address where user_id='" + Session["user"].ToString() + "'";
            SqlCommand scmd = new SqlCommand(qry, scon);
            SqlDataReader sdr = scmd.ExecuteReader();
            string id = "";
            while (sdr.Read())
            {

                RadioButton rdb = (RadioButton)plhsadd.FindControl(sdr["id"].ToString());
                if (rdb.Checked)
                {
                    id = rdb.ID;
                }
            }
            if (id == "")
            {
                System.Windows.Forms.MessageBox.Show("No Shipping Address selected!");
                Response.Redirect("myaddressbook.aspx");
            }
            else
            {
                Response.Redirect("editshippingaddress.aspx?id=" + id);
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
