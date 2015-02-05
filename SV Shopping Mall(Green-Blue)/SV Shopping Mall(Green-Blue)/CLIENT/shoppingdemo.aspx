<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="shoppingdemo.aspx.cs" Inherits="CLIENT_shoppingdemo"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" runat="Server">
    <user:Header ID="header1" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" runat="Server">

<table width="90%" align="center" class="sub">
    <tr><td>
        <a href="home.aspx" style="font-size:medium;">HOME</a> 
        <b style="font-size:medium"> > </b>
        <b style="font-size:15px;color:#2582A4">Shopping Demo</b>
    </td></tr>
</table>
<br />
<table width="90%" align="center" cellpadding="0" cellspacing="0" class="sub">
    <tr><td valign="top" align="center" style="line-height: 20px">
        <table style="border-collapse: collapse" cellpadding="2" cellspacing="2" width="95%">
            <tr>
                <td align="center" style="height:65;line-height:50px;font-size:large; color:#DD0000;"><b>Shopping Demo</b></td>
                <td style="width:5%;"><img src="../App_Themes/CLIENT/background_images/image3.jpg" alt="No Image" width="50" height="50" /></td>
            </tr>
            <tr><td colspan="2" align="left" style="height:42;line-height:18px">
                <table cellspacing="0" cellpadding="0" width="95%" align="center">
                    <tr><td colspan="3">&nbsp;</td></tr>
                    <tr><td colspan="3" valign="bottom">
                        <table cellspacing="0" cellpadding="0" width="100%" align="center">
                            <tr>
                                <td style="width:20%;">&nbsp;&nbsp;Just 3 Simple Steps &gt;&gt;</td>
                                <td style="width:8%;"><a href="shoppingdemo.aspx#">Step 1</a> &gt;</td>
                                <td style="width:8%;"><a href="shoppingdemo.aspx#step2">Step 2</a> &gt;</td>
                                <td style="width:50%;"><a href="shoppingdemo.aspx#step3">Step 3</a></td>
                            </tr>
                        </table>
                    </td></tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr><td>
                        <table cellspacing="0" cellpadding="0" width="99%" align="center" class="main">
                            <tr><td valign="top" align="center" style="width:100%;">
                                <table cellspacing="0" cellpadding="0" width="100%" class="sub">
                                    <tr><td>&nbsp;</td></tr>
                                    <tr><td valign="top" align="left"><b>Step 1:&nbsp;Search</b></td></tr>
                                    <tr><td valign="top" align="left">&nbsp;</td></tr>
                                    <tr><td valign="top" align="left">
                                        There are 2 ways by which you can locate products on our site.
                                        <p>
                                            <strong>1. Keyword Search</strong><br>
                                            There is a <strong>Search Box</strong> in the header (left hand top corner)</p>
                                        <ul>
                                            <li>Enter the product/item that you want to locate for in the <strong>Search Box</strong>
                                                (Eg: If you want to buy flowers, you can type Flowers in the Search Box). You can
                                                also search for products within a category.</li>
                                            <li>Then Click on the <strong>Go</strong> Button. The next page will display the Search
                                                Results with suitable Products for you to choose from. </li>
                                        </ul>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <img height="100" src="../App_Themes/CLIENT/background_images/search.JPG" width="200" alt="No Image" />
                                        <img height="300" src="../App_Themes/CLIENT/background_images/product.JPG" width="450" alt="No Image" />
                                        <p>
                                        <strong>2. Category/Sub-Category Search</strong>
                                        <br />
                                        Products at <a href="http://www.SVShopping.com/">SVShopping.com</a> are
                                        divided in Categories and Sub-Categories with further sub-division, displayed in
                                        the category list at left. You can browse through each of these Category until you
                                        find your desired product type.</p>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <img height="279" src="../App_Themes/CLIENT/background_images/categorylist.JPG" width="500" alt="No Image" />
                                   </td></tr>
                                   <tr><td>&nbsp;</td></tr>
                                   <tr><td valign="middle" align="left" ><a href="shoppingdemo.aspx#">Back to top</a></td></tr>
                                </table>
                            </td></tr>
                        </table>
                     </td></tr>
                    <tr><td><a id="step2" name="step2"></a>&nbsp;</td></tr>
                    <tr><td>
                        <table cellspacing="0" cellpadding="0" width="99%" align="center" class="main">
                            <tr><td valign="top" align="center" style="width:100%;">
                                <table cellspacing="0" cellpadding="0" width="100%" class="sub">
                                    <tr><td>&nbsp;</td></tr>
                                    <tr><td valign="top" align="left"><b>Step 2:&nbsp;Register</b></td></tr>
                                    <tr><td>&nbsp;</td></tr>
                                    <tr><td valign="top" align="left">
                                        Registering on SVShopping.com.
                                        <p>
                                            You must be a registered user of <a href="http://www.SVShopping.com/">SVShopping.com</a>
                                            to be able to BUY online. SVShopping <strong>Registration process</strong> is fast,
                                            easy and totally <strong>FREE!</strong>.
                                        </p>
                                        <p>
                                            Click on the <strong>Sign in </strong>here link on the top right corner in the header
                                            part of every Page.
                                        </p>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="400" src="../App_Themes/CLIENT/background_images/signin.jpg" width="450" alt="No Image" />
                                        <p>
                                            Please follow the steps to <strong>Register</strong> with <a href="http://www.SVShopping.com/"
                                               >SVShopping.com</a></p>
                                        <ol>
                                            <li>Enter your <strong>Email address</strong> which will also function as your User
                                                Name for <a href="http://www.SVShopping.com/">SVShopping.com</a></li>
                                         
                                            <li>Enter your <strong>Password</strong> and confirm the same by <strong>re-entering</strong>
                                                it.</li>
                                            
                                            <li>Enter your <strong>Date of Birth</strong></li>
                                            
                                            <li>Enter your <strong>Telephone No.</strong></li>
                                            
                                            <li>Enter your <strong>Mobile No.</strong></li>
                                             
                                            <li>Finally <strong>click</strong> on the <strong>Register</strong> button </li>
                                        </ol>
                                    </td></tr>
                                    <tr><td style="padding-top: 20px" valign="top" align="left" ><a href="shoppingdemo.aspx#">Back to top</a></td></tr>
                                </table>
                             </td></tr>
                        </table>
                    </td></tr>
                    <tr><td><a id="step3" name="step3"></a>&nbsp;</td></tr>
                    <tr><td>
                        <table cellspacing="0" cellpadding="0" width="99%" align="center" class="main">
                            <tr><td valign="top" align="center" width="100%">
                                <table cellspacing="0" cellpadding="0" width="100%" class="sub">
                                    <tr><td>&nbsp;</td></tr>
                                    <tr><td valign="top" align="left"><b>Step 3:&nbsp;Buy</b></td></tr>
                                    <tr><td>&nbsp;</td></tr>
                                    <tr><td valign="top" align="left">
                                        Buying on SVShopping.com
                                        <p>
                                            Once you Click on the proceed to the <strong>Checkout</strong> Button on the <strong>
                                                Shopping Cart</strong> page, you will be taken to the <strong>Shipment Details</strong>
                                            page where your <strong>Shipping Address</strong> will be Pre-populated from your
                                            <strong>Registration Address</strong>, which can be edited, if necessary.
                                        </p>
                                        <p>
                                            Once you have entered the appropriate <strong>Shipping Address</strong> you can
                                            choose to pay for the selected Product/s using a variety of options. They are:</p>
                                        <strong>
                                        <ol style="font-size: 10px; color: #000000">
                                            <li>Credit Card(Master/VISA)</li>
                                            <li>Cheque/DD - Payable at Delhi/New Delhi></li>
                                            <li>Cheque/Draft Pickup</li>
                                            <li>Cheque/Draft Pickup </li>
                                        </ol>
                                        </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img height="400" src="../App_Themes/CLIENT/background_images/payment.JPG" width="700"  alt="No Image" />
                                    </td></tr>
                                    <tr><td valign="middle" align="left">&nbsp;</td></tr>
                                    <tr><td valign="middle" align="left" ><a href="shoppingdemo.aspx#">Back to top</a></td></tr>
                                </table>
                            </td></tr>
                         </table>
                    </td></tr>
                </table>
            </td></tr>
        </table>
    </td></tr>
    <tr><td>&nbsp;</td></tr>
</table>
<table>
    <tr><td>&nbsp;</td></tr>
</table>
</asp:Content>
