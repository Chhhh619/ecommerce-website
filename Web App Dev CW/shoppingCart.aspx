<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="shoppingCart.aspx.cs" Inherits="Web_App_Dev_CW.shoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--bootstrap css--%>
    <link href="bootstrap/css_/bootstrap.min.css" rel="stylesheet" />
    <%--jquery--%>
    <script src="bootstrap/js_/jquery-3.3.1.slim.min.js"></script>
    <%--popper js--%>
    <script src="bootstrap/js_/popper.min.js"></script>
    <%--bootstrap js--%>
    <script src="bootstrap/js_/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/brewislife.css">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/java.css">
    <link rel="stylesheet" href="css/review.css">
    <link rel="stylesheet" href="css/apple.css">
    <link rel="stylesheet" href="css/shop.css">
    <link rel="stylesheet" href="css/purchase.css" />
    <link rel="stylesheet" href="css/productDesc.css" />
    <link rel="stylesheet" href="css/cart.css" />

    <div class="containerint">
        <p>
            Pay 0% interest for up to 24 months. Terms apply.
        </p>
    </div>

    <div class="cartLayer1">
        <h2>Your cart total is RM<asp:Label ID="ttlMonthLbl" runat="server" Text="Label"></asp:Label>/mo.* or RM<asp:Label ID="ttlLbl" runat="server" Text="Label"></asp:Label></h2>
        <p>Get free shipping on all orders.</p>
        <asp:Button CssClass="btn btn-primary checkoutBtn" ID="checkoutBtn" runat="server" Text="Check Out" OnClick="checkoutBtn_Click1" />
    </div>

    <div class="cartLayer2">
        <h1>Your Cart</h1>
        <div class="cart">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" OnRowCommand="gvCart_RowCommand" CssClass="table table-striped table-hover cart">
                        <Columns>
                            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                            <asp:BoundField DataField="Colour" HeaderText="Colour" />
                            <asp:BoundField DataField="Capacity" HeaderText="Storage" />
                            <asp:BoundField DataField="Chipset" HeaderText="Chipset" />
                            <asp:BoundField DataField="Memory" HeaderText="Memory" />
                            <asp:BoundField DataField="PowerAdapter" HeaderText="Power Adapter" />
                            <asp:BoundField DataField="Engraving" HeaderText="Engraving" />
                            <asp:BoundField DataField="NoiseCancellation" HeaderText="Noise Cancellation" />
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Button ID="btnDecrement" runat="server" Text="-" OnClick="btnDecrement_Click" CommandName="Decrement" CommandArgument='<%# Eval("Index") %>' />
                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                    <asp:Button ID="btnIncrement" runat="server" Text="+" OnClick="btnIncrement_Click" CommandName="Increment" CommandArgument='<%# Eval("Index") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Price" HeaderText="Price (RM)" DataFormatString="{0:F2}" />
                            <asp:BoundField DataField="Total" HeaderText="Total (RM)" DataFormatString="{0:F2}" />
                            <asp:ButtonField CommandName="RemoveItem" Text="Remove" />
                        </Columns>
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
        <asp:Label ID="lblMessage" runat="server" CssClass="alert"></asp:Label>

    </div>
</asp:Content>
