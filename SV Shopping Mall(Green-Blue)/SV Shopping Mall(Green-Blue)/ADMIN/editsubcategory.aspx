<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="editsubcategory.aspx.cs" Inherits="editsubcategory"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
<!-- #include file="menu.aspx" -->  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<script language="javascript" type="text/javascript">

function DisplayImage()
{   
   var path=document.getElementById('ctl00_cntmaincontent_FileUpload1').value;
   document.getElementById('ctl00_cntmaincontent_Image1').src=path;
}
</script>
<div class="table" style="width: 100%; height: 60%; z-index: 100; left: 1%; top: 1%; position:absolute;">
<table style="height:100%" cellpadding="0" cellspacing="0"  class="add">
    <tr valign="top" style="height:100%;">
        <td style="width:50%; height: 100%;border-right: black 1px solid;">
            <table style="height:100%;" cellspacing="0" cellpadding="0" class="add">
                <tr>
                     <th colspan="3">Sub Category</th>
                </tr>
                <tr>
                    <td style="width:50%"><asp:Label ID="lblSubCategoryNo" Text="No:" runat="server" Width="15%"></asp:Label></td>
                    <td style="width:50%"><asp:TextBox ID="txtSubCategoryNo" Enabled="false" Columns="30" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblSubCategoryName" Text="Name:" runat="server"  Width="10%"></asp:Label></td>
                    <td><asp:TextBox ID="txtSubCategoryName" Columns="30" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvSubCategoryName" Text="*" runat="server" ErrorMessage="Enter Sub-Category Name" ControlToValidate="txtSubCategoryName" Display="Dynamic" SetFocusOnError="True" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblAddSubCategory_Category" Text="Category:" runat="server"></asp:Label></td>
                    <td><asp:DropDownList ID="ddlAddSubCategory_Category" Width="91%" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblFileUploadImage" Text="Image:" runat="server"></asp:Label></td>
                    <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <center>
                            <asp:Button ID="btnSave" Text="Save" Width="30%" runat="server" OnClick="btnSave_Click" />
                             &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" Text="Cancel" Width="30%" runat="server" CausesValidation="false" PostBackUrl="~/ADMIN/viewsubcategory.aspx" />
                        </center>
                    </td>
                </tr>
            </table>
        </td>
        <td valign="middle" style="height: 100%;">
            <center><img id="Image1" src="" alt="No Image"   width="180" height="180" runat="server" /></center>
        </td>
    </tr>
</table>
</div>
<div style=" z-index: 100; left: 1%; top: 62%; position:absolute; width: 312px;">
    <table width="100%">
        <tr>
            <td>
                <asp:ValidationSummary ID="vsc" runat="server" CssClass="vc" ForeColor="Maroon" Width="100%" Height="32px" />
            </td>
        </tr>
    </table>
</div>
</asp:Content>

