<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="editproductfeature.aspx.cs" Inherits="editproductfeature"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
<!-- #include file="menu.aspx" -->  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<div class="table" style="width: 40%; height: 40%; z-index: 100; left: 1%; top: 1%; position:absolute;">
    <table style="height:100%" cellpadding="0" cellspacing="0"  class="add">
        <tr>
            <th colspan="2">Product</th>
        </tr>
        <tr>
            <td><asp:Label ID="lblProductFeatureNo" Text="No:" runat="server" Width="15%"></asp:Label></td>
            <td><asp:TextBox ID="txtProductFeatureNo" Enabled="false" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblProductFeatureName" Text="Name:" runat="server"  Width="10%"></asp:Label></td>
            <td><asp:TextBox ID="txtProductFeatureName" Enabled="false" runat="server"></asp:TextBox></td>
        </tr>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
        </asp:PlaceHolder>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="btnFinish" Text="Finish" runat="server" OnClick="btnFinish_Click" /></center>
            </td>
        </tr>
    </table>
</div>
</asp:Content>

