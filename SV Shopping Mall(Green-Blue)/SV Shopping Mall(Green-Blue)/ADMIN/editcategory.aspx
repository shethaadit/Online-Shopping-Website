<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="editcategory.aspx.cs" Inherits="editcategory"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
    <!-- #include file="menu.aspx" -->  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<div class="table" style="width: 40%; height: 40%; z-index: 100; left: 1%; top: 1%; position:absolute;">
   <table style="height:100%" cellpadding="0" cellspacing="0"  class="add">
        <tr>
            <th colspan="3">Category</th>
        </tr>
        <tr>
            <td><asp:Label ID="lblCategoryNo" Text="No:" runat="server" Width="15%"></asp:Label></td>
            <td><asp:TextBox ID="txtCategoryNo" Columns="25" Enabled="false" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblCategoryName" Text="Name:" runat="server"  Width="10%"></asp:Label></td>
            <td><asp:TextBox ID="txtCategoryName" Columns="25" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rfvCategoryName" Text="*" runat="server" ErrorMessage="Enter Category Name" ControlToValidate="txtCategoryName" Display="Dynamic" SetFocusOnError="True" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="3">
                <center>
                    <asp:Button ID="btnSave" Text="Save" Width="30%" runat="server" OnClick="btnSave_Click"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" Text="Cancel" Width="30%" runat="server" CausesValidation="false" PostBackUrl="~/ADMIN/viewcategory.aspx" />
                </center>
            </td>
        </tr>
    </table>
</div>
<div class="" style="z-index: 100; left: 1%; top: 42%; position:absolute;">
<table>
        <tr>
            <td>
                <asp:ValidationSummary ID="vsc" runat="server" CssClass="vc" ForeColor="Maroon" Width="193px" Height="32px" />
            </td>
        </tr>
    </table>
</div>
</asp:Content>

