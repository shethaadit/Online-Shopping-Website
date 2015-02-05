<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="myaddressbook.aspx.cs" Inherits="CLIENT_myaddressbook"  %>
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
		<b style="font-size:15px;color:#2582A4">My Address Book</b>
	</td></tr>
</table>
<br /><br />

<table cellpadding="0" cellspacing="0" width="90%" align="center" class="sub">
    <tr><td>
        <table width="90%" align="center" class="main"><tr><td valign="bottom" style="color:#DD0000; font-size:medium;"><b>Hi <%= Session["firstname"].ToString()%></b></td></tr></table><br />
    </td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td  valign="top">
        <table width="95%" cellpadding="0" cellspacing="2" align="center" style="border: solid 1px #2aa4d2;height:25px">
			<tr>
				<th align="left" style="height:25px;width:30%;color:#FFFFFF; font-size:small;"><b>&nbsp;&nbsp;Billing Address</b></th>
				<th colspan="9" align="right" style="color:#FFFFFF;font-size:smaller;">Click on the "Edit" button to edit the billing address
					<asp:Button ID="btnEdit" Text="Edit" CausesValidation="false" runat="server" PostBackUrl="~/CLIENT/editbillingaddress.aspx" />
				</th>
			</tr>
			<tr><td colspan="10">
				<table width="100%" style="height:70%;border:solid 1px #2aa4d2;" cellpadding="0" cellspacing="0" align="center">
					<tr class="mab">
						<td style="height:30px;" class="mab"><b>&nbsp;Name</b></td>
						<td class="mab"><b>&nbsp;Address</b></td>
						<td class="mab"><b>&nbsp;City</b></td>
						<td class="mab"><b>&nbsp;State</b></td>
						<td class="mab"><b>&nbsp;Mobile Number</b></td>
						<td class="mab"><b>&nbsp;Telephone Number</b></td>
						<td class="mab"><b>&nbsp;Email</b></td>												
					</tr>
					<asp:PlaceHolder ID="plhbadd" runat="server"></asp:PlaceHolder>
				</table>
			</td></tr>
		</table>
    </td></tr>
    <tr><td style="height:20px;">&nbsp;</td></tr>
    <tr><td>
        <table width="95%" cellpadding="0" style="border:solid 1px #2aa4d2;" cellspacing="2" align="center">
			<tr>
				<th align="left" style="width:30%;height:25px;color:#FFFFFF;font-size:small;"><b>&nbsp;&nbsp;Shipping Address(s)</b>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<asp:Button ID="btnEditShippingAddress" Text="Edit Shipping Address" CausesValidation="false" runat="server" OnClick="btnEditShippingAddress_Click" />&nbsp;&nbsp;&nbsp;
					<asp:Button ID="btnDeleteShippingAddress" Text="Delete Shipping Address" CausesValidation="false" runat="server" OnClick="btnDeleteShippingAddress_Click"/>
				</th>
			</tr>
			<tr><td>
				<table width="100%" style="height:70%; border:solid 1px #2aa4d2;" cellpadding="0" cellspacing="0" align="center">
					<tr class="mab">
					    <td class="mab">&nbsp;</td>
						<td style="height:30px;" class="mab"><b>&nbsp;Name</b></td>
						<td class="mab"><b>&nbsp;Address</b></td>
						<td class="mab"><b>&nbsp;City</b></td>
						<td class="mab"><b>&nbsp;State</b></td>
						<td class="mab"><b>&nbsp;Phone No</b></td>
						<td class="mab"><b>&nbsp;Mobile No</b></td>
						<td class="mab"><b>&nbsp;Email</b></td>	
					</tr>
					<asp:PlaceHolder ID="plhsadd" runat="server"></asp:PlaceHolder>
				</table>
			</td></tr>
		</table>
    </td></tr>
    <tr><td style="height:20px;">&nbsp;</td></tr>
    <tr><td>
        <table width="95%" style="height:150px" cellpadding="0" cellspacing="2" align="center" class="sub">
			<tr>
				<th align="left" style="height:25px;width:30%;color:#FFFFFF; font-size:small;"><b>&nbsp;Add New Shipping Address</b></th>
				<th align="left" style="height:25px;width:70%;color:#FFFFFF; font-size:smaller;">&nbsp;
					You can add a new shipping address which can be used when you place an order
				</th>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Title:</b></td>
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
				    <asp:TextBox ID="txtFirstName" style="WIDTH:30%" maxlength="24"  runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvFirstName" ControlToValidate="txtFirstName" runat="server" ForeColor="Maroon" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Middle Name:</b></td>
				<td>
				    <asp:TextBox ID="txtMiddleName" style="WIDTH:30%" maxlength="24"  runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvMiddleName" runat="server" ForeColor="Maroon" ControlToValidate="txtMiddleName" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>				
			</tr>						
			<tr>
				<td><b>&nbsp;&nbsp;Last Name:</b></td>
				<td>
			        <asp:TextBox ID="txtLastName" style="WIDTH:30%" maxlength="24"  runat="Server"></asp:TextBox>
			        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ForeColor="Maroon" ControlToValidate="txtLastName" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
			    </td>				
			</tr>	
			<tr>
				<td><b>&nbsp;&nbsp;Email Address:</b></td>
				<td>
				    <asp:TextBox ID="txtEmail" style="WIDTH:30%" maxlength="99" runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ForeColor="Maroon" ControlToValidate="txtEmail" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		            <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="E-mail address must be in a valid format" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Telephone Number:</b></td>
				<td>
				    <asp:TextBox ID="txtTelephoneNo" style="WIDTH:30%" maxlength="14"  runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvTelephoneNo" runat="server" ForeColor="Maroon" ControlToValidate="txtTelephoneNo" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		            <asp:RegularExpressionValidator ID="revPhoneNo" ControlToValidate="txtTelephoneNo" ErrorMessage="You must enter at least 7 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{7,}"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Mobile Number:</b></td>
				<td>
			        <asp:TextBox ID="txtMobileNo" style="WIDTH:30%" maxlength="14" runat="Server"></asp:TextBox>
			        <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ForeColor="Maroon" ControlToValidate="txtMobileNo" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
		            <asp:RegularExpressionValidator ID="revMobileNo" ControlToValidate="txtMobileNo" ErrorMessage="You must enter at least 10 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{10,15}"></asp:RegularExpressionValidator>
			    </td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Address:</b></td>
				<td>
				    <asp:TextBox ID="txtAddress" TextMode="MultiLine" style="WIDTH:30%" Rows="3" maxlength="499" runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ForeColor="Maroon" ControlToValidate="txtAddress" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;City:</b></td>
				<td><asp:DropDownList ID="ddlCity" style="WIDTH:30%" runat="server"></asp:DropDownList></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;State:</b></td>
				<td><asp:DropDownList ID="ddlState" style="WIDTH:30%" runat="Server"></asp:DropDownList></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Country:</b></td>
				<td>
					<asp:DropDownList ID="ddlCountry" style="WIDTH:30%" runat="Server" Enabled="false">
						<asp:ListItem Selected="true">India</asp:ListItem>
					</asp:DropDownList>								
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;PIN Code:</b></td>
				<td>
				    <asp:TextBox ID="txtPINCode" style="WIDTH:30%" maxlength="14" runat="Server"></asp:TextBox>
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
					<asp:Button ID="btnSave" Text="Add New Shipping Address" style="WIDTH:30%" runat="server" OnClick="btnSave_Click" />
					<asp:Button ID="btnReset" Text="Reset" style="WIDTH:20%" runat="server" CausesValidation="false" OnClick="btnReset_Click" />
				</td>
			</tr>		
		</table>
    </td></tr>
    <tr><td style="height:25px;">&nbsp;</td></tr>
</table>
<br /><br />
</asp:Content>

