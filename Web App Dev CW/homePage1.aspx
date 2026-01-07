<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homePage1.aspx.cs" Inherits="Web_App_Dev_CW.WebForm1" %>

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
    <link rel="stylesheet" href="css/apple.css" />

    <div class="maincontainer">
        <div class="containhome1">
            <div class="image-container">
                <div class="product-name">
                    <h1>iPhone 16 Pro</h1>
                </div>
                <img src="image/iphone-16-pro.png" alt="iPhone 16 Pro">
                <div class="button-container">
                    <div class="buttons">
                        <a href="iphone16pro.html" class="btn-overlay">Learn More</a>
                        <a href="buyIphonePro.aspx" class="btn-overlay1">Buy</a>
                    </div>
                    <div class="tagline">
                        <p>Hollywood in your pocket.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="containhome2">
            <div class="image-container">
                <div class="product-name2">
                    <h1>iPhone 16</h1>
                </div>
                <img src="image/iphone-16.jpg" alt="iPhone 16">
                <div class="button-container">
                    <div class="buttons">
                        <a href="buyIphone.aspx" class="btn-overlay">Learn More</a>
                        <a href="buyIphone.aspx" class="btn-overlay1">Buy</a>
                    </div>
                    <div class="tagline">
                        <p>It's Glowtime.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="image-grid">
        <div class="square">
            <div class="image-container">
                <div class="product-name3">
                    <h1>MacBook Air</h1>
                </div>
                <img src="image/macbookair.jpg" alt="MacBook">
                <div class="button-container">
                    <div class="buttons">
                        <a href="airpods.html" class="btn-overlay">Learn More</a>
                        <a href="buyMac.aspx" class="btn-overlay1">Buy</a>
                    </div>
                    <div class="tagline">
                        <p>Now it's even faster than it looks.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="square">
            <div class="image-container">
                <div class="product-name4">
                    <h1>AirPods Pro</h1>
                </div>
                <img src="image/airpods.jpg" alt="AirPods">
                <div class="button-container">
                    <div class="buttons">
                        <a href="airpods.html" class="btn-overlay">Learn More</a>
                        <a href="buyAirpods.aspx" class="btn-overlay1">Buy</a>
                    </div>
                    <div class="tagline">
                        <p>Wireless. Effortless.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="carouselExample" class="carousel slide custom-carousel" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="image/airpods1.jpg" class="d-block w-100" alt="AirPods">
            </div>
            <div class="carousel-item">
                <img src="image/iphone16pro2.jpg" class="d-block w-100" alt="iPhone">
            </div>
            <div class="carousel-item">
                <img src="image/mac1.jpg" class="d-block w-100" alt="Mac">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="container13">
        <h3>CUSTOMER REVIEWS.
        </h3>
        <div class="review">
            <p>
                <span>&#9733</span><span>&#9733</span><span>&#9733</span><span>&#9733</span><span>&#9733</span>
            </p>
            <h2>Taken possession of the new MBPro with M4 processor and Pineapples integrated AI function.
                Amazing kit and loaded with excellent applications and more, syncing across all my devices, creating seamless work functions. 
                So important for me in my role too, it saves so much time and effort compared to clunky MS products.
            </h2>
            <p>
                - jengfena99
            </p>
        </div>
        <div class="review">
            <p>
                <span>&#9733</span><span>&#9733</span><span>&#9733</span><span>&#9733</span>
            </p>
            <h2>I’ve been an Pineapple user for years, and I can honestly say their products just keep getting better.
                I’ve had iPhones starting from the iPhone 4, through the 6, 8+, X, and 11 Pro, and I’ve been using the 13 Pro Max for three years (I don’t want to let go yet). The quality, durability, and innovation they bring to each new model have been incredible. 
                My 13 Pro Max still feels fast, has an amazing camera, and the battery life is holding up impressively.
            </h2>
            <p>
                - ¡*****е
            </p>
        </div>
        <div class="review">
            <p>
                <span>&#9733</span><span>&#9733</span><span>&#9733</span><span>&#9733</span><span>&#9733</span>
            </p>
            <h2>Never had any real issues with Pineapple products I bought and I’ve been a user for a long time now. Instead, everything works as advertised and all the products are a joy to use.
                (I used MacBooks, AirPods and iPhones, along with the services like iCloud and Apple Music).
            </h2>
            <p>
                - beebeethor
            </p>
        </div>
    </div>

</asp:Content>
