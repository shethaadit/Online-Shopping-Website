<%@ Control Language="C#" AutoEventWireup="true" CodeFile="homelogin.ascx.cs" Inherits="CLIENT_UserControl_homelogin" %>

<table width="100%" cellpadding="0" cellspacing="0" style="height:100%;" class="main">
	<tr>
		<th align="center" colspan="2">Login</th>		
	</tr>
	<asp:PlaceHolder ID="plhhomelogin" runat="server"></asp:PlaceHolder>
	<tr>
		<td style="width:15%;" class="hp">UserName:</td>
		<td><asp:TextBox ID="txtUserId" Width="90%" MaxLength="25" runat="server"></asp:TextBox></td>
	</tr>
	<tr>
		<td class="hp">Password:</td>
		<td><asp:TextBox ID="txtPassword" TextMode="Password" width="90%" MaxLength="25" runat="server"></asp:TextBox></td>
		<asp:HiddenField ID="hdnHome" Value="home" runat="server" />
	</tr>
	<tr>
		<td colspan="2" align="center" valign="middle"><asp:Button ID="btnSignIn" Text="Sign In" Width="40%" runat="server" OnClick="btnSignIn_Click" /></td>
	</tr>
	<tr><td colspan="2" align="center"><b style="color:#2582A4;">If not Registered</b></td></tr>
	<tr><td colspan="2" align="center"><a href="userregister.aspx?link=home" style="color:#87A019;;font-size:medium;">Register Now !!!</a></td></tr>
	<tr>
		<td colspan="2" style="height:5%; background-image:url(../App_Themes/CLIENT/background_images/hmleftbg.gif);">&nbsp;</td>
	</tr>
</table>

