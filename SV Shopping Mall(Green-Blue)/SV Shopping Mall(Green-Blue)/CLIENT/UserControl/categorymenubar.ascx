<%@ Control Language="C#" AutoEventWireup="true" CodeFile="categorymenubar.ascx.cs" Inherits="CLIENT_UserControl_categorymenubar" %>

<table>
    <tr>
        <td style="width:30%;" align="center">
            <asp:TextBox ID="txtSearchProductName" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_Click" />
        </td>
        <td style="width:30%;"></td>
        <td style="width:10%;"><a href="home.aspx" class="menu">Home</a></td>
	    <td style="width:15%;"><a class="menu" style="color:#2582A4;">Category</a></td>
	    <td style="width:15%;"><a href="myaccount.aspx?id=myaccount" class="menu">My Account</a></td>
	    <td style="width:10%;"><a href="help.aspx" class="menu">Help</a></td>
    </tr>
</table>