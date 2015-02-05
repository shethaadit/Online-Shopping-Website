<%@ Page Language="C#" MasterPageFile="~/ADMIN/LoginMasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<table align="center" width="30%" style="height: 35%; z-index: 100; left: 347px;top: 161px; position: absolute;" border="0" cellpadding="0" cellspacing="0">
    <tr style="height:100%;">
        <td style="height:100%;width:100%;">
            <asp:Login ID="LoginAdmin" TitleText="Log In" TitleTextStyle-CssClass="login_title"
            Width="280px" Height="200px" BorderPadding="0" BorderWidth="1" BorderStyle="solid" BorderColor="#2aa4d2"
            DisplayRememberMe="false"
            FailureText="Either User Name or Password is Incorrect. please try again." 
            runat="server" OnAuthenticate="LoginAdmin_Authenticate">
            <LoginButtonStyle Width="30%" />
            <TitleTextStyle CssClass="login_title" />
            <LabelStyle ForeColor="#87A019" />
            <ValidatorTextStyle ForeColor="Maroon" Font-Size="11px" />
            <FailureTextStyle Font-Size="10pt" ForeColor="Maroon" HorizontalAlign="Justify" />
            </asp:Login>
        </td>
    </tr>
    <tr><td><a href="home.aspx">Home</a></td></tr>
</table>       
</asp:Content>

