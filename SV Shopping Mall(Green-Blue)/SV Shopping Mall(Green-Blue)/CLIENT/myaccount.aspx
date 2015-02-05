<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="myaccount.aspx.cs" Inherits="CLIENT_myaccount"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
  <user:Header ID="header1" runat="server" /> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%;">
    <tr><td valign="top" style="height:100%;">
        <table width="90%" align="center" class="sub">
            <tr>
                <td>
	                <a href="home.aspx" style="font-size:medium;">HOME</a>
	                <b style="font-size:medium"> > </b>
	                <b style="font-size:15px;color:#2582A4">My Account</b>
	            </td>
            </tr>
        </table>
        <br />
        <table width="90%" style="height:55%;" border="0" cellpadding="0" cellspacing="0" align="center" class="sub">
            <tr><td valign="bottom">
	            <table width="95%" align="center" class="main"><tr><td valign="bottom" style="color:#DD0000; font-size:medium;"><b>Hi <%= Session["firstname"].ToString()%></b></td></tr></table><br />
            </td></tr>
            <tr><td valign="top" style="height:100%;">
	            <table width="95%" style="height:100%;"  border="0" cellpadding="0" cellspacing="2" align="center" class="sub">
		            <tr>
			            <th style="height:25px;" colspan="2" align="left">Personal Information</th>
			            <th style="width:50%;height:25px;" colspan="2" align="left">View Your Order</th>
		            </tr>
		            <tr>
			            <td colspan="2" style="height:100%;">
				            <table width="100%" style="height:100%;border: solid 1px #2aa4d2; color:#2582A4;" cellpadding="0" cellspacing="1" border="1">
					            <tr>
						            <td><a href="viewmyprofile.aspx" class="simple">View My Profile </a> </td>
						            <td >
						                Check your account details in this section which has your Personal information &amp; Contact details.
						            </td>
					            </tr>
					            <tr>
						            <td><a href="editmyprofile.aspx" class="simple">Edit My Profile </a> </td>
						            <td >
						                Edit your Personal information & Contact details in this section such as your First Name, Last Name, Address and other information. 
						            </td>
					            </tr>
					            <tr>
						            <td><a href="myaddressbook.aspx" class="simple">My Address Book</a> </td>
						            <td >
						                View your Billing & Shipping Address used during your previous transactions on SVShopping.com.You have the option to Add/Edit/Delete the addresses stored in your account.
						            </td>
					            </tr>						
				            </table>				
			            </td>
			            <td style="height:100%" valign="top">
				            <table width="100%" style="height:100%;border: solid 1px #2aa4d2; color:#2582A4;" cellpadding="0" cellspacing="1" border="1">
					            <tr>
						            <td><a href="viewshoppingcartandlist.aspx" class="simple">My Shopping Cart</a> </td>
						            <td >
							           View your items which you Buy Now in the Shopping Cart and items saved for your future purchase in the Shopping List.
						            </td>
					            </tr>
					            <tr>
						            <td align="left"><a href="viewshoppingcartandlist.aspx#s1" class="simple">My Shopping List</a> </td>
						            <td  align="left" valign="middle">
							            View your items which you have saved to buy later.
						            </td>
					            </tr>
					            <tr>
						            <td align="left"><a href="changepassword.aspx" class="simple">Change Password</a> </td>
						            <td align="left" valign="middle" >
						                Change the existing password for your Account.
						            </td>
					            </tr>						
				            </table>
			            </td>
                    </tr>			
	            </table>	
            </td></tr>
            <tr><td>&nbsp;</td></tr>
        </table><br /><br />
    </td></tr>
</table>

</asp:Content>

