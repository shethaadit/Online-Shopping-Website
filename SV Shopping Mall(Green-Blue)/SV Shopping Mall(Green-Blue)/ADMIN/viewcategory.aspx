<%@ Page Language="C#" MasterPageFile="~/ADMIN/adminmaster.master" AutoEventWireup="true" CodeFile="viewcategory.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cntsidear" Runat="Server">
  <!-- #include file="viewmenu.aspx" -->  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntmaincontent" Runat="Server">
<div class="table" style="width: 100%; height: 100%; z-index: 100; left: 1px; top: 1px; position:absolute; border:none 0px;">
    <div class="header">Category</div>
    <div class="detail">
        <asp:DataGrid ID="dgCategory" CellSpacing="1" CssClass="dg" AutoGenerateColumns="false" runat="server" 
        AllowPaging="True"
        OnPageIndexChanged="dgCategory_PageIndexChanged">
            <Columns>
                <asp:BoundColumn HeaderText="No" DataField="category_no"  ItemStyle-Width="10%">
                    <ItemStyle CssClass="is" />
                    <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Name" DataField="category_name" >       
                    <ItemStyle CssClass="is" />
                    <HeaderStyle ForeColor="black" />
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Action"  ItemStyle-Width="20%">
                    <ItemTemplate>
                        <a href='editcategory.aspx?table=category&no=<%#DataBinder.Eval(Container.DataItem,"category_no") %>' class="img">
                            <img id="Img1" src="../App_Themes/ADMIN/images/b_edit.png" class="link" alt="No Image" runat="server" />
                        </a>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href='delete.aspx?table=category&no=<%#DataBinder.Eval(Container.DataItem,"category_no") %>' class="img">
                           <img id="Img2" src="../App_Themes/ADMIN/images/b_drop.png" class="link" alt="No Image" runat="server" />
                        </a>
                    </ItemTemplate>
                           
                    <ItemStyle CssClass="is" />
                    <HeaderStyle ForeColor="black" />
                </asp:TemplateColumn>   
            </Columns>
            <HeaderStyle BorderColor="#2aa4d2" BackColor="#CCCCCC" ForeColor="black" />
            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
            <PagerStyle Mode="NumericPages" ForeColor="#2582A4" BorderStyle="none" Position="TopAndBottom" />
        </asp:DataGrid>
    &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp;
    </div>
</div>
</asp:Content>

