<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="buyMac.aspx.cs" Inherits="Web_App_Dev_CW.buyIphone" %>

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
                    <h1>Buy MacBook Air</h1>
                </div>
            </div>

            <div class="wrap">
                <div class="menu1">
                    <span id="left">&lt;</span>
                    <div class="carousel">
                        <a href="#">
                            <img src="image/macbookair1.jpg" alt="img">
                            <img src="image/macbookair5.jpeg" alt="img">
                            <img src="image/macbookair7.jpg" alt="img">
                            <img src="image/macbookair10.jpeg" alt="img">
                            <img src="image/macbookair8.jpg" alt="img">
                            <img src="image/macbookair9.jpeg" alt="img">
                            <img src="image/macbookair11.jpg" alt="img">
                            <img src="image/macbookair12.jpeg" alt="img">
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
                    <option value="macbookair">MacBook Air</option>
                    <option value="macbookpro">MacBook Pro</option>
                </select>

                <div class="shopContainer2p">
                    <h2 style="color: black;">Finish.&nbsp</h2>
                    <h2 style="color: gray;">Pick your favourite.</h2>
                </div>


                <label class="optionstext" for="color">Color:</label>
                <select id="color" name="color">
                    <option value="midnight">Midnight</option>
                    <option value="starlight">Starlight</option>
                    <option value="spacegrey">Space Grey</option>
                    <option value="silver">Silver</option>
                </select>

                <div class="shopContainer2p">
                    <h2 style="color: black;">Memory.&nbsp</h2>
                    <h2 style="color: gray;">How much speed do you need?</h2>
                </div>


                <label class="optionstext" for="storage">Storage:</label>
                <select id="memory" name="memory">
                    <option value="16GB">16GB Unified Memory</option>
                    <option value="24GB">24GB Unified Memory</option>
                </select>

                <div class="shopContainer2p">
                    <h2 style="color: black;">Storage.&nbsp</h2>
                    <h2 style="color: gray;">How much space do you need?</h2>
                </div>


                <label class="optionstext" for="storage">Storage:</label>
                <select id="storage" name="storage">
                    <option value="256GB">256GB SSD Storage </option>
                    <option value="512GB">512GB SSD Storage</option>
                    <option value="1TB">1TB SSD Storage</option>
                    <option value="2TB">2TB SSD Storage</option>
                </select>

                <div class="shopContainer2p">
                    <h2 style="color: black;">Power Adapter.&nbsp</h2>
                    <h2 style="color: gray;">How quick do you need to charge?</h2>
                </div>


                <label class="optionstext" for="adapter">Adapter:</label>
                <select id="adapter" name="adapter">
                    <option value="30W">30W USB-C Power Adapter </option>
                    <option value="35W">35W USB-C Power Adapter</option>
                    <option value="70W">70W USB-C Power Adapter</option>
                </select>

                <button class="addtocart" type="button">Add to Cart</button>
            </div>
        </div>
    </div>

    <script src="scripts/carousel.js"></script>


</asp:Content>
