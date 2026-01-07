<%@ Page Title="Shop" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="Web_App_Dev_CW.shop" %>

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

    <div class="containerint">
        <p>
            Pay 0% interest for up to 24 months. Terms apply.
        </p>
    </div>

    <div class="containershop">
        <h2>Store. Gift magic this holiday.</h2>
        <div class="containershop2">
            <div class="shop-item">
                <a href="buyIphonePro.aspx">
                    <img src="image/iphonestore.png" alt="iPhone Store" />
                </a>
                <p class="desc">iPhone</p>
            </div>
            <div class="shop-item">
                <a href="buyMac.aspx">
                    <img src="image/macstore.png" alt="Mac Store" />
                </a>
                <p class="desc">Mac</p>
            </div>
            <div class="shop-item">
                <a href="buyAirpods.aspx">
                    <img src="image/airpodsstore.png" alt="AirPods Store" />
                </a>
                    <p class="desc">AirPods</p>
            </div>
        </div>

        <div class="containershop3">
            <div class="containershop4" id="productContainer" runat="server">
            </div>
        </div>

    </div>

</asp:Content>

