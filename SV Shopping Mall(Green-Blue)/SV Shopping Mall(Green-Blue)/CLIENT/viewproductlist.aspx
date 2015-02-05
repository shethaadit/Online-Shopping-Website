<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster.master" AutoEventWireup="true" CodeFile="viewproductlist.aspx.cs" Inherits="CLIENT_viewproductlist"  %>
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

<table cellpadding="0" cellspacing="0" border="0" class="main" style="width:100%; height:100%; border-top:solid 2px #2aa4d2">
    <tr><td class="leftside" valign="top">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="height:100%;">
            <tr style="width:100%;">
                <td style="width:100%; height:10%;" valign="top">
                    <user:HomeSubCategoryList ID="homesubcategorylist1" runat="server" />
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td valign="top" style="width:100%;">    
                   <user:HomeCategoryList ID="homecategorylist1" runat="server" />
            </td></tr>
        </table>
    </td>
    <td style="border-bottom:solid 2px #2aa4d2;" valign="top">
        <table width="100%" style="height:100%;" cellpadding="0" cellspacing="0">
            <%
                SqlConnection scon=new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
                scon.Open();
                try
                {
                    string catqry = "SELECT category_name from category where category_no='" + Request.QueryString["category"].ToString() + "'";
                    SqlCommand scmdcat=new SqlCommand(catqry,scon);
                    string catnm=scmdcat.ExecuteScalar().ToString();
                    
                    string scatqry="SELECT subcategory_name from subcategory where subcategory_no='" + Request.QueryString["subcategory"].ToString() + "'";
                    SqlCommand scmdscat = new SqlCommand(scatqry, scon);
                    string scatnm = scmdscat.ExecuteScalar().ToString();

                    Response.Write("<tr><td colspan='3' valign='top' style='line-height: 20px; height:25;border-bottom: solid 2px #2aa4d2;'><a href='home.aspx' style='font-size:small;color:#87A019'>Home</font></a>--><a href='viewcategorydetails.aspx?category=" + Request.QueryString["category"].ToString() + "'><font size='2' color='#87A019'>" + catnm + "</font></a> --> <font size='2' color='#2582A4'>" + scatnm + "</font></td></tr>");
                    Response.Write("<tr><td>&nbsp;</td></tr>");
                    Response.Write("");
                    
                    string pqry = "SELECT product_no,product_name,product_price,product_imagepath from product where product_subcategory_no='" + Request.QueryString["subcategory"].ToString() + "'";
                    SqlCommand scmdp=new SqlCommand(pqry,scon);
                    SqlDataReader sdrp=scmdp.ExecuteReader();

                    int i = 0;
                    
                    while (sdrp.Read())
                    {
                        if (i % 3 == 0)
                        {
                            Response.Write("</tr><tr><td align='center' style='boder-bottom: solid 1px #2aa4d2;width:33%'>");
							 Response.Write("<table width='100%' align='center'>");
							 Response.Write("<tr><td align='center'><a href='viewproductdetails.aspx?category=" + Request.QueryString["category"].ToString() + "&subcategory=" + Request.QueryString["subcategory"].ToString() + "&productno=" + sdrp.GetValue(0).ToString() + "'><img src='" + Server.MapPath("~/pimages/") + sdrp.GetValue(3).ToString() + "' width='100' height='100'></a></td></tr>");
                             Response.Write("<tr><td align='center'style='color:#2582A4;' class='hp'>" + sdrp.GetValue(1).ToString() + "</td></tr>");
                             Response.Write("<tr><td align='center' class='hp'>Rs.(INR) " + sdrp.GetValue(2).ToString() + "</td></tr>");
							 Response.Write("<tr><td align='center'><a href='viewproductdetails.aspx?category="+ Request.QueryString["category"].ToString() +"&subcategory="+ Request.QueryString["subcategory"].ToString() +"&productno=" + sdrp.GetValue(0).ToString() +"'><img src='../App_Themes/CLIENT/background_images/b_purchase.gif' alt='No Image' /></a></td></tr>");
							 Response.Write("</table></td>");
                        }
                        else
                        {
                             Response.Write("<td align='center' width='33%'>");
							 Response.Write("<table align='center'>");
                             Response.Write("<tr><td align='center'><a href='viewproductdetails.aspx?category=" + Request.QueryString["category"].ToString() + "&subcategory=" + Request.QueryString["subcategory"].ToString() + "&productno=" + sdrp.GetValue(0).ToString() + "'><img src='" + Server.MapPath("~/pimages/") + sdrp.GetValue(3).ToString() + "' width='100' height='100'></a></td></tr>");
                             Response.Write("<tr><td align='center'style='color:#2582A4;' class='hp' >" + sdrp.GetValue(1).ToString() + "</td></tr>");
                             Response.Write("<tr><td align='center' class='hp'>Rs.(INR) " + sdrp.GetValue(2).ToString() + "</td></tr>");
                             Response.Write("<tr><td align='center'><a href='viewproductdetails.aspx?category=" + Request.QueryString["category"].ToString() + "&subcategory=" + Request.QueryString["subcategory"].ToString() + "&productno=" + sdrp.GetValue(0).ToString() + "'><img src='../App_Themes/CLIENT/background_images/b_purchase.gif' alt='No Image' /></a></td></tr>");
							 Response.Write("</table></td>");	
                        }
                        i++;
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
        <%--<asp:PlaceHolder ID="plhviewproducts" runat="server"></asp:PlaceHolder>--%>
    </td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>

</asp:Content>

