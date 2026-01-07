<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="buyIphone.aspx.cs" Inherits="Web_App_Dev_CW.buyIphone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/apple.css" />
    <link rel="stylesheet" href="css/purchase.css" />
    <link rel="stylesheet" href="css/menu.css" />

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
                        <asp:Image ID="ImageIphone1" runat="server" ImageUrl="image/iphone16_6.1_blue.png" />
                        <asp:Image ID="ImageIphone2" runat="server" ImageUrl="image/iphone16_6.1_pink.png" />
                        <asp:Image ID="ImageIphone3" runat="server" ImageUrl="image/iphone16_6.1_teal.png" />
                        <asp:Image ID="ImageIphone4" runat="server" ImageUrl="image/iphone16_6.1_white.png" />
                        <asp:Image ID="ImageIphone5" runat="server" ImageUrl="image/iphone16_6.1_black.png" />
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
                <asp:DropDownList ID="ddlModel" runat="server" OnSelectedIndexChanged="ddlModel_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Name" CssClass="ddlSelector">
                </asp:DropDownList>
                <asp:SqlDataSource
                    ID="SqlDataSource1"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                    SelectCommand="SELECT Distinct Name FROM Product WHERE ProductNumericID BETWEEN 29 AND 58" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>

                <div class="shopContainer2p">
                    <h2 style="color: black;">Finish.&nbsp</h2>
                    <h2 style="color: gray;">Pick your favourite.</h2>
                </div>

                <label class="optionstext" for="color">Color:</label>
                <asp:DropDownList ID="ddlColor" runat="server" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="ColourName" CssClass="ddlSelector">
                    <asp:ListItem Text="Ultramarine" Value="blue" />
                    <asp:ListItem Text="Pink" Value="pink" />
                    <asp:ListItem Text="Teal" Value="teal" />
                    <asp:ListItem Text="White" Value="white" />
                    <asp:ListItem Text="Black" Value="black" />
                </asp:DropDownList>
                <asp:SqlDataSource
                    ID="SqlDataSource2"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                    SelectCommand="SELECT ColourName FROM Colour WHERE ColourNumericID BETWEEN 5 AND 7 OR ColourNumericID IN (9, 13)" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>

                <div class="shopContainer2p">
                    <h2 style="color: black;">Storage.&nbsp</h2>
                    <h2 style="color: gray;">How much space do you need?</h2>
                </div>

                <label class="optionstext" for="storage">Storage:</label>
                <asp:DropDownList ID="ddlStorage" runat="server" OnSelectedIndexChanged="ddlStorage_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="CapacityStorage" CssClass="ddlSelector">
                </asp:DropDownList>
                <asp:SqlDataSource
                    ID="SqlDataSource3"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                    SelectCommand="SELECT CapacityStorage FROM Capacity where CapacityNumericID between 1 and 3" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>

                <div class="shopContainer2p">
                    <label for="quantity">Quantity:</label>
                </div>
                <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="quantitySelector"></asp:TextBox>

                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="AddToCart_Click" CssClass="addToCartButton" />
            </div>
        </div>
    </div>

    <script src="scripts/carousel.js"></script>
</asp:Content>
