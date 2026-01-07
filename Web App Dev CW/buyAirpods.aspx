<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="buyAirpods.aspx.cs" Inherits="Web_App_Dev_CW.buyAirpods" %>

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
                    <h1>Buy Airpods</h1>
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
                            <img src="image/airpods4.2.jpg" alt="img">
                            <img src="image/airpods4.jpg" alt="img">
                        </a>
                    </div>
                    <span id="right">&gt;</span>
                </div>
            </div>
        </div>

        <div class="shopContainer2">
            <div class="shopContainer2p">
                <h2 style="color: black;">Model.&nbsp</h2>
                <h2 style="color: gray;">Which is best for you?
                </h2>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="options">
                        <label class="optionstext" for="model">Model:</label>
                        <asp:DropDownList ID="ddlModel" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Name" CssClass="ddlSelector">
                        </asp:DropDownList>
                        <asp:SqlDataSource
                            ID="SqlDataSource1"
                            runat="server"
                            ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                            SelectCommand="SELECT DISTINCT Name FROM Product WHERE ProductNumericID BETWEEN 142 AND 149"></asp:SqlDataSource>

                        <div class="shopContainer2p">
                            <h2 style="color: black;">Engraving.&nbsp</h2>
                            <h2 style="color: gray;">Made only for you.
                            </h2>
                        </div>

                        <label class="optionstext" for="engraving">Engraving:</label>
                        <asp:DropDownList ID="ddlEngrave" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="Engraving" CssClass="ddlSelector">
                        </asp:DropDownList>
                        <asp:SqlDataSource
                            ID="SqlDataSource2"
                            runat="server"
                            ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                            SelectCommand="SELECT [Engraving] FROM [Engraving]"></asp:SqlDataSource>

                        <div class="shopContainer2p">
                            <h2 style="color: black;">Noise Cancellation.</h2>
                            <h2 style="color: gray;">Experience focus like never before.
                            </h2>
                        </div>

                        <label class="optionstext" for="noisecancellation">Noise Cancellation:</label>
                        <asp:DropDownList ID="ddlNoise" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="NoiseCancellation"  CssClass="ddlSelector">
                        </asp:DropDownList>
                        <asp:SqlDataSource
                            ID="SqlDataSource3"
                            runat="server"
                            ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                            SelectCommand="SELECT [NoiseCancellation] FROM [NoiseCancellation]"></asp:SqlDataSource>

                        <div class="shopContainer2p">
                            <label for="quantity">Quantity:</label>
                        </div>

                        <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="quantitySelector"></asp:TextBox>

                        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="AddToCart_Click" CssClass="addToCartButton" />
                    </div>
                    </div>   
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script src="scripts/carousel.js"></script>
</asp:Content>
