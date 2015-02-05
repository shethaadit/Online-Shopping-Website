<%@ Control Language="C#" AutoEventWireup="true" CodeFile="americanexpressdetails.ascx.cs" Inherits="CLIENT_americanexpressdetails" %>
<table width="100%" style="height:30%" cellpadding="0" cellspacing="0" class="sub">
	<tr>
		<th colspan="4" style="height:25">Payment Option: Credit Card Details</th>
	</tr>
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr>
		<td>Credit Card Number</td>
		<td colspan="3"><asp:TextBox ID="txtCreditCardNo" maxlength="13" runat="server"></asp:TextBox>Please enter your 15 digit AMEX credit<br />card number without any spaces.</td>
	</tr>
	<tr>
		<td>Four Digit CVV Number</td>
		<td><asp:TextBox ID="txtCVVNo" maxlength="4" runat="server"></asp:TextBox></td>
		<td>A 4-digit number on the front,<br />just above your credit card number.</td>
		<td><img src="../App_Themes/CLIENT/background_images/cvv-amex.jpg" alt="No Image" width="150" height="100" /></td>
	</tr>
	<tr>
		<td>Expiry Date</td>
		<td colspan="3">
			<asp:DropDownList ID="ddlCreditCardMonth" runat="server">
				<asp:ListItem>--MM--</asp:ListItem>
				<asp:ListItem>Jan</asp:ListItem>
				<asp:ListItem>Feb</asp:ListItem>
				<asp:ListItem>Mar</asp:ListItem>
				<asp:ListItem>Apr</asp:ListItem>
				<asp:ListItem>May</asp:ListItem>
				<asp:ListItem>Jun</asp:ListItem>
				<asp:ListItem>Jul</asp:ListItem>
				<asp:ListItem>Aug</asp:ListItem>
				<asp:ListItem>Sep</asp:ListItem>
				<asp:ListItem>Oct</asp:ListItem>
				<asp:ListItem>Nov</asp:ListItem>
				<asp:ListItem>Dec</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList ID="ddlCreditCardYear" runat="server">
				<asp:ListItem>--YY--</asp:ListItem>
			</asp:DropDownList>
			Please enter expiry date provided on your card 
		</td>
	</tr>
</table>