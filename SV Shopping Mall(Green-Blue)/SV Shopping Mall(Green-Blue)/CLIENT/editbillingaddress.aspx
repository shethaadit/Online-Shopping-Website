<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="editbillingaddress.aspx.cs" Inherits="CLIENT_editbillingaddress"  %>
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
		<b style="font-size:15px;color:#2582A4">Edit Billing Address</b>
	</td></tr>
</table>
<br /><br />

<table width="90%" align="center" class="sub">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
		    <table width="90%" align="center" class="sub">
			<tr><th colspan="2" style="height:25px">Edit Billing Address</th></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td style="width:35%"><b>First Name:</b></td>
				<td style="width:65%">
				    <asp:TextBox ID="txtFirstName" maxlength="24" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvFirstName" ControlToValidate="txtFirstName" runat="server" ForeColor="Maroon" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td style="width:35%"><b>Middle Name:</b></td>
				<td style="width:65%">
				    <asp:TextBox ID="txtMiddleName" maxlength="24" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvMiddleName" runat="server" ForeColor="Maroon" ControlToValidate="txtMiddleName" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td style="width:35%"><b>Last Name:</b></td>
				<td style="width:65%">
				    <asp:TextBox ID="txtLastName" maxlength="24" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ForeColor="Maroon" ControlToValidate="txtLastName" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td style="width:35%"><b>Address:</b></td>
				<td style="width:65%">
				    <asp:TextBox ID="txtAddress" TextMode="multiLine" Rows="3" style="WIDTH:40%" maxlength="499"  runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ForeColor="Maroon" ControlToValidate="txtAddress" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td><b>City:</b></td>
				<td><asp:DropDownList ID="ddlCity" style="WIDTH:40%" runat="server"></asp:DropDownList></td>
			</tr>
			<tr>
				<td><b>State:</b></td>
				<td><asp:DropDownList ID="ddlState" style="WIDTH:40%" runat="server"></asp:DropDownList></td>
			</tr>
			<tr>
				<td><b>Country:</b></td>
				<td>
					<asp:DropDownList ID="ddlCountry" style="WIDTH:40%" runat="Server" Enabled="false">
						<asp:ListItem Selected="true">India</asp:ListItem>
					</asp:DropDownList>								
				</td>
			</tr>			
			<tr>
				<td style="width:35%;"><b>Mobile No.:</b></td>
				<td style="width:65%">
				    <asp:TextBox ID="txtMobileNo" maxlength="14" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ForeColor="Maroon" ControlToValidate="txtMobileNo" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		            <asp:RegularExpressionValidator ID="revMobileNo" ControlToValidate="txtMobileNo" ErrorMessage="You must enter at least 10 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{10,15}"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td style="width:35%"><b>Phone No.:</b></td>
				<td style="width:65%">
				    <asp:TextBox ID="txtPhoneNo" maxlength="14" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ForeColor="Maroon" ControlToValidate="txtPhoneNo" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		            <asp:RegularExpressionValidator ID="revPhoneNo" ControlToValidate="txtPhoneNo" ErrorMessage="You must enter at least 7 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{7,}"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td style="width:35%"><b>Email:</b></td>
				<td style="width:65%">
				    <asp:TextBox ID="txtEmail" maxlength="99" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ForeColor="Maroon" ControlToValidate="txtEmail" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		            <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="E-mail address must be in a valid format" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td><b>PIN Code:</b></td>
				<td>
				    <asp:TextBox ID="txtPINCode"  maxlength="14" style="WIDTH:40%" runat="server"></asp:TextBox>
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
				    <asp:Button ID="btnEdit" Text="Edit Billing Address" style="WIDTH:40%" runat="server" OnClick="btnEdit_Click" />
				    <asp:Button ID="btnCancel" Text="Cancel" style="WIDTH:40%" CausesValidation="false" PostBackUrl="~/CLIENT/myaddressbook.aspx" runat="server" />
				</td>
			</tr>
		</table>
	</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br /><br />
</asp:Content>

