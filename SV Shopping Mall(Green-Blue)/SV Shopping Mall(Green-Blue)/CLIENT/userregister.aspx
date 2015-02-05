<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="userregister.aspx.cs" Inherits="CLIENT_userregister"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
  <user:Header ID="header1" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<table width="90%" align="center" class="sub">
	<tr><td style="height: 20px">
		<a href="home.aspx" style="font-size:medium;">HOME</a>
		<b style="font-size:medium"> > </b>
		<b style="font-size:15px;color:#2582A4">Register</b>
	</td></tr>
</table>
<br />

<table border="0" width="90%" cellpadding="0" cellspacing="0" align="center">
    <tr><td colspan="2">&nbsp;</td></tr>
    <tr>
        <td valign="top">
            <table width="100%" border="0" style="height:100%;" align="center" cellpadding="1" cellspacing="0" class="sub">
                <tr>
                    <th align="center" style="line-height:25px;"colspan="2">Personal Information</th>
                </tr>
                <tr><td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 26px;"><b>&nbsp;&nbsp;SV User Id:</b></td>
                    <td style="height: 26px">
                        <asp:TextBox ID="txtUserId" MaxLength="24" runat="server" Width="25%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUserId" runat="server" ForeColor="Maroon" ControlToValidate="txtUserId" Display="Dynamic" CssClass="rfv" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-family:Verdana; font-size:small;">
                        (Please enter your valid email ID as your user ID e.g. hemant@domain.com, please note that this should be a valid
                        email ID as we would be sending information related to your order on this email ID.)
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;Password:</b></td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="password" MaxLength="24" Width="25%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" ForeColor="Maroon" runat="server" ControlToValidate="txtPassword" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>(Enter password without any Special Characters.)
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;Retype Password:</b></td>
                    <td>
                        <asp:TextBox ID="txtRetypePassword" TextMode="password" MaxLength="24" Width="25%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRetypePassword" ForeColor="Maroon" runat="server" ControlToValidate="txtRetypePassword" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPassword" ForeColor="Maroon" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRetypePassword" CssClass="rfv" Text="*" ErrorMessage="Retype Password is not match with the Password."></asp:CompareValidator>
                    </td>

                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;First Name:</b></td>
                    <td>
                        <asp:TextBox ID="txtFirstName" MaxLength="24" Width="25%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" ForeColor="Maroon" runat="server" ControlToValidate="txtFirstName" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;Middle Name:</b></td>
                    <td>
                        <asp:TextBox ID="txtMiddleName" MaxLength="24" Width="25%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMiddleName" ForeColor="Maroon" runat="server" ControlToValidate="txtMiddleName" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                    </td>

                </tr>
                <tr>
                    <td style="height: 26px"><b>&nbsp;&nbsp;Last Name:</b></td>
                    <td style="height: 26px">
                        <asp:TextBox ID="txtLastName" MaxLength="24" Width="25%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" ForeColor="Maroon" runat="server" ControlToValidate="txtLastName" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="height: 24px"><b>&nbsp;&nbsp;Date Of Birth:</b></td>
                    <td style="height: 24px">
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
                <tr>
                    <td><b>&nbsp;&nbsp;Address:</b></td>
                    <td>
                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" Rows="4" MaxLength="499" Width="25%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" ForeColor="Maroon" runat="server" ControlToValidate="txtAddress" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;City:</b></td>
                    <td>
                        <asp:DropDownList ID="ddlCity" Width="25%" runat="server">
                            <asp:ListItem Selected="True">-City-</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;State:</b></td>
                    <td>
                        <asp:DropDownList ID="ddlState" Width="25%" runat="server">
                            <asp:ListItem Selected="True">-State-</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;Country:</b></td>
                    <td>
                        <asp:DropDownList ID="ddlCountry" Width="25%" Enabled="false" runat="server">
                            <asp:ListItem Selected="True">India</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;PIN Code:</b></td>
                    <td>
                        <asp:TextBox ID="txtPINCode" Width="25%" runat="server" MaxLength="15"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPINCode" ForeColor="Maroon" runat="server" ControlToValidate="txtPINCode" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;Telephone No:</b></td>
                    <td>
                        <asp:TextBox ID="txtPhoneNo" Width="25%" MaxLength="14" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhoneNo" ForeColor="Maroon" runat="server" ControlToValidate="txtPhoneNo" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhoneNo" ControlToValidate="txtPhoneNo" ErrorMessage="You must enter at least 7 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{7,}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;Mobile No:</b></td>
                    <td>
                        <asp:TextBox ID="txtMobileNo" MaxLength="12" Width="25%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMobileNo" ForeColor="Maroon" runat="server" ControlToValidate="txtMobileNo" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>&nbsp;
                        <asp:RegularExpressionValidator ID="revMobileNo" ControlToValidate="txtMobileNo" ErrorMessage="You must enter at least 10 characters!" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\d{10,15}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><b>&nbsp;&nbsp;Email:</b></td>
                    <td>
                        <asp:TextBox ID="txtEmail" MaxLength="100" Width="25%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" ForeColor="Maroon" runat="server" ControlToValidate="txtEmail" CssClass="rfv" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="E-mail address must be in a valid format" ForeColor="maroon" runat="server" CssClass="rfv" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="left">
                        <b style="font-size:small; color:Maroon;">* Required Field</b><br />
                        <asp:ValidationSummary ID="vsur" CssClass="rfv" ForeColor="Maroon" DisplayMode="BulletList" runat="server" />
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnRegister" Text="Register" runat="server" Style="width: 10%" OnClick="btnRegister_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnReset" Text="Reset" runat="server" Style="width: 10%" CausesValidation="false" OnClick="btnReset_Click" />
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
            </table>    
        </td>
    </tr>
</table>
<br />
<br />
</asp:Content>

