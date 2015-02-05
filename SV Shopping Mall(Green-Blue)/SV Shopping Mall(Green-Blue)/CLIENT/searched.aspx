<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster.master" AutoEventWireup="true" CodeFile="searched.aspx.cs" Inherits="CLIENT_searched"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
  <user:Header ID="header1" runat="server" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmenubar" Runat="Server">
<table class="main" cellpadding="0" cellspacing="0">
    <tr>
        <td class="menubar">  
           <user:MenuBar ID="menubar1" runat="server" />   
        </td>
    </tr>
</table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<table cellpadding="0" cellspacing="0" border="0" class="main" style="width: 100%;border-top:solid 2px #2aa4d2">
    <tr>
        <td class="leftside" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="height:100%;">
                <tr style="width:100%;">
                    <td style="width:100%; height:40%;" valign="top">
                        <login:HomeLogin ID="login1" runat="server" />
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>    
                        <user:HomeCategoryList ID="homecategorylist1" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
        <td style="" valign="top">
            <table><tr><td>&nbsp;</td></tr></table>
            <table align="center" width="90%" style="height:25;" cellpadding="0" cellspacing="0" class="sub">
				<tr>
					<td valign="middle"><a href="home.aspx" style="font-size:medium;">HOME</a></td>						
				</tr>
			</table>
			<table><tr><td>&nbsp;</td></tr></table>					
			<table align="center" width="90%" style="height:50px;" cellpadding="0" cellspacing="0" class="sub">
				<tr>
					<td width="88%" align="center" style="background-color:#dadade;height:25px;font-size:large;color:#CC6600">Search Result</td>
				</tr>
				<tr>
					<td style="line-height:20px">
						<br />We found no results 
						that closely match the entered word.<br /><br />Suggestions : <br />Make sure word/words are spelled correctly <br />Try 
						different keywords <br />Try more general keywords and shorter ones (i.e. if you are looking for Robert Ludlum 
						then type "Ludlum" for better results)<br />Try using different spelling combinations e.g. "Rosemarry and 
						"Rosemerry", "Lycra" and "Lycara"<br />							
					</td>
				</tr>
			</table>
        </td>
    </tr>
</table>
</asp:Content>

