<%@ Control Language="C#" AutoEventWireup="true" CodeFile="shippingaddressdetails.ascx.cs" Inherits="CLIENT_UserControl_shippingaddressdetails" %>
<table width="100%" height="100%" cellpadding="1" cellspacing="1">
	<tr>
		<th colspan="2" style="line-height: 25px" align="left">Enter a New Shipping Address </th>
		<th align="right"> * Mandatory Fields </th>
	</tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td><b>&nbsp;&nbsp;Title: * </b></td>
		<td>
			<asp:DropDownList ID="ddlTitle" runat="server">
				<asp:ListItem Selected="true">Mr.</asp:ListItem>
				<asp:ListItem>Mrs.</asp:ListItem>
				<asp:ListItem>Ms.</asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td><b>&nbsp;&nbsp;First Name: * </b></td>
		<td>
		    <asp:TextBox ID="txtFirstName" style="WIDTH:50%" maxlength="24"  runat="Server"></asp:TextBox>
		    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ForeColor="Maroon" ControlToValidate="txtFirstName" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		</td>    
	</tr>
	<tr>
		<td><b>&nbsp;&nbsp;Middle Name: * </b></td>
		<td>
		    <asp:TextBox ID="txtMiddleName" style="WIDTH:50%" maxlength="24"  runat="Server"></asp:TextBox>
		    <asp:RequiredFieldValidator ID="rfvMiddleName" runat="server" ForeColor="Maroon" ControlToValidate="txtMiddleName" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		</td>				
	</tr>						
	<tr>
		<td><b>&nbsp;&nbsp;Last Name: * </b></td>
		<td>
		    <asp:TextBox ID="txtLastName" style="WIDTH:50%" maxlength="24"  runat="Server"></asp:TextBox>
		    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ForeColor="Maroon" ControlToValidate="txtLastName" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		</td>
	</tr>	
	<tr>
		<td><b>&nbsp;&nbsp;Email Address: * </b></td>
		<td>
		    <asp:TextBox ID="txtEmail" style="WIDTH:50%" maxlength="99" runat="Server"></asp:TextBox>
		    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ForeColor="Maroon" ControlToValidate="txtEmail" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		    <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="E-mail address must be in a valid format" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
		</td>
	</tr>
	<tr>
		<td><b>&nbsp;&nbsp;Telephone Number: * </b></td>
		<td>
		    <asp:TextBox ID="txtTelephoneNo" style="WIDTH:50%" maxlength="14"  runat="Server"></asp:TextBox>
		    <asp:RequiredFieldValidator ID="rfvTelephoneNo" runat="server" ForeColor="Maroon" ControlToValidate="txtTelephoneNo" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		    <asp:RegularExpressionValidator ID="revPhoneNo" ControlToValidate="txtTelephoneNo" ErrorMessage="You must enter at least 7 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{7,}"></asp:RegularExpressionValidator>
		</td>
	</tr>
	<tr>
		<td><b>&nbsp;&nbsp;Mobile Number: * </b></td>
		<td>
		    <asp:TextBox ID="txtMobileNo" style="WIDTH:50%" maxlength="14" runat="Server"></asp:TextBox>
		    <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ForeColor="Maroon" ControlToValidate="txtMobileNo" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		    <asp:RegularExpressionValidator ID="revMobileNo" ControlToValidate="txtMobileNo" ErrorMessage="You must enter at least 10 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{10,15}"></asp:RegularExpressionValidator>
		</td>
	</tr>
	<tr>
		<td><b>&nbsp;&nbsp;Address: * </b></td>
		<td>
		    <asp:TextBox ID="txtAddress" TextMode="MultiLine" style="WIDTH:50%" Rows="3" maxlength="499" runat="Server"></asp:TextBox>
		    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ForeColor="Maroon" ControlToValidate="txtAddress" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<td><b>&nbsp;&nbsp;City: * </b></td>
		<td><asp:DropDownList ID="ddlCity" style="WIDTH:50%" runat="server"></asp:DropDownList></td>
	</tr>
	<tr>
		<td><b>&nbsp;&nbsp;State: * </b></td>
		<td><asp:DropDownList ID="ddlState" style="WIDTH:50%" runat="Server"></asp:DropDownList></td>
	</tr>
	<tr>
		<td><b>&nbsp;&nbsp;Country: * </b></td>
		<td>
			<asp:DropDownList ID="ddlCountry" style="WIDTH:50%" runat="Server" Enabled="false">
				<asp:ListItem Selected="True">India</asp:ListItem>
			</asp:DropDownList>								
		</td>
	</tr>
	<tr>
		<td><b>&nbsp;&nbsp;PIN Code: * </b></td>
		<td>
		    <asp:TextBox ID="txtPINCode" style="WIDTH:50%" maxlength="14" runat="Server"></asp:TextBox>
		    <asp:RequiredFieldValidator ID="rfvPINCode" runat="server" ForeColor="Maroon" ControlToValidate="txtPINCode" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
        <td>&nbsp;</td>
        <td align="left">
            <b style="font-size:small; color:Maroon;">* Required Field</b><br />
            <asp:ValidationSummary ID="vssad" CssClass="rfv" ForeColor="Maroon" DisplayMode="BulletList" runat="server" />
        </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<asp:Button ID="btnSave" Text="Ship To This Address" style="WIDTH:50%" runat="server" OnClick="btnSave_Click" />
			<asp:Button ID="btnReset" Text="Reset" CausesValidation="false" OnClick="btnReset_Click" style="WIDTH:20%" runat="server" />
		</td>
	</tr>		
	<tr><td colspan="3">&nbsp;</td></tr>
</table>
