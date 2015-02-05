<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="loginmyaccount.aspx.cs" Inherits="CLIENT_loginmyaccount"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
  <user:Header ID="header1" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<table class="main" cellpadding="0" cellspacing="0">
    <tr><td class="menubar">
        <user:loginmyaccountmenubar ID="loginmyaccountmenubar1" runat="server" />
    </td></tr>
</table>
<table><tr><td>&nbsp;</td></tr></table>
<table width="100%" style="height:70%; border-top: solid 0px #2aa4d2;">
<tr>
<td align="center" style="width:50%; height:100%;" valign="top">
	<table width="60%" style=" height:100%; border-left: solid 2px #2aa4d2;border-right: solid 2px #2aa4d2;border-bottom: solid 2px #2aa4d2" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
				<table width="100%" style="height:70%" cellpadding="0" cellspacing="0">
					<tr>
						<th colspan="2" style="line-height:25px">I am an existing Customer</th>
					</tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<asp:PlaceHolder ID="plhloginmyaccount" runat="server"></asp:PlaceHolder>
					<tr>
						<td class="hp" style="width:30%" align="left">User Id</td>
						<td><asp:TextBox ID="txtUserId" maxlength="24" Width="95%" runat="server"></asp:TextBox></td>
					</tr>
					<tr>
						<td class="hp" style="width:30%" align="left">Password</td>
						<td><asp:TextBox ID="txtPassword" TextMode="password" maxlength="24" Width="95%" runat="server"></asp:TextBox></td>
					</tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr>
						<td colspan="2" align="center"><asp:Button ID="btnSignInMyAccount" Text="Sign In" runat="server" OnClick="btnSignInMyAccount_Click" /></td>
					</tr>
					<tr><td>&nbsp;</td></tr>
				</table>
			</td>
		</tr>
		<tr>
			<td valign="bottom">
				<table width="100%" style="height:30%" cellpadding="0" cellspacing="0">
					<tr>
						<th style="line-height: 25px">I am a new shopper</th>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
					    <td align="left" style="font-size:small;color:#2582A4;line-height:20px;">Please click on the <font color="#87A019">"Sign up now!"</font>  button below to register and start shopping.</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
						<tr>
						<td align="center"><asp:Button ID="btnSignUpMyAccount" Text="Sign Up Now!" runat="server" PostBackUrl="~/CLIENT/userregister.aspx?id=myaccount" /></td>
					</tr>
					<tr><td>&nbsp;</td></tr>
				</table>
			</td>
		</tr>
	</table>
</td>
<td>
	<table><tr><td>&nbsp;</td></tr></table>
</td>
</tr>
</table>
</asp:Content>

