<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster.master" AutoEventWireup="true" CodeFile="viewproductdetails.aspx.cs" Inherits="CLIENT_viewproductdetails"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
   <user:Header ID="header1" runat="server" /> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmenubar" Runat="Server">
<table class="main" cellpadding="0" cellspacing="0">
    <tr>
        <td class="menubar">  
           <user:MenuBar ID="menubar1" runat="server" />   
        </td>
    </tr>
</table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<table cellpadding="0" cellspacing="0" border="0" class="main" style="width:100%; height:100%; border-top:solid 2px #2aa4d2;">
    <tr>
        <td class="leftside" valign="top">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="height:100%;">
            <tr style="width:100%;">
                <td style="width:100%; height:40%;" valign="top">
                    <login:HomeLogin ID="homelogin1" runat="server" />
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td valign="top">    
                   <user:HomeCategoryList ID="homecategorylist1" runat="server" />
            </td></tr>
        </table>
        </td>
        <td valign="top">
            <table width="100%" cellpadding="0" cellspacing="0"  style="border-right: solid 2px #2aa4d2">
                <tr><td style="width:100%;height:95%;">
                    <table width="100%" style="height:100%;" cellpadding="0" cellspacing="0">
                        <%
                            SqlConnection scon=new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
                            scon.Open();
                            try
                            {
                                string cqry = "SELECT category_name from category where category_no='" + Request.QueryString["category"].ToString() + "'";
                                SqlCommand scmdc = new SqlCommand(cqry, scon);
                                string catnm = scmdc.ExecuteScalar().ToString();

                                string sqry = "SELECT subcategory_name from subcategory where subcategory_no='" + Request.QueryString["subcategory"].ToString() + "'";
                                SqlCommand scmds = new SqlCommand(sqry, scon);
                                string scatnm = scmds.ExecuteScalar().ToString();

                                string pqry = "SELECT product_no,product_name,product_price,product_imagepath from product where product_no='" + Request.QueryString["productno"].ToString() + "'";
                                SqlCommand scmdp = new SqlCommand(pqry, scon);
                                SqlDataReader sdrp = scmdp.ExecuteReader();

                                while (sdrp.Read())
                                {
                        %>
                                   <tr><td colspan="3" valign="top" style="height:25;line-height: 20px;border-bottom: solid 2px #2aa4d2;"><a href="home.aspx" style="font-size:small;color:#87A019;">Home</a>--><a href="viewcategorydetails.aspx?category=<%=Request.QueryString["category"].ToString() %>" style="font-size:small;color:#87A019"><%=catnm %></a>--><a href="viewproductlist.aspx?category=<%=Request.QueryString["category"].ToString() %>&subcategory=<%= Request.QueryString["subcategory"].ToString() %>" style="font-size:small;color:#87A019"><%=scatnm %></a>--><font size='2' color='#2582A4'>"<%=sdrp.GetValue(1).ToString() %></font></td></tr>
                                   <tr><td colspan="3">&nbsp;</td></tr>
                                   <tr><td colspan="3">&nbsp;</td></tr>
                                   <tr><td colspan="3">&nbsp;</td></tr>
                                   <tr><td rowspan="7" style="width:40%" align="center"><img src="<%= Server.MapPath("~/pimages/") + sdrp.GetValue(3).ToString() %>" alt="No Iamge" width="250" height="250" /></td>
                                   <td colspan="2" class="hp" style='font-size:large;color:#2582A4'><%= sdrp.GetValue(1).ToString() %></td></tr>
                                   <tr><td colspan="2">&nbsp;</td></tr>
                                   <tr>
                                        <td class="hp" style="height:15;font-size:small;color:#000000">Product Code: </td>
                                        <td class="hp" style="color:#000000"><%= sdrp.GetValue(0).ToString() %></td>
                                   </tr>
                                   <tr>
                                        <td class="hp" style="height:15;font-size:2;color:#FF0000">Price:(INR) </td>
                                        <td class="hp" style="height:15;font-size:small;color:#FF0000"><%= sdrp.GetValue(2).ToString() %></td>
                                    </tr>
                                   <tr><td colspan="2">&nbsp;</td></tr>
                                   <tr><td colspan="2">&nbsp;</td></tr>
                                   <tr>
                                        <td align="left"><a href="addtoshoppingcart.aspx?productno=<%= sdrp.GetValue(0).ToString() %>" style="font-size:small;color:#660000"><img src="../App_Themes/CLIENT/background_images/addtocart.gif" alt="No Image" /></a></td>
							            <td align="left"><a href="addtoshoppinglist.aspx?productno=<%= sdrp.GetValue(0).ToString() %>" style="font-size:small;color:#660000"><img src="../App_Themes/CLIENT/background_images/addtolist.jpg" alt="No Image" /></a></td>
							       </tr>
                        <%
                                }
                            }
                            catch
                            {
                            }
                            finally
                            {
                                scon.Close();
                            }
                        %>
                    </table>
                </td></tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
				    <td style="height:15%" align="right">
					    <table width="60%"  style="height:25%; color:#2582A4;" cellpadding="0" cellspacing="0" border="0">
						    <tr>
							    <td colspan="2" align="left" style="font-size:small; color:#87A019"><b>Free Home Delivery across 1600+ Cities in India</b></td>
						    </tr>
						    <tr><td colspan="2">&nbsp;</td></tr>
						    <tr>
							    <td colspan="2" align="left"><b>Shipment Time:</b> 7-10 Working Days</td>
						    </tr>
						    <tr><td colspan="2">&nbsp;</td></tr>
						    <tr><td colspan="2" style="line-height: 25px" align="left"><b>Payment options :</b></td></tr>
						    <tr><td>&nbsp;</td></tr>
						    <tr>
							    <td class="pd"><ul><li>Cheque</li></ul></td>
							    <td class="pd"><ul><li>Cheque/DD pickup</li></ul></td>
						    </tr>
						    <tr>
							    <td class="pd"><ul><li>Credit Card (Visa/Master)</li></ul></td>
							    <td class="pd"><ul><li>3 EMI of ICICI Bank Credit Card</li></ul></td>
						    </tr>
						    <tr>
							    <td class="pd"><ul><li>6 EMI of ICICI Bank Credit Card</li></ul></td>
							    <td class="pd"><ul><li>American Express Credit Card</li></ul></td>
						    </tr>
						    <tr>
							    <td class="pd"><ul><li>Internet Banking</li></ul></td>
						    </tr>
					    </table>
				    </td>
			    </tr>
			    <tr><td>
				    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:15%;">
					    <tr><td colspan="2" style="border-bottom: solid 2px #2aa4d2;">&nbsp;</td></tr>
					    <tr>
						    <td style="border-bottom: solid 2px #2aa4d2">&nbsp;</td>
						    <td class="hp" colspan="2" style="border-bottom: solid 2px #2aa4d2;font-size:medium; color:#87A019">Product Details</td>
					    </tr>
					    <tr><td>&nbsp;</td><td colspan="2">&nbsp;</td></tr>
					    <tr><td>&nbsp;</td><td colspan="2" class="hp" style="color:#2582A4">Features:</td></tr>
					    <tr><td>&nbsp;</td></tr>
					    <%
                            scon.Open();
                            try
                            {
                                string f = "SELECT * from product_features where product_no='" + Request.QueryString["productno"].ToString() + "'";
                                SqlCommand scmdf = new SqlCommand(f, scon);
                                SqlDataReader sdrf = scmdf.ExecuteReader();
                                while (sdrf.Read())
                                {
                        %>
                                    <tr><td height="15">&nbsp;</td>
                                    <td><ul><li><%= sdrf.GetValue(1).ToString() %></li></ul></td></tr>
                        <%
                                }
                            }
                            catch
                            {
                            }
                            finally
                            {
                                scon.Close();
                            }			    			    
					    %>
					    <tr><td colspan="2" style="border-bottom: solid 2px #2aa4d2;width:100%;">&nbsp;</td></tr>
                    </table>
			    </td></tr>
		    </table>
        </td>
    </tr>
   <tr><td colspan="2" >&nbsp;</td></tr>
    <tr><td colspan="2" >&nbsp;</td></tr>		
    <tr><td colspan="2" >&nbsp;</td></tr>
</table>

</asp:Content>

