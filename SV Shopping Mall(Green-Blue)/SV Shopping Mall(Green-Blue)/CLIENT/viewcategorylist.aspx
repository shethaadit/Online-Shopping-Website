<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster.master" AutoEventWireup="true" CodeFile="viewcategorylist.aspx.cs" Inherits="CLIENT_viewcategorylist"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
  <user:Header ID="header1" runat="server" /> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmenubar" Runat="Server">
<table class="main" cellpadding="0" cellspacing="0">
    <tr><td class="menubar">
        <user:CategoryMenuBar ID="categorymenuBar1" runat="server" />
    </td></tr>
</table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<table cellpadding="0" cellspacing="0" border="0" class="main" style="width:100%; height:100%; border-top:solid 2px #2aa4d2">
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
            <%--category list display--%>
            <table width="100%" style="height:25px;" cellpadding="0" cellspacing="0" class="main">
			    <tr>
				    <td colspan="3" align="center" style=" font-size:large; color:#87A019;height:25px; font-weight:bold;">Category</td>
			    </tr>
			</table>
			<table width="100%" cellpadding="0" cellspacing="0" class="sub">
				<tr><td>&nbsp;</td></tr>
				<tr><td>
					<asp:PlaceHolder ID="plhviewcategorylist" runat="server"></asp:PlaceHolder>			
				</td></tr>
			</table>
            <%--category list display end--%>
        </td>
        <td style="width:15%;" valign="top">
            <user:Gift ID="gift1" runat="server" />
        </td>
    </tr>
</table>

</asp:Content>

