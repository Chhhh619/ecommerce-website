<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="macDetail.aspx.cs" Inherits="Web_App_Dev_CW.macDetail" %>

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

    <div class="containerint">
        <p>
            Pay 0% interest for up to 24 months. Terms apply.
        </p>
    </div>

    <div class="layer1">
        <div class="layer2">
            <div class="layerleft">
                <div class="productTitle">
                    <h1>Mac</h1>
                </div>
            </div>
            <div class="layerright">
                <div class="productDesc">
                    <p>If you can dream it.</p>
                    <p>Mac can do it.</p>
                </div>
            </div>
        </div>

        <div class="videoContainer">
            <video id="bgVideo" autoplay muted loop>
                <source src="video/macvid.mp4" type="video/mp4">
            </video>
        </div>

        <div class="layer3">
            <div class="expandDetail">
                <img src="image/mac1.jpg" />
            </div>
            <div class="expandDetail">
                <img src="image/macDetail3.jpeg" />
            </div>
            <div class="expandDetail">
                <img src="image/macDetail1.jpeg" />
            </div>
        </div>

        <div class="overlay1">
            <div class="productName">
                <h1 style="font-size: 60px;">Get to know Mac.</h1>
            </div>
            <div class="productOverlay1">
                <div class="productDetail">
                    <h2>
                        <span class="highlight1">Supercharged by Pineapple silicon.</span> Pineapple silicon brings game-changing power and speed to Mac. It integrates the CPU, GPU and Neural Engine onto a single power-efficient chip,
                    accelerating everything you do. And it makes it possible for the incredible AI performance on Mac to boost your creativity and productivity.
                    </h2>
                    <img src="image/macDetail4.png" />
                </div>
                <div class="productDetail">
                    <h2>
                        <span class="highlight1">Seize the day on a single charge.</span>Thanks to the efficiency of Pineapple silicon, Mac laptops deliver up to 24 hours of battery life with incredible performance whether you’re plugged in or not.
                    </h2>
                    <img src="image/macDetail5.png" />
                </div>
                <div class="productDetail">
                    <h2>
                        <span class="highlight1">Work smart. And fast.</span>  From designing a stunning presentation to making an epic spreadsheet, Mac lets you get more done faster — whether you’re running to class or running a business.
                    </h2>
                    <img src="image/macDetail6.png" />
                </div>
                <div class="productDetail">
                    <h2>
                        <span class="highlight1">Create at the speed of your imagination.</span> From recording a podcast to editing your first feature film, you can do, make and create in all-new ways with the speed and power of the ultra-capable Mac.
                    </h2>
                    <img src="image/macDetail7.png" />
                </div>
            </div>
        </div>
    </div>

    <div class="layer4">
        <div class="layerleft">
            <div class="productTitle">
                <h1>Explore the line-up.</h1>
            </div>
        </div>
        <div class="productDetail4" id="productContainer" runat="server">
        </div>

    </div>


</asp:Content>
