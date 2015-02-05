<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="addproductfeature.aspx.cs" Inherits="addproductfeature"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
<!-- #include file="addmenu.aspx" -->  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<div class="table" style="width: 40%; height: 50%; z-index: 100; left: 1%; top: 1%; position:absolute;">
    <table style="height:100%" cellpadding="0" cellspacing="0"  class="add">
        <tr>
            <th colspan="2">Product</th>
        </tr>
        <tr>
            <td><asp:Label ID="lblProductFeatureNo" Text="No:" runat="server" Width="15%"></asp:Label></td>
            <td><asp:TextBox ID="txtProductFeatureNo" Columns="30" Enabled="false" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblProductFeatureName" Text="Name:" runat="server"  Width="10%"></asp:Label></td>
            <td><asp:TextBox ID="txtProductFeatureName" Columns="30" Enabled="false" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblProductFeature" Text="Feature:" runat="server"></asp:Label></td>
            <td><asp:TextBox ID="txtProductFeature" Columns="30" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2">
                Features:<br />
                <asp:ListBox ID="lstProductFeature" Width="20%" Visible="false" runat="server"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                    <asp:Button ID="btnFinish" Text="Finish"  Width="30%" runat="server" OnClick="btnFinish_Click" />
                     &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAdd" Text="Add"  Width="30%" runat="server" OnClick="btnAdd_Click"/>
                </center>
            </td>
        </tr>
    </table>
</div>
</asp:Content>

