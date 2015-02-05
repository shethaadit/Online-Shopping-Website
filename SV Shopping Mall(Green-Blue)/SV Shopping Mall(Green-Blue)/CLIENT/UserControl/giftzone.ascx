<%@ Control Language="C#" AutoEventWireup="true" CodeFile="giftzone.ascx.cs" Inherits="CLIENT_User_Control_giftzone" %>

 <table width="100%" cellpadding="0" cellspacing="0" align="right">
	<tr><td>
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-right: solid 2px #2aa4d2;border-left: solid 2px #2aa4d2">
			<tr><td style="border-bottom: solid 2px #2aa4d2">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr><td>&nbsp;</td></tr>
					<tr><td align="center"><a href="svpromises.aspx"><img id="Img1" src="giftzone_images/svpromises.jpg" alt="No Image" runat="server" /></a></td></tr>
					<tr><td>&nbsp;</td></tr>
					<tr><td style="color:#FF0000;">&nbsp;&nbsp;&nbsp;&nbsp;<img id="Img2" src="giftzone_images/rhombusdot-darkblue.gif" alt="No Image" runat="server" /><b>&nbsp; Free Home Delivery.</b></td></tr>
					<tr><td style="color:#FF0000;">&nbsp;&nbsp;&nbsp;&nbsp;<img id="Img3" src="giftzone_images/rhombusdot-darkblue.gif" alt="No Image" runat="server" /><b>&nbsp; Multiple Payment Options.</b></td></tr>
					<tr><td style="color:#FF0000;">&nbsp;&nbsp;&nbsp;&nbsp;<img id="Img4" src="giftzone_images/rhombusdot-darkblue.gif" alt="No Image" runat="server" /><b>&nbsp; Delivery in 1600+ cities.</b></td></tr>										
				</table>
			</td></tr>	
		</table>
		<table><tr><td>&nbsp;</td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0" style="border:solid 2px #FFCCCC;">
			<tr><td>
				<table width="100%" cellspacing="0" cellpadding="0">
					<tr><td style="border-top: solid 2px #FFCCCC"><img id="Img5" src="giftzone_images/giftzone-header.gif" alt="No Image" runat="server" /></td></tr>
				</table>
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr><td style="font-size:smaller;">You don't need a special occasion just to show someone you care. Express it with flowers.<b>Same Day Delivery</b></td></tr>
					<%
					    SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
                        scon.Open();
                        try
                        {
                            string cqry = "select * from category where category_name='Flowers'";
                            SqlCommand scmdc = new SqlCommand(cqry, scon);
                            string cno = scmdc.ExecuteScalar().ToString();

                            string sqry = "select * from subcategory where category_no='" + cno + "'";
                            SqlCommand scmds = new SqlCommand(sqry, scon);
                            string sno = scmds.ExecuteScalar().ToString();

                            string pqry = "select * from product where product_subcategory_no='" + sno + "'";
                            SqlCommand scmdp = new SqlCommand(pqry, scon);
                            SqlDataReader sdr = scmdp.ExecuteReader();
                            int i = 0;
                            while (sdr.Read())
                            {
                                if (i < 2)
                                {
                                    Response.Write("<tr><td align='center'><a href='viewproductdetails.aspx?category=" + cno + "&subcategory=" + sno + "&productno=" + sdr.GetValue(1).ToString() + "'><img src='" + Server.MapPath("~/pimages/") + sdr.GetValue(6).ToString() + "' width='100px' height='100px' runat='server' /></a></td></tr>");
                                     Response.Write("<tr><td style='color:#999900;font-size:small;'><b>" + sdr.GetValue(2).ToString() + "</b></td></tr>");
                                     Response.Write("<tr><td><b> Price(INR):" + sdr.GetValue(4).ToString() + "</b></td></tr>");
                                     Response.Write("<tr><td><a href='viewproductdetails.aspx?category=" + cno + "&subcategory=" + sno + "&productno=" + sdr.GetValue(1).ToString() + "' style='color:#6600FF;font-size:small;'><b>Buy Now</b></a></td></tr>");
                                     Response.Write("<tr><td>&nbsp;</td></tr>");
                                     i++;
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
				</table>			
			</td></tr>
		</table>
	</td></tr>
</table>