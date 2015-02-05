<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="viewproduct.aspx.cs" Inherits="viewproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
  <!-- #include file="viewmenu.aspx" -->  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<div class="table" style="width: 100%; height: 100%; z-index: 100; left: 1px; top: 1px; position:absolute; border:none 0px;">
    <div class="header">Product</div>
    <div class="detail">
        <asp:DataGrid ID="dgProduct" DataKeyField="product_no" CellSpacing="1" CssClass="dg" 
        AutoGenerateColumns="false" AllowPaging="true" runat="server" 
        PagerStyle-HorizontalAlign="Center" 
        OnPageIndexChanged="dgProduct_PageIndexChanged" PageSize="20"
        >
            <Columns>
                <asp:BoundColumn HeaderText="No" DataField="product_no">
                     <ItemStyle CssClass="is" />
                     <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Name" DataField="product_name">
                    <ItemStyle CssClass="is" />
                    <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Sub Category" DataField="subcategory_name">
                    <ItemStyle CssClass="is" />
                    <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Price" DataField="product_price">
                    <ItemStyle CssClass="is" />
                    <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Qty" DataField="product_stock_qty">
                    <ItemStyle CssClass="is" />
                    <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Features" DataField="product_feature">
                    <HeaderStyle ForeColor="black" />
                    <ItemStyle CssClass="is" />
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Image">
                    <ItemTemplate>
                        <img src='<%# Server.MapPath("~/pimages/")+DataBinder.Eval(Container.DataItem,"product_imagepath") %>' class="view" alt="No Image" />
                    </ItemTemplate>
                    <HeaderStyle ForeColor="black" />
                    <ItemStyle CssClass="is" />
                </asp:TemplateColumn>    
                <asp:TemplateColumn HeaderText="Action" ItemStyle-Width="10%">
                    <ItemTemplate>
                        <a href='editproduct.aspx?table=product&no=<%#DataBinder.Eval(Container.DataItem,"product_no") %>'  class="img">
                            <img id="Img1" src="../App_Themes/ADMIN/images/b_edit.png" class="link" alt="No Image" runat="server" />
                        </a>
                         &nbsp;&nbsp;&nbsp;&nbsp;
                         <a href='delete.aspx?table=product&no=<%#DataBinder.Eval(Container.DataItem,"product_no") %>' class="img">
                            <img id="Img2" src="../App_Themes/ADMIN/images/b_drop.png"  class="link" alt="No Image" runat="server" />
                         </a>
                    </ItemTemplate>
                    <ItemStyle BorderColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle ForeColor="black" />
                </asp:TemplateColumn>   
            </Columns>
            <HeaderStyle BorderColor="#333333" BackColor="#CCCCCC" ForeColor="black" />
            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
            <PagerStyle Mode="NumericPages" ForeColor="#2582A4" BorderStyle="none" Position="TopAndBottom" PageButtonCount="30" />
        </asp:DataGrid>
    </div>
</div>
</asp:Content>
