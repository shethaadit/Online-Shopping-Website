<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="viewthankyou.aspx.cs" Inherits="CLIENT_viewthankyou"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
    <user:Header ID="header1" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<table width="95%" align="center" class="sub">
	<tr><td>
		<a href="home.aspx" style="font-size:medium;">HOME</a>
		<b style="font-size:medium"> > </b>
		<b style="font-size:15px;color:#2582A4">Thank You</b>
	</td></tr>
</table>
<br /><br />

<table width="95%" align="center" class="sub">
	<tr><td style="height: 14px">&nbsp;</td></tr>
	<tr><td align="center">
        <%
            SqlConnection scon=new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            DataTable sdt=new DataTable();
            DataTable pdt=new DataTable();
            DataTable ommdt = new DataTable();
            DataTable omdt = new DataTable();
            scon.Open();
            try
            {
                int maxordno = 0;
                string ommqry = "SELECT MAX(order_no) FROM order_master";
                SqlDataAdapter ommsda = new SqlDataAdapter(ommqry, scon);
                ommsda.Fill(ommdt);
                maxordno = Convert.ToInt32(ommdt.Rows[0][0]);

                string omqry = "SELECT * from order_master where order_no='" + maxordno + "'";
                SqlDataAdapter omsda = new SqlDataAdapter(omqry, scon);
                omsda.Fill(omdt);

                if (Session["paymenttype"].ToString() == "Cheque" || Session["paymenttype"].ToString() == "Cheque/DD pickup")
                {
        %>
        <table width="95%" style="height:100%; line-height:15px; font-size:small;" class="sub">
            <tr><th colspan="5" style="line-height:25px;">Thank You</th></tr>
	        <tr><td style="width:100%" align="left">Thank you for shopping at <b>SV Shopping</b></td></tr>
	        <tr><td style="width:100%" align="left">Your Order No. is <%= omdt.Rows[0][0].ToString()%></td></tr>
	        <tr><td style="width:100%" align="left">You will receive an order confirmation e-mail shortly.</td></tr>
	        <tr><td style="width:100%" align="left">Please make your cheque/draft in favour of <b>SV Shopping</b> payable at <b>RAJKOT</b>. Mention your full name and order number on the back of the cheque/draft. </td></tr>
	        <tr><td style="width:100%" align="left">A representative of our service provider (cheque collection agency) will call you within 24-72 hours on a working day and fix a time and date when to pick up the cheque from the billing address as per your order. The service provider will send us the Cheque/DD for encashment and credit to your account and we will do a local bank clearance of your payment. Your order will be serviced/dispatched only after the realisation of the Cheque/DD.</td></tr>
	        <tr><td style="width:100%" align="left"><a href="viewchequeddpickup.aspx" target="_blank" style="color:#999933;font-size:2;">Click here</a><font color="#000000"> to see Cheque/DD pickup facility locations.</font></td></tr>
	        <tr><td style="width:100%" align="left">Your order will be processed/serviced after realisation of your payment.</td></tr>
        </table>
        <%
            }
        %>
    </td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td style="width:50%;" align="center" valign="top">
        <table cellpadding="0" cellspacing="0" width="95%" style="height:100%; line-height:15px; font-size:small;" class="sub">
            <tr><th colspan="5" style="line-height:25px;">Order Summary</th></tr>
            <tr><td colspan="5"><b>Payment Mode :</b> <%= Session["paymenttype"].ToString()%></td></tr>
            <tr style="background-color:#CCCCCC;">
                <td style="width:25%" class="vsab"><b>Product(s)</b></td>
                <td style="width:25%" class="vsab"><b>Shipping Address</b></td>
                <td style="width:7%" class="vsab" align="center"><b>Qty</b></td>
                <td style="width:12%" class="vsab" align="center"><b>Price</b></td>
                <td style="width:12%" class="vsab" align="center"><b>Amt</b></td>
            </tr>
            <tr><td colspan="5">&nbsp;</td></tr>
            <%
                string odqry = "SELECT  * from order_details where order_no='" + maxordno + "'";
                SqlCommand odscmd = new SqlCommand(odqry, scon);
                SqlDataReader odsdr = odscmd.ExecuteReader();
                while (odsdr.Read())
                {
                    string pqry = "SELECT * from product where product_no='" + odsdr.GetValue(1).ToString() + "'";
                    SqlDataAdapter psda = new SqlDataAdapter(pqry, scon);
                    pdt.Clear();
                    psda.Fill(pdt);

                    string sqry = "SELECT * from shipping_address where id='" + omdt.Rows[0][4].ToString() + "'";
                    SqlDataAdapter ssda = new SqlDataAdapter(sqry, scon);
                    sdt.Clear();
                    ssda.Fill(sdt);
                    string address="";
                    address = sdt.Rows[0][9].ToString() + "<br />" + sdt.Rows[0][10].ToString() + "<br /> " + sdt.Rows[0][11].ToString() + "(" + sdt.Rows[0][12].ToString() + ")<br />" + sdt.Rows[0][13].ToString();
               		 %>   
                    <tr style="line-height:20px;" align="left">
	                    <td valign="top"><%=pdt.Rows[0][2].ToString()%></td>
	                    <td valign="top"><%=address%></td>
	                    <td valign="top" align="center"><%=odsdr.GetValue(2).ToString()%></td>
	                    <td valign="top" align="center"><%=pdt.Rows[0][4].ToString()%></td>
	                    <td valign="top" align="center"><%=odsdr.GetValue(3).ToString()%></td>	
                    </tr>
                    <tr><td colspan="5"><hr color="#CCCCCC" /></td></tr>
            <%
                }
            }
            catch
            {
            }
            finally
            {
                scon.Close();
    
            }		    		    
            %>		
            <tr><td colspan="5"><hr size="2" style="color:#2aa4d2" /></td></tr>
            <tr>
                <td colspan="4" align="Left"><strong>Sub Total</strong></td>
                <td><%=omdt.Rows[0][6].ToString() %></td>
            </tr>
            <tr>
                <td colspan="4" align="Left"><strong>Total Product Price(With all charges and discounts included)</strong></td>
                <td><%=omdt.Rows[0][6].ToString() %></td>
            </tr>
            <tr>
                <td colspan="4" align="Left"><strong>Total</strong></td>
                <td><%=omdt.Rows[0][6].ToString() %></td>
            </tr>
        </table>
    </td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td style="width:50%;" align="center" valign="top">
         <table width="95%" cellpadding="0" cellspacing="0" class="sub" style="height:100%;line-height:25px; font-size:13px;">
            <tr>
                <th  style="line-height:25px;">Your Billing address as per our records is as under</th>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <%
                scon.Open();	
                try
                {		    	    
                    string baqry = "SELECT   * from users where user_id='" + Session["user"].ToString() + "'";
                    SqlCommand bascmd = new SqlCommand(baqry, scon);
                    SqlDataReader basdr = bascmd.ExecuteReader();
                    while (basdr.Read())
                    {
            %>
            <tr><td align="left"><%=basdr.GetValue(2).ToString()%>&nbsp;<%=basdr.GetValue(3).ToString()%>&nbsp;<%=basdr.GetValue(4).ToString()%></td></tr>
            <tr><td align="left"><%=basdr.GetValue(9).ToString()%></td></tr>
            <tr><td align="left"><%=basdr.GetValue(10).ToString()%>,&nbsp;<%=basdr.GetValue(11).ToString()%></td></tr>
            <tr><td align="left">Pincode - <%=basdr.GetValue(13).ToString()%></td></tr>
            <tr><td align="left">Mobile No. - <%=basdr.GetValue(7).ToString()%></td></tr>   
            <%
                    }
                }
                catch
                {
                }
                finally
                {
                    scon.Close();
                    Session["productno"] = null;
                    Session["productqty"] = null;
                    Session["producttotalqty"] = null;
                    Session["totalamt"] = null;
                    Session["shippingid"] = null;
                    Session["paymenttype"] = null;
                }		    
            %>
            <tr><td>&nbsp;</td></tr>
        </table>
    </td></tr>
    <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnOk" Text="Back To Home!" PostBackUrl="~/CLIENT/home.aspx" runat="server" /></td></tr>
    <tr><td>&nbsp;</td></tr>
</table>
<br /><br />
</asp:Content>

