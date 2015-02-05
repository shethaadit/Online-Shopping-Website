<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="vieworderdispatch.aspx.cs" Inherits="ADMIN_vieworderdispatch"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
    <!-- #include file="ordermenu.aspx" --> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<div class="table" style="width: 100%; height: 100%; z-index: 100; left: 1px; top: 1px; position:absolute; border:none 0px;">
    <table width="100%" cellpadding="0" cellspacing="0" class="sub">
	    <tr><th colspan="8" class="view" style="line-height:30px; height:5;font-size:16px;">Order Dispatch</th></tr>				
	    <tr style="background-color:#CCCCCC;height:1;">
		    <td style="color:Black;">&nbsp;</td>
		    <td style="line-height:24px;color:Black;">Order No</td>
		    <td style="color:Black;">User ID</td>
		    <td style="color:Black;">Date</td>
		    <td style="color:Black;">Pament Type</td>													
		    <td style="color:Black;">Qty</td>
		    <td style="color:Black;">Amount</td>					
	    </tr>
	    <asp:PlaceHolder ID="plhod" runat="server"></asp:PlaceHolder>
	    <tr><td colspan="7"><asp:Button ID="btnDispatch" Text="Dispatch" runat="server" OnClick="btnDispatch_Click"/></td></tr>
    </table>
</div>
</asp:Content>

