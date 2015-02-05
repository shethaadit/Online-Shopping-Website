<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="changepassword"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
   <!-- #include file="menu.aspx" -->  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
    <div style="left:1%; top:1%;  position: absolute;">    
    <asp:ChangePassword ID="ChangePasswordAdmin" runat="server" 
    Width="350px" Height="250px" BorderStyle="solid" BorderColor="#2aa4d2" BorderWidth="1" 
    CancelDestinationPageUrl="~/ADMIN/home.aspx"
    OnChangingPassword="ChangePasswordAdmin_ChangingPassword" 
    ChangePasswordFailureText="Password incorrect or New Password invalid.">
    <TitleTextStyle CssClass="login_title" />
    <ValidatorTextStyle ForeColor="Maroon" Font-Size="11px" />
    <FailureTextStyle Font-Size="10pt" ForeColor="Maroon" HorizontalAlign="Justify" />
    <CancelButtonStyle Width="70%" />
    <ChangePasswordButtonStyle Width="60%" />
    </asp:ChangePassword>
</div>

</asp:Content>

