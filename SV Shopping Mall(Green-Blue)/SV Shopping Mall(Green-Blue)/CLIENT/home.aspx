<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="CLIENT_home"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
  <user:Header ID="header1" runat="server" /> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmenubar" Runat="Server">
<table class="main" cellpadding="0" cellspacing="0">
    <tr><td class="menubar">
        <user:HomeMenuBar ID="homemenubar1" runat="server" />
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
        <td valign="top">
            <user:HomePage ID="HmoePage1" runat="server" />
        </td>
    </tr>
</table>
</asp:Content>

