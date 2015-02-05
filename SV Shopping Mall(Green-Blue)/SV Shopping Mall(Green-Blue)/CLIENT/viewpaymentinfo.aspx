<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="viewpaymentinfo.aspx.cs" Inherits="CLIENT_viewpaymentinfo"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
   <user:Header ID="header1" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<table width="90%" align="center" class="sub">
	<tr><td>
		<a href="home.aspx" style="font-size:medium;">HOME</a>
		<b style="font-size:medium"> > </b>
		<a href="viewshoppingcartandlist.aspx"  style="font-size:medium">Shopping Cart</a>
		<b style="font-size:medium"> > </b>
		<b style="font-size:15px;color:#2582A4">Payment Information</b>
	</td></tr>
</table>
<br /><br />

<table width="90%" align="center" class="sub">
    <tr><td valign="top">
		<table width="95%" align="center" class="main"><tr><td valign="bottom" style="color:#DD0000; font-size:medium;"><b>Hi <%= Session["firstname"].ToString()%></b></td></tr></table><br />
	</td></tr>
	<tr><td>
	 	<table width="95%" align="center" cellspacing="0" cellpadding="0" class="sub">
			<tr><td>		
				<user:ViewOrderDetails ID="vieworderdetails2" runat="server" />
			</td></tr>
		</table>
		<table><tr><td>&nbsp;</td></tr></table>
		<table width="95%" align="center" cellspacing="0" cellpadding="0" class="sub">
			<tr><td>
				<user:viewPaymentOptions ID="viewpaymentoption1" runat="server" />
			</td></tr>
		</table>
		<table><tr><td>&nbsp;</td></tr></table>
		<table width="95%" align="center" cellspacing="0" cellpadding="0" class="sub">			
			<tr><td colspan="2"  style="font-size:12px;line-height:20px;">After clicking on "Proceed to Pay" above, you still have an opportunity to review/change your order.</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td style="width:10%;" valign="top"><b>Please Note:</b> </td>
				<td><ul>
					<li style="font-size:12px;line-height:17px;">The value of your order will reflect in your credit card statement in your local currency.</li>
					<li style="font-size:12px;line-height:17px;">There can be a variation in the order value (non INR) as reflected in your credit card statement on account of foreign exchange differences.</li>
				</ul></td>
			</tr>
		</table>			
	</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br /><br />
</asp:Content>

