<%@ Control Language="C#" AutoEventWireup="true" CodeFile="viewpaymentoptions.ascx.cs" Inherits="CLIENT_UserControl_viewpaymentoptions" %>

<table width="100%" border="0">
	<tr><th style="width:50%" colspan="3">Choose mode of payment</th></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td style="width:50%"><asp:RadioButton  ID="rdbcheque" Text="Cheque" GroupName="rdopaymentoption" Checked="true" runat="server" /></td>
		<td style="width:50%"><asp:RadioButton ID="rdbchequeddpickup"  Text="Cheque/DD pickup" GroupName="rdopaymentoption" runat="server"/>
			<a href="viewchequeddpickup.aspx" target="_blank" style="color:#DD0000;font-size:smaller;text-decoration:underline;">View Cheque/DD pick up Location</a></td>
		<td rowspan="3" style="border-left: 1 solid #2aa4d2"><img alt="" src="../App_Themes/CLIENT/background_images/thawte_logo1.gif" width="100" height="100" /></td>
	</tr>
	<tr>
		<td style="width:50%"><asp:RadioButton ID="rdbcreditcard" Text="Credit Card (Visa/Master)" GroupName="rdopaymentoption" runat="server" />
			<img alt="" src="../App_Themes/CLIENT/background_images/visa.jpg" width="40" height="25" align="middle" />
			<img alt="" src="../App_Themes/CLIENT/background_images/master_card.jpg" width="40" height="25" align="middle" /></td>
		<td style="width:50%"><asp:RadioButton ID="rdbaecc" Text="American Express Credit Card" GroupName="rdopaymentoption" runat="server" />
			<img src="../App_Themes/CLIENT/background_images/amex-logo.jpg" alt="" width="50" height="25" align="middle" />
		</td>
	</tr>
	<tr>
		<td style="width:50%" colspan="2"><asp:RadioButton  ID="rdbib" Text="Internet Banking" GroupName="rdopaymentoption"  runat="server"/>
			<font size="1">(ABN Amro Bank | Axis Bank | Bank of Baroda | Bank of India | Centurion Bank of Punjab | HDFC Bank | IDBI Bank | IndusInd Bank | Kotak Bank | Punjab National Bank | Union Bank of India)</font>
		</td>
	</tr>
	<tr> <td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3" align="center"><asp:Button ID="btnProceedToPay" Text="Proceed To Pay" runat="server" OnClick="btnProceedToPay_Click" /></td></tr>
    <tr><td>&nbsp;</td></tr>	
</table>
