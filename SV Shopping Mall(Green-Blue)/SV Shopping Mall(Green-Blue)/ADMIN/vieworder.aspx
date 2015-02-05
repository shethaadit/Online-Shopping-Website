<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="vieworder.aspx.cs" Inherits="ADMIN_vieworder"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
    <!-- #include file="ordermenu.aspx" --> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="sub">
    <tr>
        <th colspan="3" style="line-height:30px;width:70%;height:5%;font-size:medium;">Order</th>
        <th style="width:30%;" align="right">View By :-
            <asp:DropDownList ID="ddlDispatch" AutoPostBack="true" runat="server">
                <asp:ListItem Selected="true">All</asp:ListItem>
                <asp:ListItem>Dispatched</asp:ListItem>
                <asp:ListItem>Not Dispatched</asp:ListItem>							
            </asp:DropDownList>
        </th>
    </tr>
            
    <%
        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
        scon.Open();
        try
        {
            string omqry="";
            DropDownList ddlDispatch = (DropDownList)Page.Form.FindControl("cntmaincontent").FindControl("ddlDispatch");
            string od = ddlDispatch.SelectedItem.Text;
            if (od == "All")
            {
                omqry = "SELECT * from order_master order by order_no";
            }
            else if (od == "Dispatched")
            {
                omqry = "SELECT * from order_master where dispatchornot='yes' order by order_no";
            }
            else if (od == "Not Dispatched")
            {
                omqry = "SELECT * from order_master where dispatchornot='no' order by order_no";
            }
            //string omqry = "SELECT * from order_master where dispatchornot='" + od + "' order by order_no";
            SqlCommand omscmd = new SqlCommand(omqry, scon);
            SqlDataReader omsdr = omscmd.ExecuteReader();
            while (omsdr.Read())
            {
    %>
                <tr style="background-color:#CCCCCC;height:1;">
	                <td style="line-height:24px;color:Black;">Order No:-<font color="Black"><%=omsdr.GetValue(0).ToString()%></font></td>
	                <td style="color:Black;" colspan="2">User Name:-<font color="Black"><%=omsdr.GetValue(1).ToString()%></font></td>
	                <td style="color:Black;" align="right">Order Date:-<font color="Black"><%=omsdr.GetValue(2).ToString()%></font></td>
                </tr>
                <tr style="height:1;">
	                <td style="line-height:24px;width:45%;color:#2582A4;">Product name</td>
	                <td style="width:20%;color:#2582A4;">Price</td>					
	                <td style="width:10%;color:#2582A4;">Qty</td>
	                <td style="width:25%;color:#2582A4;">Amount</td>					
                </tr>
                <tr><td colspan="4"><hr size="1" color="#2aa4d2" /></td></tr>
    <%
                string odqry = "SELECT * from order_details where order_no=" + omsdr.GetValue(0).ToString();
                SqlCommand odscmd = new SqlCommand(odqry, scon);
                SqlDataReader odsdr = odscmd.ExecuteReader();
                while (odsdr.Read())
                {
                    string pqry = "SELECT * from product where product_no='" + odsdr.GetValue(1).ToString() + "'";
                    SqlCommand pscmd = new SqlCommand(pqry, scon);
                    SqlDataReader psdr = pscmd.ExecuteReader();
                    while (psdr.Read())
                    {
    %>
                        <tr style="background-color:#FFFFFF;height:1;">
                            <td align="left" style="line-height:24px;width:40%;"><%=psdr.GetValue(2).ToString()%></td>
                            <td><%=psdr.GetValue(4).ToString()%></td>					
                            <td><%=odsdr.GetValue(2).ToString()%></td>
                            <td align="center"><%=odsdr.GetValue(3).ToString()%></td>
                        </tr>
                        <tr><td colspan="4">&nbsp;</td></tr>
    <%
                    }
    %>   
                    <tr><td colspan="4"><hr size="1" color="#2aa4d2" /></td></tr>
                    <tr style="height:1;">
                        <td style="line-height:24px" align="left">Status:-
    <%
                        if (omsdr.GetValue(7).ToString() == "yes")
                        {
                            Response.Write("Dispatched");
                        }
                        else
                        {
                            Response.Write("Not Dispatched");
                        }
    %>
                        </td>
                        <td>Total</td>
                        <td align="center"><%=omsdr.GetValue(5).ToString()%></td>
                        <td align="center"><%=omsdr.GetValue(6).ToString()%></td>
                    </tr>
    <%
                }
                %>
                    <tr><td colspan="4"><hr size="2" color="#2582A4" /></td></tr> 
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
    <tr><td colspan="4">&nbsp;</td></tr>
</table>
</asp:Content>

