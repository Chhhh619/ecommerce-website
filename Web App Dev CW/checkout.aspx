<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Web_App_Dev_CW.checkout" %>

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

    <link rel="stylesheet" href="css/checkout.css" />

    <div class="checkout1">
        <h2>Kindly fill in your details.</h2>

        <div class="checkout2">
            <h2>Your Information</h2>

            <div class="input_box">
                <asp:Label ID="firstNameLabel" runat="server" Text="First Name:" CssClass="checkoutlabel"></asp:Label>
                <asp:TextBox ID="firstNameTextBox" runat="server" placeholder="First Name" CssClass="checkoutinput"></asp:TextBox>
            </div>

            <div class="input_box">
                <asp:Label ID="lastNameLabel" runat="server" Text="Last Name:" CssClass="checkoutlabel"></asp:Label>
                <asp:TextBox ID="lastNameTextBox" runat="server" placeholder="Last Name" CssClass="checkoutinput"></asp:TextBox>
            </div>

            <div class="input_box">
                <asp:Label ID="phoneNumberLabel" runat="server" Text="Phone Number:" CssClass="checkoutlabel"></asp:Label>
                <asp:TextBox ID="phoneNumberTextBox" runat="server" placeholder="Phone Number" CssClass="checkoutinput"></asp:TextBox>
            </div>

            <div class="input_box">
                <asp:Label ID="emailLabel" runat="server" Text="Email:" CssClass="checkoutlabel"></asp:Label>
                <asp:TextBox ID="emailTextBox" runat="server" placeholder="Email" CssClass="checkoutinput"></asp:TextBox>
            </div>

            <h2>Shipping Address</h2>
            <div class="input_box">
                <asp:Label ID="addressLabel" runat="server" Text="Shipping Address:" CssClass="checkoutlabel"></asp:Label>
                <asp:TextBox ID="addressTextBox" runat="server" placeholder="Shipping Address" CssClass="checkoutinput" required></asp:TextBox>
            </div>

            <div class="input_box">
                <asp:Label ID="cityLabel" runat="server" Text="City:" CssClass="checkoutlabel"></asp:Label>
                <asp:TextBox ID="cityTextBox" runat="server" placeholder="City" CssClass="checkoutinput" required></asp:TextBox>
            </div>

            <div class="input_box">
                <asp:Label ID="zipLabel" runat="server" Text="Zip Code:" CssClass="checkoutlabel"></asp:Label>
                <asp:TextBox ID="zipTextBox" runat="server" placeholder="Zip Code" CssClass="checkoutinput" required></asp:TextBox>
            </div>

            <h2>Payment Details</h2>
            <div class="input_box">
                <asp:Label ID="Label1" runat="server" Text="Payment Method:" CssClass="checkoutlabel"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="checkoutinput">
                    <asp:ListItem Text="-- Please Select --" Value="" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Credit Card" Value="Credit Card"></asp:ListItem>
                    <asp:ListItem Text="Debit Card" Value="Debit Card"></asp:ListItem>
                    <asp:ListItem Text="Touch 'n GO eWallet" Value="Touch 'n GO eWallet"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Label ID="totalPriceLbl" runat="server" Text="Total: $0.00" CssClass="checkoutprice"></asp:Label>

            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

            <asp:Button ID="CheckoutButton" runat="server" Text="Checkout" OnClick="CheckoutButton_Click" CssClass="checkoutBtn" />
            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>
        </div>

    </div>
</asp:Content>
