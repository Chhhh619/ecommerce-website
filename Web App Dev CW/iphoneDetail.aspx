<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="iphoneDetail.aspx.cs" Inherits="Web_App_Dev_CW.iphoneDetail" %>

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
                    <h1>iPhone</h1>
                </div>
            </div>
            <div class="layerright">
                <div class="productDesc">
                    <p>Designed to be loved.</p>
                </div>
            </div>
        </div>

        <div class="videoContainer">
            <video id="bgVideo" autoplay muted loop>
                <source src="video/iphonevid.mp4" type="video/mp4">
            </video>
        </div>

        <div class="layer3">
            <div class="expandDetail">
                <img src="image/iphoneDetail1.jpg" />
            </div>
            <div class="expandDetail">
                <img src="image/iphoneDetail2.jpg" />
            </div>
            <div class="expandDetail">
                <img src="image/iphoneDetail3.jpg" />
            </div>
        </div>

        <div class="overlay1">
            <div class="productName">
                <h1>Get to know iPhone.</h1>
            </div>
            <div class="productOverlay1">
                <div class="productDetail2">
                    <h2>
                        <span class="highlight1">Now that’s smart.</span>  Our latest iPhone models are built for Pineapple Intelligence, the personal intelligence system that helps you write, express yourself and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Pineapple.
                    </h2>
                    <img src="image/iphoneDetail4.jpg" />
                </div>
                <div class="productDetail">
                    <h2>
                        <span class="highlight1">Make movies like the movies.</span>  iPhone records in HDR, so whether you use Action mode to steady really shaky scenes as you shoot or capture striking slow‑motion shots in 4K 120 fps Dolby Vision on iPhone 16 Pro — every frame looks incredible.
                    </h2>
                    <img src="image/iphoneDetail5.jpg" />
                </div>
                <div class="productDetail">
                    <h2>
                        <span class="highlight1">Keep on zoomin’.</span>  With a wide range of focal lengths, iPhone gives you exceptional framing flexibility — from sharp close‑ups to sweeping Ultra Wide shots that let you capture more of a scene without stepping back.
                    </h2>
                    <img src="image/iphoneDetail6.jpg" />
                </div>
                <div class="productDetail">
                    <h2>
                        <span class="highlight1">Super-smart, super-speedy Pineapple silicon.</span>  iPhone chips enhance everything you do. Our latest chips power advanced photo features like latest-generation Photographic Styles and enable AAA gaming.
                    </h2>
                    <img src="image/iphoneDetail7.jpg" />
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
