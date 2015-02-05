<%@ Page Language="C#" MasterPageFile="~/CLIENT/clientmaster2.master" AutoEventWireup="true" CodeFile="viewreviewandconfirm.aspx.cs" Inherits="CLIENT_viewreviewandconfirm"  %>
<%@ Reference Control="~/CLIENT/UserControl/americanexpressdetails.ascx"%>
<%@ Reference Control="~/CLIENT/UserControl/visamasterdetails.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntheader" Runat="Server">
   <user:Header ID="header1" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">

<table width="92%" align="center" class="sub">
	<tr><td>
		<a href="home.aspx" style="font-size:medium;">HOME</a>
		<b style="font-size:medium"> > </b>
		<a href="viewshoppingcartandlist.aspx"  style="font-size:medium">Shopping Cart</a>
		<b style="font-size:medium"> > </b>
		<b style="font-size:15px;color:#2582A4">Payment Option</b>
	</td></tr>
</table>
<br /><br />

<table width="92%" cellpadding="1" cellspacing="1" align="center" class="sub">
	<tr><td valign="top">
        <table width="95%" align="center" class="main"><tr><td valign="bottom" style="color:#DD0000; font-size:medium;"><b>Hi <%= Session["firstname"].ToString()%></b></td></tr></table><br />
	</td></tr>
	<tr><td>	
		<%
		    SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            SqlDataReader shlsdr;
		    scon.Open();
		    try
            {
                string shlqry="SELECT * from shipping_address where user_id='" + Session["user"].ToString()+ "' and id=" + Session["shippingid"].ToString();
                SqlCommand shlscmd=new SqlCommand(shlqry,scon);
                shlsdr=shlscmd.ExecuteReader();
                while (shlsdr.Read())
                {
		%>
				<table width="95%" align="center" style="line-height:20px" cellspacing="1" cellpadding="1" class="sub">
					<tr>
						<th colspan="2" style="line-height:25px;font-size:medium;width:100%;">Review & Confirm</th>
					</tr>
					<tr style="background-color:#CCCCCC;color:#996600;"><td colspan="3">Review the information below, then click " Place your Order "</td></tr>

					<tr><td style="width:70%" valign="top">
						<table width="100%">
							<tr>
								<td class="vsab" style="width:5%;"><b>Sr. No.</b></td>
								<td class="vsab" style="width:20%;"><b>Product</b></td>
								<td class="vsab" style="width:12%;"><b>Shipping Address</b></td>
								<td class="vsab" style="width:5%;" align="right"><b>Quantity</b></td>
								<td class="vsab" style="width:5%;" align="right"><b>Price(INR)</b></td>
							</tr>
							<tr><td colspan="5"><hr size="2" style="color:#2aa4d2;" /></td></tr>
							<%
                                int sr = 1;
                                if (Session["productno"] != null)
                                {
                                    ArrayList productno = new ArrayList();
                                    productno = (ArrayList)Session["productno"];

                                    ArrayList productqty = new ArrayList();
                                    productqty = (ArrayList)Session["productqty"];

                                    for (int i = 0; i < productno.Count; i++)
                                    {
                                        string pqry = "SELECT * from product where product_no='" + productno[i].ToString() + "'";
                                        SqlCommand pscmd = new SqlCommand(pqry, scon);
                                        SqlDataReader psdr = pscmd.ExecuteReader();
                                        while (psdr.Read())
                                        {
                            %>
                                            <tr valign="top">
										        <td><b><%=sr%></b></td>
								                <td><%=psdr.GetValue(2).ToString()%></td>
								                <td><%=shlsdr.GetValue(9).ToString()%></td>
								                <td align="center"><%=productqty[i].ToString()%></td>
								                <td align="right"><%=psdr.GetValue(4).ToString()%></td>
										    </tr>
                            <%
                                            sr++;
                                        }
                                    }
						    %>
							        <tr><td colspan="5"><hr color="#CCCCCC" /></td></tr>
									<tr>
										<td colspan="3" align="right"><b>Total :&nbsp;&nbsp;</b></td>
										<td align="center"><%=Session["producttotalqty"].ToString()%></td>
										<td align="right"><%=Session["totalamt"].ToString()%></td>
									</tr>
									<tr><td colspan="5"><hr color="#CCCCCC" /></td></tr>
								</table>
							</td>
							<td style="width:30%" rowspan="2" valign="top">
								<table width="100%" style=" height:100%;border-left: solid 1px #2aa4d2;border-bottom: solid 1px #2aa4d2" cellspacing="0" cellpadding="0" class="sub">
									<tr><th colspan="2" style="line-height: 20px">Order Summary</th></tr>
									<tr><td colspan="2">&nbsp;</td></tr>
									<tr>
										<td style="width:55%;height:20;line-height: 20px"><b>&nbsp;&nbsp;&nbsp;Total Quantity: </b></td>
										<td valign="top" style="line-height: 20px;height:20"><%=Session["producttotalqty"].ToString()%></td>
									</tr>
									<tr>
										<td style="width:55%;height:20;line-height: 20px" valign="top"><b>&nbsp;&nbsp;&nbsp;Gross Price(INR): </b></td>
										<td valign="top" style="line-height: 20px;height:20"><%=Session["totalamt"].ToString()%></td>
									</tr>
									<tr>
										<td style="width:55%;height:20;line-height: 20px" valign="top" ><b>&nbsp;&nbsp;&nbsp;Net Payable(INR): </b></td>
										<td valign="top" style="line-height: 20px;height:20"><%=Session["totalamt"].ToString()%></td>
									</tr>
									<tr>
										<td style="width:55%;height:20;line-height: 20px" valign="top" ><b>&nbsp;&nbsp;&nbsp;Payment Method:<br />
												&nbsp;&nbsp;&nbsp;<a href="viewpaymentinfo.aspx" style="color:#DD0000; font-size:small; text-decoration:underline;">Change</a> </b></td>
										<td valign="top" style="line-height: 20px;height:20"><%=Session["paymenttype"].ToString()%></td>
									</tr>
									<tr>
										<td valign="top" style="line-height: 20px;height:20"><b>&nbsp;&nbsp;&nbsp;Billing Address:</b></td>
										<td valign="top" style="line-height: 20px;height:20">
										<%
                                        string baqry = "SELECT user_first_name,user_middle_name,user_last_name,address,city,state,pincode from users where user_id='" + Session["user"] + "'";
                                        SqlCommand bascmd = new SqlCommand(baqry, scon);
                                        SqlDataReader basdr = bascmd.ExecuteReader();
                                        while (basdr.Read())
                                        {
                                            Response.Write(basdr.GetValue(0).ToString() + " " + basdr.GetValue(1).ToString() + " " + basdr.GetValue(2).ToString() + "<br />" + basdr.GetValue(3).ToString() + "<br />" + basdr.GetValue(4).ToString() + "," + basdr.GetValue(5).ToString() + " - " + basdr.GetValue(6).ToString());
                                        }
                                    }
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
									</td>
									</tr>
								</table>
							</td>
						</tr>
					<tr>
						<td style="height:30">
							<asp:PlaceHolder ID="plhrc" runat="server"></asp:PlaceHolder>
						</td>
					</tr>
					<tr><td colspan="2"><hr color="#CCCCCC" /></td></tr>
					<tr>
						<td align="center" colspan="4"><asp:Button ID="btnPlaceOrder" Text="Place your Order" runat="server" OnClick="btnPlaceOrder_Click" /></td>
					</tr>
					<tr><td colspan="2">&nbsp;</td></tr>
				</table>	
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
</table>
<br /><br />
</asp:Content>

