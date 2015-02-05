<%@ Control Language="C#" AutoEventWireup="true" CodeFile="header.ascx.cs" Inherits="CLIENT_UserControl_header" %>
<table cellpadding="0" cellspacing="0" class="main">
    <tr>
        <td>
            <img src="../App_Themes/CLIENT/background_images/header3.jpg" align="left" alt="No Image" />
        </td>
        <td>
			<table width="100%">
			    <asp:PlaceHolder ID="plhsignout" Visible="false" runat="server">
			        <tr>
					    <td><img alt="Sign In" src="../App_Themes/CLIENT/background_images/Signin-new.gif" /></td>
					    <td align="left"><a href="signout.aspx">Sign Out</a></td>
				    </tr>
			    </asp:PlaceHolder>
			    
				<tr>
					<td align="left"><img id="Img5" src="../../App_Themes/CLIENT/background_images/cart1.gif" alt="view Shopping Cart" runat="server" /></td>
					<td align="left"><a href="viewshoppingcartandlist.aspx">Shopping Cart</a></td>
				</tr>
				<tr>
					<td align="left"><img id="Img6" src="../../App_Themes/CLIENT/background_images/ShoppingList.gif" alt="View Shopping List" runat="server" /></td>
					<td align="left"><a href="viewshoppingcartandlist.aspx#s1">Shopping List</a></td>
				</tr>
			</table>
		</td>
    </tr>
</table>