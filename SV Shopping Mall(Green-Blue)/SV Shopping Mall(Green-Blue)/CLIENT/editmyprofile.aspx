<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="editmyprofile.aspx.cs" Inherits="CLIENT_editmyprofile"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
   <user:Header ID="header1" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<table width="85%" align="center" class="sub">
	<tr><td>
		<a href="home.aspx" style="font-size:medium;">HOME</a>
		<b style="font-size:medium"> > </b>
		<a href="myaccount.aspx"  style="font-size:medium">My Account</a>
		<b style="font-size:medium"> > </b>
		<b style="font-size:15px;color:#2582A4">Edit My Profile</b>
	</td></tr>
</table>
<br /><br />

<table cellpadding="0" cellspacing="0"  style="height:500px;" width="85%" align="center" class="sub">
	<tr><td valign="top">
		<table width="90%" align="center" class="main"><tr><td valign="bottom" style="color:#DD0000; font-size:medium;"><b>Hi <%= Session["firstname"].ToString()%></b></td></tr></table><br />
	</td></tr>
	<tr><td valign="top">
		<table width="95%" style="height:150px" cellpadding="0" cellspacing="2" align="center" class="sub">
			<tr>
				<th style="width:37%;height:25px; color:#FFFFFF;" align="left">Personal Information</th>
                <th style="width:63%;height:25px" align="left">&nbsp;</th>			    
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;First Name</b></td>
				<td>
				    <asp:TextBox ID="txtFirstName" maxlength="24"  style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvFirstName" ForeColor="Maroon" runat="server" ControlToValidate="txtFirstName" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Middle Name</b></td>
				<td>
				    <asp:TextBox ID="txtMiddleName" maxlength="24"  style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvMiddleName" ForeColor="Maroon" runat="server" ControlToValidate="txtMiddleName" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
				</td>				
			</tr>						
			<tr>
				<td><b>&nbsp;&nbsp;Last Name</b></td>
				<td>
				    <asp:TextBox ID="txtLastName" maxlength="24" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvLastName" ForeColor="Maroon" runat="server" ControlToValidate="txtLastName" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>			
			<tr>
				<td><b>&nbsp;&nbsp;Date Of Birth</b></td>
				<td>
					<asp:DropDownList ID="ddlDate" runat="server">
					    <asp:ListItem>--DD--</asp:ListItem>
					</asp:DropDownList>
					<asp:DropDownList ID="ddlMonth" runat="server">
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
					<asp:DropDownList ID="ddlYear" runat="server">
					    <asp:ListItem>--YY--</asp:ListItem>
				    </asp:DropDownList>
				</td>				
			</tr>
		</table>
		<table><tr><td>&nbsp;</td></tr></table>
		<table width="95%" style="height:250px" cellpadding="0" cellspacing="2" align="center" class="sub">
			<tr>
				<th style="width:37%;height:25px; color:#FFFFFF;" align="left"><b>Contact Details</b></th>
				<th style="width:63%;" align="left">&nbsp;</th>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Email Address</b></td>
				<td>
				    <asp:TextBox ID="txtEmailAddress" maxlength="99" style="WIDTH:40%" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" ForeColor="Maroon" runat="server" ControlToValidate="txtEmailAddress" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmailAddress" ErrorMessage="E-mail address must be in a valid format" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Telephone Number</b></td>
				<td>
				    <asp:TextBox ID="txtTelephoneNumber" maxlength="14" style="WIDTH:40%" runat="Server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvPhoneNo" ForeColor="Maroon" runat="server" ControlToValidate="txtTelephoneNumber" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPhoneNo" ControlToValidate="txtTelephoneNumber" ErrorMessage="You must enter at least 7 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{7,}"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Mobile Number</b></td>
				<td>
				    <asp:TextBox ID="txtMobileNumber" maxlength="14" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvMobileNo" ForeColor="Maroon" runat="server" ControlToValidate="txtMobileNumber" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>&nbsp;
                    <asp:RegularExpressionValidator ID="revMobileNo" ControlToValidate="txtMobileNumber" ErrorMessage="You must enter at least 10 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{10,15}"></asp:RegularExpressionValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Address</b></td>
				<td>
				    <asp:TextBox ID="txtAddress" TextMode="MultiLine" Rows="3" maxlength="499" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvAddress" ForeColor="Maroon" runat="server" ControlToValidate="txtAddress" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;City</b></td>
					<td>
						<asp:DropDownList ID="ddlCity" runat="server" style="WIDTH:30%">
							<asp:ListItem Selected="true">-City-</asp:ListItem>
						</asp:DropDownList>					
					</td>
				</tr>
				<tr>
					<td><b>&nbsp;&nbsp;State</b></td>
					<td>
						<asp:DropDownList ID="ddlState" runat="server" style="WIDTH:30%">
							<asp:ListItem Selected="true">-State-</asp:ListItem>
						</asp:DropDownList>				
					</td>
				</tr>					
			<tr>
				<td><b>&nbsp;&nbsp;Country</b></td>
				<td>
					<asp:DropDownList ID="ddlCountry" runat="server" style="WIDTH:40%" Enabled="false">
						<asp:ListItem Selected="true">India</asp:ListItem>
					</asp:DropDownList>								
				</td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;PIN Code</b></td>
				<td>
				    <asp:TextBox ID="txtPINCode"  maxlength="14" style="WIDTH:40%" runat="server"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="rfvPINCode" ForeColor="Maroon" runat="server" ControlToValidate="txtPINCode" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
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
					<asp:Button ID="btnSave" Text="Save" style="WIDTH:20%" runat="server" OnClick="btnSave_Click" />
					<asp:Button ID="btnCancel" Text="Exit Without Saving" runat="server" CausesValidation="false" PostBackUrl="~/CLIENT/myaccount.aspx" />
				</td>
			</tr>					
		</table>
	</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

<br /><br />

</asp:Content>

