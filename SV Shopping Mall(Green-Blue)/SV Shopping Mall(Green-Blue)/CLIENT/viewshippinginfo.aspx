<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="viewshippinginfo.aspx.cs" Inherits="CLIENT_viewshippinginfo"  %>
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
		<a href="viewshoppingcartandlist.aspx" style="font-size:medium">Shopping Cart</a>
		<b style="font-size:medium"> > </b>
		<b style="font-size:15px;color:#2582A4">Shipping Information</b>
	</td></tr>
</table>
<br /><br />

<table width="92%" cellpadding="1" cellspacing="1" align="center" class="sub">
	<tr><td valign="top">
		<table width="95%" align="center" class="main"><tr><td valign="bottom" style="color:#DD0000; font-size:medium;"><b>Hi <%= Session["firstname"].ToString()%></b></td></tr></table><br />
	</td></tr>
	<tr><td>
		<table width="95%" align="center" cellspacing="0" cellpadding="0" class="sub">
			<tr><td>		
				<!-- #include file="viewshippingdetails.aspx" -->
			</td></tr>
		</table>
		<table><tr><td>&nbsp;</td></tr></table>
		<table width="95%" align="center" cellspacing="0" cellpadding="0" class="sub">
			<tr><td>
				<user:ViewOrderDetails ID="vieworderdetails1" runat="server" />
			</td></tr>
		</table>
		<table><tr><td>&nbsp;</td></tr></table>
		<table width="95%" align="center" cellspacing="0" cellpadding="0" class="sub">			
			<tr><td>
				<user:ViewShippingAddressBook ID="viewshippingaddressbook1" runat="server" />
			</td></tr>
		</table>
		<table><tr><td>&nbsp;</td></tr></table>
		<table width="95%" align="center" cellspacing="0" cellpadding="0" class="sub">			
			<tr><td>
			    <user:ShippingAddressDetails ID="shippingaddressdetails1" runat="server" />
			</td></tr>
		</table>
	</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br /><br />
</asp:Content>

