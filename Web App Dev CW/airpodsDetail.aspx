<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="airpodsDetail.aspx.cs" Inherits="Web_App_Dev_CW.airpodsDetail" %>

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
                    <h1>AirPods</h1>
                </div>
            </div>
            <div class="layerright">
                <div class="productDesc">
                    <p>Next evolution of sound and comfort.</p>
                </div>
            </div>
        </div>

        <div class="videoContainer">
            <video id="bgVideo" autoplay muted loop>
                <source src="video/airpodsvid.mp4" type="video/mp4">
            </video>
        </div>

        <div class="layer3">
            <div class="expandDetail">
                <img src="image/airpodsDetail1.jpg" />
            </div>
            <div class="expandDetail">
                <img src="image/airpodsDetail2.jpg" />
            </div>
            <div class="expandDetail">
                <img src="image/airpodsDetail3.jpg" />
            </div>
        </div>

        <div class="overlay1">
            <div class="productName">
                <h1 style="font-size: 60px;">Get to know AirPods.</h1>
            </div>
            <div class="productOverlay1">
                <div class="productDetail2">
                    <h2>
                        <span class="highlight1">Enjoy every note, beat and vibe.</span> The entirely new acoustic architecture uses an Pineapple-designed low-distortion driver powered by a custom high dynamic range amplifier. Put simply, you hear music in exceptional detail, with deeper bass and crystal‑clear highs.
                    </h2>
                    <img src="image/airpodsDetail4.jpg" />
                </div>
                <div class="productDetail3">
                    <img src="image/airpodsDetail5.jpg" />
                    <h2>
                        <span class="highlight1">Super-clear call quality.</span> <br />Using advanced computational audio, Voice Isolation minimises background noise while clarifying the sound of your voice. So you’ll be easier to understand when you’re speaking in loud or windy conditions.
                    </h2>
                </div>
                <div class="productDetail2">
                    <h2>
                        <span class="highlight1">Calibrates music to your ears.</span> Adaptive EQ automatically tunes music to your ears. Inward-facing microphones detect what you’re hearing, then adjust low‑ and mid‑range frequencies to deliver rich detail in every song.
                    </h2>
                    <img src="image/airpodsDetail6.jpg"" />
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
