<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="viewshoppingcartandlist.aspx.cs" Inherits="CLIENT_viewshoppingcartandlist"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
   <user:Header ID="header1" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<table width="92%" align="center" class="sub">
	<tr><td>
		<a href="home.aspx" style="font-size:medium;">HOME</a>
		<b style="font-size:medium"> > </b>
		<a href="myaccount.aspx"  style="font-size:medium">My Account</a>
		<b style="font-size:medium"> > </b>
		<b style="font-size:15px;color:#2582A4">Shopping Cart and Shopping List</b>
		
	</td></tr>
</table>
<br />

<table width="92%" cellpadding="1" cellspacing="1" align="center" class="sub">
	<tr><td valign="top">
		<table width="95%" align="center" class="main"><tr><td valign="bottom" style="color:#DD0000; font-size:medium;"><b>Hi <%= Session["firstname"].ToString()%></b></td></tr></table><br />
	</td></tr>
	<tr><td>
		<table width="95%" align="center" cellspacing="0" cellpadding="0" class="sub">
			<tr><td colspan="2">
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<th colspan="7" style="line-height: 20px">Shopping Cart(Product to buy now)</th>
					</tr>
					<tr style="background-color:#CCCCCC;">
						<td style="width:5%;" class="vscal">&nbsp;</td>
						<td colspan="2" class="vscal" style="width:50%;"><b>Product Title</b></td>
						<td style="width:10%;" class="vscal" align="right"><b>Price(INR)</b></td>
						<td style="width:15%;" class="vscal" align="center"><b>Quantity</b></td>

						<td style="width:10%;" class="vscal" align="right">&nbsp;</td>
					</tr><tr><td colspan="7">&nbsp;</td></tr>
                    <asp:PlaceHolder ID="plhviewshoppingcart" runat="server"></asp:PlaceHolder>
                    <tr><td colspan="7">&nbsp;&nbsp;</td></tr>        
			        <tr><td colspan="7" class="vscal">&nbsp;</td></tr>
					<tr>
						<td>&nbsp;</td>
						<td style="width: 82px">&nbsp;</td>
						<td align="center">
							<asp:Button ID="btnProceedToCheckOut" Text="Proceed To Check Out" runat="server" OnClick="btnProceedToCheckOut_Click" />&nbsp;&nbsp;&nbsp;
							<asp:Button ID="btnShopMore" Text="Shop More" PostBackUrl="~/CLIENT/home.aspx" runat="server" />
						</td>
					</tr>
				</table>
			</td></tr>
			<tr><td style="border-top: solid 2px #2aa4d2" colspan="2">&nbsp;</td></tr>
			<tr><td>
				<table width="100%" style="height:100%" class="main" cellpadding="1" cellspacing="1">
					<tr>
						<td style=" width:5%" valign="top"><b>Please Note:</b></td>
						<td style=" width:95%;">
							<ul>
								<li style="font-size:10px; font-family:Verdana;">If you wish to buy all products in the "Shopping cart ", click on " Proceed to Order" Link.</li><li style="font-size:10px; font-family:Verdana;">If you like to buy any product on a later date, click on " Save for later " . The product will move to the Shopping list on this page.</li><li style="font-size:10px; font-family:Verdana;">You can buy more than one quantity by changing the quantity in the box above.</li></ul>	
						</td>
					</tr>
				</table>
			</td></tr>
		</table>
		<table><tr><td>&nbsp;</td></tr></table>
		<table width="95%" align="center" cellspacing="0" cellpadding="0" class="sub">
			<tr><td style="height:20">
				<table width="100%" align="center" cellpadding="0" cellspacing="0" class="main">
					<tr>
						<th colspan="3" style="line-height: 20px"><a id="s1" name="s1"></a>Shopping List</th>
					</tr>
					<tr style="background-color:#CCCCCC;">
						<td class="vscal">&nbsp;</td>
						<td class="vscal"><b>Product Title</b></td>
						<td class="vscal"><b>Price(INR)</b></td>
					</tr>
					<%
                        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);		    
                        scon.Open();
                        try
                        {
                            string qry="SELECT * from shopping_list where user_id='" + Session["user"].ToString() + "'";
                            SqlCommand scmd=new SqlCommand(qry,scon);
                            SqlDataReader sdr=scmd.ExecuteReader();
                            if(sdr.HasRows)
                            {
                                while(sdr.Read())
                                {
                                    string pshlqry="SELECT * from product where product_no='" + sdr.GetValue(1).ToString() + "'";
                                    SqlCommand pshlscmd=new SqlCommand(pshlqry,scon);
                                    SqlDataReader pshlsdr=pshlscmd.ExecuteReader();
                                    while(pshlsdr.Read())
                                    {
                                        %>
                                        <tr><td colspan="3">&nbsp;</td></tr>
                                        <tr><td>&nbsp;</td><td><%= pshlsdr.GetValue(2).ToString() %></td><td><%=pshlsdr.GetValue(4).ToString() %></td></tr>
                                        <tr><td colspan="3">&nbsp;</td></tr>
                                        <tr><td>&nbsp;</td><td><a href='movetoshoppingcart.aspx?productno=<%= pshlsdr.GetValue(1).ToString() %>' style='font-size:small;color:#DD0000;'>Move to Cart</a></td></tr>
                                        <tr><td>&nbsp;</td><td><a href='deletefromshoppinglist.aspx?productno=<%= pshlsdr.GetValue(1).ToString() %>' style='font-size:small;color:#DD0000;'>Delete</a></td></tr>
                                        <tr><td style="height:10%" class="vscal" colspan="3">&nbsp;</td></tr>
                                        <%
                                    }
                                }
                            }
                            else
				            {
                                %>
                   		        <tr><td colspan="3">&nbsp;</td></tr>
                                <tr><td colspan="3" style="color:#DD0000;">|<b> &nbsp;&nbsp;No Products saved!</b></td></tr>
                                <tr><td colspan="3">&nbsp;</td></tr>
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
				</table>
			</td></tr>
			<tr><td style="border-top: solid 2px #2aa4d2" colspan="2">&nbsp;</td></tr>
			<tr>
				<td>
					<ul>
						<li style="font-size:10px; font-family:Verdana;">At any point of time you can always move products from the " Shopping Cart " to the " Shopping List " to buy the same on a later date. All products in the " Shopping List " will be saved and can be viewed at any time in the future. </li>
						<li style="font-size:10px; font-family:Verdana;">To buy the product from the " Shopping List ", click on " Move to Cart " link. The product will move to the " Shopping Cart " and thereafter you can click on " Proceed to Order " button.</li></ul>
				</td>
			</tr>
		</table>
	</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br /><br />
</asp:Content>

