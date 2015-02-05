<%@ Control Language="C#" AutoEventWireup="true" CodeFile="homecategorylist.ascx.cs" Inherits="CLIENT_UserControl_homecategorylist" %>
<table width="100%">
	<tr><td colspan="2" style="height: 21px;width:100%;">&nbsp;</td></tr>
</table>

<table width="100%" cellpadding="2" cellspacing="0">
	<tr><th>Category</th></tr>
</table>

<table cellspacing="0" cellpadding="0" class="main">
	<tr><td style="width:100%">
		<table width="100%" cellpadding="0" cellspacing="5" style="height:100%">
		<%
		    SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["sconstring"].ConnectionString);
            scon.Open();
            try
            {
                string cqry = "SELECT * from category";
                SqlCommand scmd = new SqlCommand(cqry, scon);
                SqlDataReader sdr = scmd.ExecuteReader();
                while (sdr.Read())
                {
                    Response.Write("<tr>");
                    Response.Write("<td width='15%'height='25%' align='right'><img src='../App_Themes/CLIENT/background_images/ico.gif'></td>");
                    Response.Write("<td height='25%'><a href='viewcategorydetails.aspx?category=" + sdr.GetValue(0).ToString() + "' style='font-size:13px;'>" + sdr.GetValue(1).ToString() + "</a></td>");
                    Response.Write("</tr>");
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