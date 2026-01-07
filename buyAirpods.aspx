<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="buyAirpods.aspx.cs" Inherits="Web_App_Dev_CW.buyIphone" %>

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
                    <h1>Buy Airpods Pro 2</h1>
                </div>
            </div>

            <div class="wrap">
                <div class="menu1">
                    <span id="left">&lt;</span>
                    <div class="carousel">
                        <a href="#">
                            <img src="image/airpodspro5.jpg" alt="img">
                            <img src="image/airpodspro1.jpeg" alt="img">
                            <img src="image/airpodspro2.jpeg" alt="img">
                            <img src="image/airpodspro3.jpeg" alt="img">
                            <img src="image/airpodspro4.jpeg" alt="img">
                            <img src="image/airpodspro6.jpg" alt="img">
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
                    <option value="airpodspro">Airpods Pro</option>
                    <option value="airpods4">Airpods 4</option>
                </select>

                <div class="shopContainer2p">
                    <h2 style="color: black;">For you.&nbsp</h2>
                    <h2 style="color: gray;">Add engravings.</h2>
                </div>


                <label class="optionstext" for="color">Engraving:</label>
                <select id="engraving" name="engraving">
                    <option value="yes">Add Engraving</option>
                    <option value="no">No Engraving</option>
                </select>

                <div class="shopContainer2p">
                    <h2 style="color: black;">Silence.&nbsp</h2>
                    <h2 style="color: gray;">Decide if you need noise cancellation. </h2>
                </div>


                <label class="optionstext" for="storage">Noise Cancellation:</label>
                <select id="nc" name="nc">
                    <option value="nonc">No Noice Cancellation</option>
                    <option value="withnc">With Active Noice Cancellation</option>
                </select>

                <button class="addtocart" type="button">Add to Cart</button>
            </div>
        </div>
    </div>

    <script src="scripts/carousel.js"></script>


</asp:Content>
