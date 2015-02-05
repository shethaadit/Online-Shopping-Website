<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="viewusers.aspx.cs" Inherits="ADMIN_viewuser"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
    <!-- #include file="viewmenu.aspx" -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<div class="table" style="width: 100%; height: 100%; z-index: 100; left: 1px; top: 1px; position:absolute; border:none 0px;">
    <div class="header">User</div>
    <div class="detail">
        <asp:DataGrid ID="dguser" CellSpacing="1" CssClass="dg" AutoGenerateColumns="False" runat="server"
        AllowPaging="True" Font-Names="Verdana" Font-Size="10px" OnPageIndexChanged="dguser_PageIndexChanged" >
            <Columns>
                <asp:TemplateColumn HeaderText="Name">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem,"user_first_name") %> 
                        <%#DataBinder.Eval(Container.DataItem,"user_middle_name") %> 
                        <%#DataBinder.Eval(Container.DataItem,"user_last_name") %>
                    </ItemTemplate>
                     <ItemStyle CssClass="is" />
                     <HeaderStyle ForeColor="black" />
                </asp:TemplateColumn>
                <asp:BoundColumn HeaderText="Birth Date" DataField="user_date_of_birth">
                     <ItemStyle CssClass="is" />
                     <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Address">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem, "address") %><br /> 
                        <%#DataBinder.Eval(Container.DataItem, "city")%><br />
                        <%#DataBinder.Eval(Container.DataItem, "state")%>(<%#DataBinder.Eval(Container.DataItem, "country")%>) <br />
                        PIN Code-<%#DataBinder.Eval(Container.DataItem, "pincode")%>   
                    </ItemTemplate>
                    <ItemStyle CssClass="is" />
                    <HeaderStyle ForeColor="black" />
                </asp:TemplateColumn>
                <asp:BoundColumn HeaderText="Phone No" DataField="user_phone_no">
                     <ItemStyle CssClass="is" />
                     <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Mobile No" DataField="user_mobile_no">
                     <ItemStyle CssClass="is" />
                     <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                 <asp:BoundColumn HeaderText="Email" DataField="user_email">
                      <ItemStyle CssClass="is" />
                      <HeaderStyle ForeColor="black" />
                 </asp:BoundColumn>
                 <asp:TemplateColumn HeaderText="Action">
                    <ItemTemplate>
                        &nbsp;&nbsp;
                         <a href='delete.aspx?table=users&no=<%#DataBinder.Eval(Container.DataItem,"user_id") %>' class="img">
                            <img id="Img2" src="../App_Themes/ADMIN/images/b_drop.png"  class="link" alt="No Image" runat="server" />
                         </a>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="black" />
                    <ItemStyle CssClass="is" />
                </asp:TemplateColumn>   
            </Columns>
            <HeaderStyle BorderColor="#2aa4d2" BackColor="#CCCCCC" ForeColor="black" />
            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
            <PagerStyle Mode="NumericPages" ForeColor="#2582A4" BorderStyle="none" Position="TopAndBottom" PageButtonCount="30" />
        </asp:DataGrid>        
    </div>
</div>
</asp:Content>

