<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="viewsubcategory.aspx.cs" Inherits="viewsubcategory"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
  <!-- #include file="viewmenu.aspx" -->  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<div class="table" style="width: 100%; height: 100%; z-index: 100; left: 1px; top: 1px; position:absolute; border:none 0px;">
    <div class="header">Sub Category</div>
    <div class="detail">
        <asp:DataGrid ID="dgSubCategory" CellSpacing="1" CssClass="dg" AutoGenerateColumns="False" runat="server"
        AllowPaging="True" OnPageIndexChanged="dgSubCategory_PageIndexChanged">
            <Columns>
                <asp:BoundColumn HeaderText="No" DataField="subcategory_no">
                    <ItemStyle CssClass="is" />
                    <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Name" DataField="subcategory_name" >
                    <HeaderStyle ForeColor="black" />
                     <ItemStyle CssClass="is" />
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Category" DataField="category_name" >
                    <HeaderStyle ForeColor="black" />
                     <ItemStyle CssClass="is" />
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Image" >
                    <ItemTemplate>
                        <img src='<%#Server.MapPath("~/simages/")+ DataBinder.Eval(Container.DataItem,"subcategory_imagepath") %>' class="view" alt="No Image" />
                    </ItemTemplate>
                    <HeaderStyle ForeColor="black" />
                     <ItemStyle CssClass="is" />
                </asp:TemplateColumn>    
                <asp:TemplateColumn HeaderText="Action" >
                    <ItemTemplate>
                        <a href='editsubcategory.aspx?table=subcategory&no=<%#DataBinder.Eval(Container.DataItem,"subcategory_no") %>' class="img">
                            <img id="Img1" src="../App_Themes/ADMIN/images/b_edit.png" class="link" alt="No Image" runat="server" />
                        </a>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <a href='delete.aspx?table=subcategory&no=<%#DataBinder.Eval(Container.DataItem,"subcategory_no") %>' class="img">
                            <img id="Img2" src="../App_Themes/ADMIN/images/b_drop.png" class="link" alt="No Image" runat="server" />
                         </a>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="black" />
                    <ItemStyle CssClass="is" />
                </asp:TemplateColumn>   
            </Columns>
            <HeaderStyle BorderColor="#333333" BackColor="#CCCCCC" ForeColor="black" />
            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
            <PagerStyle Mode="NumericPages" ForeColor="#2582A4" BorderStyle="none" Position="TopAndBottom" />
        </asp:DataGrid>        
    </div>
</div>
</asp:Content>

