<%@ Control Language="C#" AutoEventWireup="true" CodeFile="viewshippingaddressbook.ascx.cs" Inherits="CLIENT_UserControl_viewshippingaddressbook" %>

<table width="100%" cellpadding="0" cellspacing="0" class="sub">
	<tr>
		<th colspan="10" style="line-height:30px;height:30px;" align="left">Shipping Address Book &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
		    <asp:Button ID="btnShipFromAddress" Text="Ship to this Address" runat="server" CausesValidation="false" OnClick="btnShipFromAddress_Click" />
		</th>
	</tr>
	<tr valign="top" style="background-color:#CCCCCC">
		<td style="width:3%;" class="vsab">&nbsp;</td>
		<td style="width:15%;" class="vsab">Name</td>
		<td style="width:13%;" class="vsab">Address</td>
		<td style="width:10%;" class="vsab">Mobile Number</td>
		<td style="width:10%;" class="vsab">Phone Number</td>
		<td style="width:15%;" class="vsab">Email</td>
	</tr>
	<asp:PlaceHolder ID="plhvsab" runat="server"></asp:PlaceHolder>
</table>
