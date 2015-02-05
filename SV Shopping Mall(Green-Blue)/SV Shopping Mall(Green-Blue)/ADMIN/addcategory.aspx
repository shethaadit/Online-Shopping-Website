<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="addcategory.aspx.cs" Inherits="addcategory"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
    <!-- #include file="addmenu.aspx" -->  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<div class="table" style="width: 40%; height: 40%; z-index: 100; left: 1%; top: 1%; position:absolute;">
    <table style="height:100%" cellpadding="0" cellspacing="0" border="0"  class="add">
        <tr>
            <th colspan="3">Category</th>
        </tr>
        <tr>
            <td style="width:37%"><asp:Label ID="lblCategoryNo" Text="No:" runat="server" Width="15%"></asp:Label></td>
            <td style="width:201px"><asp:TextBox ID="txtCategoryNo" Columns="25" runat="server" AutoCompleteType="Disabled"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rfvCategoryNo" Text="*" runat="server" ErrorMessage="Enter Category No" ControlToValidate="txtCategoryNo" Display="Dynamic" SetFocusOnError="True" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblCategoryName" Text="Name:" runat="server"  Width="10%"></asp:Label></td>
            <td style="width: 201px"><asp:TextBox ID="txtCategoryName" Columns="25" runat="server" AutoCompleteType="Disabled" TabIndex="1"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rfvCategoryName" Text="*" runat="server" ErrorMessage="Enter Category Name" ControlToValidate="txtCategoryName" Display="Dynamic" SetFocusOnError="True" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="3">
                <center>
                    <asp:Button ID="btnSave" Text="Save" runat="server" WIDTH="30%" OnClick="btnSave_Click" TabIndex="2" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" Width="30%" PostBackUrl="~/ADMIN/add.aspx" CausesValidation="False" TabIndex="3" />
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

