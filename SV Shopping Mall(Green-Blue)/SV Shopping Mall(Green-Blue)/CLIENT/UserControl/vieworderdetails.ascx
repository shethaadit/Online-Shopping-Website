<%@ Control Language="C#" AutoEventWireup="true" CodeFile="vieworderdetails.ascx.cs" Inherits="CLIENT_UserControl_vieworderdetails" %>

<table width="100%" cellpadding="0" cellspacing="0" class="main">
	<tr>
		<th colspan="7" style="line-height: 25px"> Order Details </th>
	</tr>
	<tr style="background-color:#CCCCCC">
		<td style="width:3%;" class="vsab">&nbsp;</td>
		<td style="width:7%;" class="vsab">Sr. No</td>
		<td style="width:30%;" class="vsab">Product Details</td>
		<td style="width:15%;" class="vsab" align='right'>Unit Price(INR)</td>
		<td style="width:20%;" class="vsab" align='right'>Quantity&nbsp;&nbsp;
		    <a href="viewshoppingcartandlist.aspx" style="color:#DD0000; font-size:small; text-decoration:underline;">Update</a>
		</td>
		<td style="width:20%;" class="vsab" align='right'>Total Price(INR)</td>
		<td style="width:5%;" class="vsab">&nbsp;</td>
	</tr>
	<tr><td colspan="7">&nbsp;</td></tr>
	<%
	    SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);  
	    
	    ArrayList productno = new ArrayList();
        productno = (ArrayList)Session["productno"];
	
	    ArrayList productqty = new ArrayList();
        productqty = (ArrayList)Session["productqty"];

        int sr = 1;
        double amt = 0, totalamt =0;
		Session["totalamt"]=0;
		for(int i=0;i<productno.Count;i++)
		{
			if(Session["productno"]!=null)
			{
                scon.Open();
                try
                {
                    string plqry="SELECT * from product where product_no='" + productno[i].ToString() + "'";
                    SqlCommand scmd=new SqlCommand(plqry,scon);
				    SqlDataReader sdr=scmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        double price = Convert.ToDouble(sdr.GetValue(4).ToString());
                        int qty = Convert.ToInt32(productqty[i].ToString());
                        amt = price * qty;
                        //amt = int.Parse(sdr.GetValue(4).ToString()) * int.Parse(productqty[i].ToString());
                        totalamt=totalamt+ amt;
                      
                        Response.Write("<tr>");
                        Response.Write("<td>&nbsp;</td>");
                        Response.Write("<td>" + sr + "</td>");
                        Response.Write("<td style='border-bottom: 1 solid #2aa4d2'>" + sdr.GetValue(2).ToString() + "</td>");
                        Response.Write("<td style='border-bottom: 1 solid #2aa4d2' align='right'>" + sdr.GetValue(4).ToString() + "</td>");
                        Response.Write("<td style='border-bottom: 1 solid #2aa4d2' align='right'>" + productqty[i].ToString() + "</td>");
                        Response.Write("<td style='border-bottom: 1 solid #2aa4d2' align='right'>" + amt + "</td>");
                        Response.Write("<td>&nbsp;</td>");
                        Response.Write("</tr><tr><td colspan='6'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>");
                        sr++;
                    }
                    Session["totalamt"] = totalamt;
                }
                catch
                {
                }
                finally
                {
                    scon.Close();
                }
                
			}
		}
		Response.Write("<tr><td colspan='7'><hr color='#CCCCCC' /></td></tr><tr><td colspan='3'>&nbsp;</td>");
		Response.Write("<td align='right'>Total</td><td align='right'>" + Session["producttotalqty"].ToString() + "</td><td align='right'>" + Session["totalamt"].ToString()+ "</td></tr>");
	%>
</table>