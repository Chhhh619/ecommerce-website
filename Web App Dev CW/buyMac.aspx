<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="buyMac.aspx.cs" Inherits="Web_App_Dev_CW.buyMac" %>

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
                    <h1>Buy MacBook</h1>
                </div>
            </div>

            <div class="wrap">
                <div class="menu1">
                    <span id="left">&lt;</span>
                    <div class="carousel">
                        <asp:Image ID="ImageMac1" runat="server" ImageUrl="image/macbookair1.jpg" />
                        <asp:Image ID="ImageMac2" runat="server" ImageUrl="image/macbookair5.jpeg" />
                        <asp:Image ID="ImageMac3" runat="server" ImageUrl="image/macbookair7.jpg" />
                        <asp:Image ID="ImageMac4" runat="server" ImageUrl="image/macbookair10.jpeg" />
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="options">
                        <label class="optionstext" for="model">Model:</label>

                        <asp:DropDownList ID="ddlMacModel" runat="server" OnSelectedIndexChanged="ddlMacModel_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Name" AutoPostBack="true" CssClass="ddlSelector">
                            <asp:ListItem Text="MacBook Air" Value="MacBook Air" />
                            <asp:ListItem Text="MacBook Pro" Value="MacBook Pro" />
                        </asp:DropDownList>
                        <asp:SqlDataSource
                            ID="SqlDataSource1"
                            runat="server"
                            ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                            SelectCommand="SELECT Distinct Name FROM Product WHERE CategoryNumericID = 2"></asp:SqlDataSource>

                        <div class="shopContainer2p">
                            <h2 style="color: black;">Chipset.&nbsp</h2>
                            <h2 style="color: gray;">How powerful do you want your Mac to be?</h2>
                        </div>

                        <div class="options">
                            <label class="optionstext" for="model">Chipset:</label>
                            <asp:DropDownList ID="ddlMacChip" runat="server" OnSelectedIndexChanged="ddlMacChip_SelectedIndexChanged" DataSourceID="SqlDataSource6" DataTextField="Chipset" CssClass="ddlSelector">
                            </asp:DropDownList>
                            <asp:SqlDataSource
                                ID="SqlDataSource6"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                                SelectCommand="SELECT Chipset FROM Chipset"></asp:SqlDataSource>

                            <div class="shopContainer2p">
                                <h2 style="color: black;">Finish.&nbsp</h2>
                                <h2 style="color: gray;">Pick your favourite.</h2>
                            </div>
                            <label class="optionstext" for="color">Color:</label>
                            <asp:DropDownList ID="ddlMacColor" runat="server" OnSelectedIndexChanged="ddlMacColor_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="ColourName" CssClass="ddlSelector">
                            </asp:DropDownList>
                            <asp:SqlDataSource
                                ID="SqlDataSource2"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                                SelectCommand="SELECT ColourName FROM Colour WHERE ColourNumericID BETWEEN 10 AND 12 OR ColourNumericID IN (14,15)"></asp:SqlDataSource>

                            <div class="shopContainer2p">
                                <h2 style="color: black;">Storage.&nbsp</h2>
                                <h2 style="color: gray;">How much space do you need?</h2>
                            </div>
                            <label class="optionstext" for="storage">Storage:</label>
                            <asp:DropDownList ID="ddlMacStorage" runat="server" OnSelectedIndexChanged="ddlMacStorage_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="CapacityStorage" CssClass="ddlSelector">
                            </asp:DropDownList>
                            <asp:SqlDataSource
                                ID="SqlDataSource3"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                                SelectCommand="SELECT CapacityStorage FROM Capacity where CapacityNumericID between 3 and 5 "></asp:SqlDataSource>

                            <div class="shopContainer2p">
                                <h2 style="color: black;">Memory.&nbsp</h2>
                                <h2 style="color: gray;">How quick do you want your Mac to be?</h2>
                            </div>
                            <label class="optionstext" for="storage">Memory:</label>
                            <asp:DropDownList ID="ddlMacMemory" runat="server" OnSelectedIndexChanged="ddlMacMemory_SelectedIndexChanged" DataSourceID="SqlDataSource4" DataTextField="MemorySize" CssClass="ddlSelector">
                            </asp:DropDownList>
                            <asp:SqlDataSource
                                ID="SqlDataSource4"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                                SelectCommand="SELECT MemorySize FROM Memory"></asp:SqlDataSource>

                            <div class="shopContainer2p">
                                <h2 style="color: black;">Power Adapter.&nbsp</h2>
                                <h2 style="color: gray;">Which power adapter is right for you?</h2>
                            </div>
                            <label class="optionstext" for="storage">Power Adapter:</label>
                            <asp:DropDownList ID="ddlMacPower" runat="server" OnSelectedIndexChanged="ddlMacPower_SelectedIndexChanged" DataSourceID="SqlDataSource5" DataTextField="PA_Watts" CssClass="ddlSelector">
                            </asp:DropDownList>
                            <asp:SqlDataSource
                                ID="SqlDataSource5"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Pineapple %>"
                                SelectCommand="SELECT PA_Watts FROM PowerAdapter"></asp:SqlDataSource>

                            <div class="shopContainer2p">
                                <label for="quantity">Quantity:</label>
                            </div>
                            <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="quantitySelector" ></asp:TextBox>

                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="AddToCart_Click" CssClass="addToCartButton" />
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    </div>
    </div>

    <script src="scripts/carousel.js"></script>
</asp:Content>
