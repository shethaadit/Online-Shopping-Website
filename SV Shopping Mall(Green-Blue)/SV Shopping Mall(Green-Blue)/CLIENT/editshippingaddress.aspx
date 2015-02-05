<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="editshippingaddress.aspx.cs" Inherits="CLIENT_editshippingaddress"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
   <user:Header ID="header1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<table width="90%" align="center" class="sub">
	<tr><td>
		<a href="home.aspx" style="font-size:medium;">HOME</a>
		<b style="font-size:medium"> > </b>
		<a href="myaccount.aspx"  style="font-size:medium">My Account</a>
		<b style="font-size:medium"> > </b>
		<a href="myaddressbook.aspx" style="font-size:medium">My Address Book</a>
		<b style="font-size:medium"> > </b>
		<b style="font-size:15px;color:#2582A4">Edit Shipping Address</b>
	</td></tr>
</table>
<br /><br />

<table width="90%" align="center" class="sub">
	<tr><td>&nbsp;</td></tr>
	<tr><td>
        <table width="90%" align="center" class="sub">
		    <tr>
			    <th colspan="2" style="height:25px">Edit Shipping Address</th>
		    </tr>
		    <tr><td colspan="2">&nbsp;</td></tr>
		    <tr>
				<td><b>&nbsp;&nbsp;Title</b></td>
				<td>
					<asp:DropDownList ID="ddlTitle" runat="server">
						<asp:ListItem Selected="true">Mr.</asp:ListItem>
						<asp:ListItem>Mrs.</asp:ListItem>
						<asp:ListItem>Ms.</asp:ListItem>
					</asp:DropDownList>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;First Name:</b></td>
				<td>
				    <asp:TextBox ID="txtFirstName" style="WIDTH:40%" maxlength="24"  runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvFirstName" ControlToValidate="txtFirstName" runat="server" ForeColor="Maroon" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Middle Name:</b></td>
				<td>
				    <asp:TextBox ID="txtMiddleName" style="WIDTH:40%" maxlength="24"  runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvMiddleName" runat="server" ForeColor="Maroon" ControlToValidate="txtMiddleName" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>				
			</tr>						
			<tr>
				<td><b>&nbsp;&nbsp;Last Name:</b></td>
				<td>
				    <asp:TextBox ID="txtLastName" style="WIDTH:40%" maxlength="24"  runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ForeColor="Maroon" ControlToValidate="txtLastName" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>	
			<tr>
				<td><b>&nbsp;&nbsp;Email Address:</b></td>
				<td>
				    <asp:TextBox ID="txtEmail" style="WIDTH:40%" maxlength="99" runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ForeColor="Maroon" ControlToValidate="txtEmail" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		            <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="E-mail address must be in a valid format" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Telephone Number:</b></td>
				<td>
				    <asp:TextBox ID="txtTelephoneNo" style="WIDTH:40%" maxlength="14"  runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvTelephoneNo" runat="server" ForeColor="Maroon" ControlToValidate="txtTelephoneNo" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		            <asp:RegularExpressionValidator ID="revPhoneNo" ControlToValidate="txtTelephoneNo" ErrorMessage="You must enter at least 7 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{7,}"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Mobile Number:</b></td>
				<td>
				    <asp:TextBox ID="txtMobileNo" style="WIDTH:40%" maxlength="14" runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ForeColor="Maroon" ControlToValidate="txtMobileNo" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		            <asp:RegularExpressionValidator ID="revMobileNo" ControlToValidate="txtMobileNo" ErrorMessage="You must enter at least 10 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{10,15}"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Address:</b></td>
				<td>
				    <asp:TextBox ID="txtAddress" TextMode="MultiLine" style="WIDTH:40%" Rows="3" maxlength="499" runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ForeColor="Maroon" ControlToValidate="txtAddress" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;City:</b></td>
				<td><asp:DropDownList ID="ddlCity" style="WIDTH:40%" runat="server"></asp:DropDownList></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;State:</b></td>
				<td><asp:DropDownList ID="ddlState" style="WIDTH:40%" runat="Server"></asp:DropDownList></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Country:</b></td>
				<td>
					<asp:DropDownList ID="ddlCountry" style="WIDTH:40%" runat="Server" Enabled="false">
						<asp:ListItem Selected="true">India</asp:ListItem>
					</asp:DropDownList>								
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;PIN Code:</b></td>
				<td>
				    <asp:TextBox ID="txtPINCode" style="WIDTH:40%" maxlength="14" runat="Server"></asp:TextBox>
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
					<asp:Button ID="btnEdit" Text="Edit Shipping Address" style="WIDTH:40%" runat="server" OnClick="btnEdit_Click" />
					<asp:Button ID="btnCancel" Text="Cancel" style="WIDTH:20%" CausesValidation="false" PostBackUrl="~/CLIENT/myaddressbook.aspx" runat="server" />
				</td>
			</tr>		
        </table>
    </td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br /><br />
</asp:Content>

