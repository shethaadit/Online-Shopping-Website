<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="addproduct.aspx.cs" Inherits="addproduct"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
<!-- #include file="addmenu.aspx" -->  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<script language="javascript" type="text/javascript">

function DisplayImage()
{   
   var path=document.getElementById('ctl00_cntmaincontent_FileUpload1').value;
   document.getElementById('Image1').src=path;
}
</script>

<div class="table" style="width: 100%; height: 70%; z-index: 100; left: 1%; top: 1%; position:absolute;">
<table style="height:100%" cellpadding="0" cellspacing="0"  class="add">
    <tr valign="top" style="height:100%;">
        <td style="width:50%; height: 100%;border-right: #2aa4d2 1px solid;">
            <table style="height:100%;" cellspacing="0" cellpadding="0" class="add">
                    <tr>
                         <th colspan="3">Product</th>
                    </tr>
                <tr>
                    <td style="width:40%"><asp:Label ID="lblProductNo" Text="No:" runat="server" Width="15%"></asp:Label></td>
                    <td><asp:TextBox ID="txtProductNo" Width="95%" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvProductNo" Text="*" runat="server" ErrorMessage="Enter Product No." ControlToValidate="txtProductNo" Display="Dynamic" SetFocusOnError="True" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblProductName" Text="Name:" runat="server"  Width="10%"></asp:Label></td>
                    <td><asp:TextBox ID="txtProductName" Width="95%" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvProductName" Text="*" runat="server" ErrorMessage="Enter Product Name." ControlToValidate="txtProductName" Display="Dynamic" SetFocusOnError="True" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblAddProduct_SubCategory" Text="Sub-Category:" runat="server"></asp:Label></td>
                    <td><asp:DropDownList ID="ddlAddProduct_SubCategory" Width="95%" runat="server"></asp:DropDownList></td>
                    
                </tr>
                <tr>
                    <td><asp:Label ID="lblPrice" Text="Price:" runat="server"></asp:Label></td>
                    <td><asp:TextBox ID="txtPrice" Width="95%" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPrice" Text="*" runat="server" ErrorMessage="Enter Price." ControlToValidate="txtPrice" Display="Dynamic" SetFocusOnError="True" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPrice" runat="server" Text="*" ErrorMessage="Enter 123.12 format" ValidationExpression="[0-9]{0,}[.]{0,1}[0-9]{0,2}" ControlToValidate="txtPrice" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblQuantity" Text="Quantity:" runat="server"></asp:Label></td>
                    <td><asp:TextBox ID="txtQuantity" Width="95%" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" Text="*" ErrorMessage="Enter Quantity." ControlToValidate="txtQuantity" Display="Dynamic" SetFocusOnError="True" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revQuantity" runat="server" Text="*" ErrorMessage="Only Number Allows." ValidationExpression="\d{0,}" ControlToValidate="txtQuantity" Font-Bold="True" Font-Size="Large" ForeColor="Maroon"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblFileUploadImage" Text="Image:" runat="server"></asp:Label></td>
                    <td><asp:FileUpload ID="FileUpload1" Width="100%" runat="server"/></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <center>
                            <asp:Button ID="btnNext" Text="Next" Width="30%" runat="server" OnClick="btnNext_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" Text="Cancel" Width="30%" CausesValidation="false" runat="server" PostBackUrl="~/ADMIN/add.aspx" />
                        </center>
                    </td>
                </tr>
            </table>
        </td>
        <td valign="middle" style="height: 100%;">
            <center><img id="Image1" src="" alt="No Image" width="180" height="180" /></center>
        </td>
    </tr>
</table>
</div>
<div style="z-index: 100; left: 1%; top: 72%; position:absolute;">
    <table>
         <tr>
            <td>
                <asp:ValidationSummary ID="vsc" runat="server" CssClass="vc" ForeColor="Maroon" Width="193px" Height="32px" />
            </td>
        </tr>
    </table>
</div>
</asp:Content>

