<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="CLIENT_changepassword"  %>

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
		<b style="font-size:15px;color:#2582A4">Change Password</b>
	</td></tr>
</table>
<br /><br />

<table cellpadding="0" cellspacing="0" width="85%" align="center" class="sub">
	<tr><td valign="top">
		<table width="98%" align="center" class="main"><tr><td valign="bottom" style="color:#DD0000; font-size:medium;"><b>Hi <%= Session["firstname"].ToString()%></b></td></tr></table><br />
	</td></tr>
	<tr><td style="height:4"></td></tr>
	<tr><td>
		<table border="0" width="98%" cellpadding="0" cellspacing="2" align="center">
			<tr>
				<th style="width:30%;height:25px;" align="left">Change Password</th>
				<th style="width:70%;" align="left">&nbsp;</th>
			</tr>
			<tr>
				<td style="border:solid 1px #2aa4d2;font-weight:bold;">Current Password</td>
				<td style="border:solid 1px #2aa4d2;">&nbsp;<asp:TextBox ID="txtOldPassword" TextMode="password" maxlength="24" runat="server"></asp:TextBox></td>
			</tr>
			<tr>
				<td style="border:solid 1px #2aa4d2;font-weight:bold;">New Password</td>
				<td style="border:solid 1px #2aa4d2;font-weight:bold;">&nbsp;<asp:TextBox ID="txtNewPassword" TextMode="password" maxlength="24" runat="server"></asp:TextBox></td>				
			</tr>			
			<tr>
				<td style="border:solid 1px #2aa4d2;font-weight:bold;">Verify New Password</td>
				<td style="border:solid 1px #2aa4d2;font-weight:bold;">&nbsp;<asp:TextBox ID="txtConfirmNewPassword" TextMode="password" maxlength="24" runat="server"></asp:TextBox></td>				
			</tr>			
			<tr>
				<td style="border:solid 1px #2aa4d2;">&nbsp;</td>
				<td style="border:solid 1px #2aa4d2;">
					<asp:Button ID="btnChange" Text="Change" style="Width:20%" runat="server" OnClick="btnChange_Click" />
					<asp:Button ID="btnCancel" Text="Cancel" runat="server" PostBackUrl="~/CLIENT/myaccount.aspx" />
				</td>
			</tr>
		</table>
	</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br /><br />
</asp:Content>


