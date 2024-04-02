<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="Shophoa.Xemhoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    Chọn danh mục loại<asp:DropDownList ID="ddloai" runat="server" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai" AutoPostBack="True"></asp:DropDownList>

     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsHoa"> 
        <ItemTemplate>
            <div class="col-md-4">
                <a href="#">
                    <img src="Hinh_San_Pham/<%# Eval("Hinh") %>" style="width:100px" />
                </a>

                <%# Eval("TenHoa") %> <br />
                Giá bán :  <%# Eval("gia","{0:#,##0} Đồng") %> <br />
            </div>
        </ItemTemplate>
     </asp:Repeater>

    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddloai" DefaultValue="1"
                Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    




</asp:Content>
