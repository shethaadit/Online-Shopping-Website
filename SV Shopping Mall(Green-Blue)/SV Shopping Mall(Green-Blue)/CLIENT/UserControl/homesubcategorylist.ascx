<%@ Control Language="C#" AutoEventWireup="true" CodeFile="homesubcategorylist.ascx.cs" Inherits="CLIENT_UserControl_homesubcategorylist" %>

<table cellpadding="0" cellspacing="0" style="height:10;" class="main">
	<tr><td valign="top">
		<table width="100%" cellpadding="0" cellspacing="0" style="height:100%;" class="main">
		    <tr><th colspan="2" style="line-height: 25px">Category Details</th></tr>
		<%
		    SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            scon.Open();
            try
            {
                string cqry = "SELECT * from category where category_no='" + Request.QueryString["category"].ToString() + "'";
                SqlCommand scmdc=new SqlCommand(cqry,scon);
                SqlDataReader sdrc = scmdc.ExecuteReader();
                while(sdrc.Read())
                {
                    Response.Write("<tr style='background-color:#dededa'><td colspan='2' valign='top' style='line-height:20px;color:#CC6600'font-size:2'><b>" + sdrc.GetValue(1).ToString() + "</b></td></tr>");
                   
                }
                Response.Write("<tr><td>&nbsp;</td></tr>");

                string sqry = "SELECT * from subcategory where category_no='" + Request.QueryString["category"].ToString() + "'";
                SqlCommand scmds = new SqlCommand(sqry, scon);
                SqlDataReader sdrs = scmds.ExecuteReader();
                while (sdrs.Read())
                {
                    Response.Write("<tr><td style='width:10%;' align='center' valign='middle'><img src='../App_Themes/CLIENT/background_images/green_dot.gif'></td><td>");
                    Response.Write("<a href='viewproductlist.aspx?category=" + Request.QueryString["category"].ToString() + "&subcategory=" + sdrs.GetValue(0).ToString() + "' border='0' style='font-size:13px;'>" + sdrs.GetValue(1).ToString() + "</a></td></tr>");
                   
                    Response.Write("<tr><td>&nbsp;</td></tr>");
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
