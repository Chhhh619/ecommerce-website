<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="buyIphone.aspx.cs" Inherits="Web_App_Dev_CW.buyIphone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="css/apple.css" />
    <link rel="stylesheet" href="css/purchase.css" />
    <link rel="stylesheet" href="css/menu.css">


    <div class="shopContainer">

        <div class="buyContainer1">
            <div class="productContainer">
                <div class="productNew">
                    <h3>New</h3>
                </div>
                <div class="productName">
                    <h1>Buy iPhone 16</h1>
                </div>
            </div>

            <div class="wrap">
                <div class="menu1">
                    <span id="left">&lt;</span>
                    <div class="carousel">
                        <a href="#">
                            <img src="image/iphone16_6.1_blue.png" alt="img">
                            <img src="image/iphone16_6.1_pink.png" alt="img">
                            <img src="image/iphone16_6.1_teal.png" alt="img">
                            <img src="image/iphone16_6.1_white.png" alt="img">
                            <img src="image/iphone16_6.1_black.png" alt="img">
                        </a>
                    </div>
                    <span id="right">&gt;</span>
                </div>
            </div>
        </div>
        <div class="shopContainer2">
            <div class="shopContainer2p">
                <h2 style="color: black;">Model.&nbsp</h2>
                <h2 style="color: gray;">Which is best for you?</h2>
            </div>

            <div class="options">

                <label class="optionstext" for="model">Model:</label>
                <select id="model" name="model">
                    <option value="iphone16">iPhone 16</option>
                    <option value="iphone16plus">iPhone 16 Plus</option>
                </select>

                <div class="shopContainer2p">
                    <h2 style="color: black;">Finish.&nbsp</h2>
                    <h2 style="color: gray;">Pick your favourite.</h2>
                </div>


                <label class="optionstext" for="color">Color:</label>
                <select id="color" name="color">
                    <option value="blue">Ultramarine</option>
                    <option value="pink">Pink</option>
                    <option value="teal">Teal</option>
                    <option value="white">White</option>
                    <option value="black">Black</option>
                </select>

                <div class="shopContainer2p">
                    <h2 style="color: black;">Storage.&nbsp</h2>
                    <h2 style="color: gray;">How much space do you need?</h2>
                </div>


                <label class="optionstext" for="storage">Storage:</label>
                <select id="storage" name="storage">
                    <option value="128GB">128GB</option>
                    <option value="256GB">256GB</option>
                    <option value="512GB">512GB</option>
                    <option value="1TB">1TB</option>
                </select>

                <button class="addtocart" type="button">Add to Cart</button>
            </div>
        </div>
    </div>

    <script src="scripts/carousel.js"></script>


</asp:Content>
