<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="viewbill.aspx.cs" Inherits="ADMIN_viewbill"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
    <!-- #include file="menu.aspx" --> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<table border="0" width="100%" cellpadding="0" cellspacing="0" class="sub">
	<tr><th colspan="4" style="line-height:30px;height:5%;font-size:medium;">Bill</th></tr>				
	<%
    SqlConnection scon=new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
    scon.Open();
    try
    {
        string bqry = "SELECT * from bill order by bill_no";
        SqlCommand bscmd = new SqlCommand(bqry, scon);
        SqlDataReader bsdr = bscmd.ExecuteReader();
        while (bsdr.Read())
        {      
	%>
	        <tr style="background-color:#CCCCCC;height:1;" align="left">
		        <td style="line-height:24px;width:15%;color:black;">Bill No:-<font color="black"><%=bsdr.GetValue(0).ToString()%></font></td>
		        <td style="width:25%;color:black;">Bill Date:-<font color="black"><%=bsdr.GetValue(1).ToString()%></font></td>
		        <%
                    string unmqry = "SELECT * from order_master where order_no='" + bsdr.GetValue(2).ToString() + "'";
                    SqlDataAdapter unmsda = new SqlDataAdapter(unmqry, scon);
                    DataTable unmdt = new DataTable();
                    unmsda.Fill(unmdt);
		        %>
		        <td style="width:15%;color:black;">User Name:-<font color="black"><%=unmdt.Rows[0][1].ToString()%></font></td>
		        <td style="width:15%;color:black;text-align:right;">Order No:-<font color="black"><%=bsdr.GetValue(2).ToString()%></font></td>
	        </tr>
	        <tr style="height:1;">
		        <td colspan="4" style="border-bottom: solid 1px #2aa4d2">
			        <table border="0" width="100%" cellpadding="0" cellspacing="0" class="main">
				        <tr style="background-color:#FFFFFF;text-align:center; height:24px;">
					        <td style="width:30%;line-height:24px;color:#2582A4;">Product Name</td>
					        <td style="width:10%;text-align:center;color:#2582A4;">Qty</td>
					        <td style="width:10%;text-align:right;color:#2582A4;">Price</td>
					        <td style="width:10%;text-align:right;color:#2582A4;">Total</td>
				        </tr>
				        <tr><td colspan="4"><hr size="1" color="#2aa4d2" /></td></tr>
                        <%
                            string odqry = "SELECT * from order_details where order_no='" + bsdr.GetValue(2).ToString() + "'";
                            SqlCommand odscmd = new SqlCommand(odqry, scon);
                            SqlDataReader odsdr = odscmd.ExecuteReader();
                            int total = 0;
                            while (odsdr.Read())
                            {
                                total = total + Convert.ToInt32(odsdr.GetValue(3));
                                string pqry = "SELECT * from product where product_no='" + odsdr.GetValue(1).ToString() + "'";
                                SqlDataAdapter psda = new SqlDataAdapter(pqry, scon);
                                DataTable pdt = new DataTable();
                                psda.Fill(pdt);
                        %>
	                    <tr>
		                    <td style="line-height:20px;text-align:left;"><%=pdt.Rows[0][2].ToString()%></td>
		                    <td style="text-align:center;"><%=odsdr.GetValue(2).ToString()%></td>
		                    <td style="text-align:right;"><%=pdt.Rows[0][4].ToString()%></td>
		                    <td style="text-align:right;"><%=odsdr.GetValue(3).ToString()%></td>
	                    </tr>
		                <%
                            }
	                    %>
		                <tr>
				            <td colspan="2" style="line-height:20px;border-top: solid 1px #2aa4d2">&nbsp;</td>
				            <td colspan="2" style="border-top: solid 1px #2aa4d2; text-align:right;">Total Amount:-&nbsp;<%=total%></td>
			            </tr>
				    </table>
			    </td>
		    </tr>
		    <tr><td>&nbsp;</td></tr>
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
</asp:Content>

