<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="Web_App_Dev_CW.WebForm1" %>

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
                <img src="image/iphone-16-pro.png" alt="iPhone 16 Pro">
                <div class="button-container">
                    <a href="iphone16pro.html" class="btn-overlay">View iPhone 16 Pro</a>
                    <a href="iphone16pro-details.html" class="btn-overlay1">More Info</a>
                </div>
            </div>
        </div>
        <div class="containhome2">
            <div class="image-container">
                <img src="image/iphone-16.jpg" alt="iPhone 16">
                <div class="button-container">
                    <a href="iphone16.html" class="btn-overlay">View iPhone 16</a>
                    <a href="iphone16-details.html" class="btn-overlay1">More Info</a>
                </div>
            </div>
        </div>
    </div>

    <div class="image-grid">
        <div class="square">
            <div class="image-container">
                <img src="image/try.png" alt="MacBook">
                
            </div>
        </div>
        <div class="square">
            <div class="image-container">
                <img src="image/airpods.jpg" alt="AirPods">
                <div class="button-container">
                    <a href="airpods.html" class="btn-overlay">View AirPods</a>
                    <a href="airpods-details.html" class="btn-overlay1">More Info</a>
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

</asp:Content>
