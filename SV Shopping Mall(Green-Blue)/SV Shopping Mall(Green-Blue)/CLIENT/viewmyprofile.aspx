<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="viewmyprofile.aspx.cs" Inherits="CLIENT_viewmyprofile"  %>
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
		<b style="font-size:15px;color:#2582A4">View My Profile</b>
	</td></tr>
</table>
<br /><br />

<%
    SqlConnection scon;
    
    scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
    scon.Open();
    try
    {
        string qry = "SELECT * FROM users where (user_id='" + Session["user"].ToString() + "')";
        SqlCommand scmd = new SqlCommand(qry, scon);
        SqlDataReader sdr = scmd.ExecuteReader();
        while (sdr.Read())
        {
%>
<table cellpadding="0" cellspacing="0" style="height:500px;" width="85%" align="center" class="sub">
	<tr><td valign="top" style="line-height: 15px">
		<table width="95%" align="center" class="main"><tr><td valign="bottom" style="color:#DD0000; font-size:medium;"><b>Hi <%= Session["firstname"].ToString()%></b></td></tr></table><br />
	</td></tr>
	<tr><td valign="top">
		<table width="95%" style="height:145px; font-size:13px;" cellpadding="0" cellspacing="1" align="center" class="sub">
			<tr>
			    <th style="width:37%;height:15px;" align="left">Personal Information</th>
			    <th style="width:63%;height:15px;" align="right"><a href="editmyprofile.aspx" style="color:#ffffcc">Edit My Profile</a></th>
			</tr>
			<tr>
				<td valign="middle"><b>&nbsp;&nbsp;First Name</b></td>			
				<td><%=sdr.GetValue(2).ToString()%></td>
			</tr>			
			<tr>
				<td><b>&nbsp;&nbsp;Middle Name</b></td>
				<td><%=sdr.GetValue(3).ToString()%></td>				
			</tr>						
			<tr>
				<td><b>&nbsp;&nbsp;Last Name</b></td>
				<td><%=sdr.GetValue(4).ToString()%></td>				
			</tr>			
			<tr>
				<td><b>&nbsp;&nbsp;Date Of Birth</b></td>
				<td><%=sdr.GetValue(5).ToString()%></td>
			</tr>
		</table>
		<table><tr><td>&nbsp;</td></tr></table>
		<table width="95%" style="height:250px; font-size:13px;" cellpadding="0" cellspacing="1" align="center" class="sub">
			<tr>
				<th style="width:37%;height:15px;"align="left"> Contact Details</th>
				<th style="width:63%;height:15px;" align="left">&nbsp;</th>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Email Address</b></td>
				<td><%=sdr.GetValue(8).ToString()%></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Telephone Number</b></td>
				<td><%=sdr.GetValue(6).ToString()%></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Mobile Number</b></td>
				<td><%=sdr.GetValue(7).ToString()%></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Address</b></td>
				<td><%=sdr.GetValue(9).ToString()%></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;City</b></td>
				<td><%=sdr.GetValue(10).ToString()%></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;State</b></td>
				<td><%=sdr.GetValue(11).ToString()%></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;Country</b></td>
				<td><%=sdr.GetValue(12).ToString()%></td>
			</tr>
			<tr>
				<td><b>&nbsp;&nbsp;PIN Code</b></td>
				<td><%=sdr.GetValue(13).ToString()%></td>
			</tr>
		</table>
	</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>
<%
        }
    }
    catch
    {
    }
    finally
    {
        scon.Close();
    }
%>
<br /><br />
</asp:Content>

