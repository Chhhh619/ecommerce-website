<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addToCart.aspx.cs" Inherits="Web_App_Dev_CW.addToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function addToCart() {
            alert("Added to cart successfully!");
        }
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="css/StyleSheet1.css" />

    <div class="containerr">
        <div class="list">
            <div class="item">
                <div class="img">
                    <img src="image/iphone_16pro.png" />
                </div>
                <div class="content">
                    <div class="title">Iphone 16 Pro</div>
                    <div class="des">
                        The Ultimate Iphone
                    </div>
                    <br />
                    <div class="price">From RM4999</div>
                    </br>
                    
                    <a class="add" href="#" onclick="addToCart()">Add to Cart</a>
                </div>
            </div>

            <div class="item">
                <div class="img">
                    <img src="image/iphone_16.png" />
                </div>
                <div class="content">
                    <div class="title">Iphone 16 </div>
                    <div class="des">
                        The Total Powerhouse
                    </div>
                    <br />
                    <div class="price">From RM3999</div>
                    </br>
           
                     <a class="add" href="#" onclick="addToCart()">Add to Cart</a>
                </div>
            </div>

            <div class="item">
                <div class="img">
                    <img src="image/iphone_15.png" />
                </div>
                <div class="content">
                    <div class="title">Iphone 15</div>
                    <div class="des">
                        As amazing as ever.
                    </div>
                    <br />
                    <div class="price">From RM3499</div>
                    </br>
              
                     <a class="add" href="#" onclick="addToCart()">Add to Cart</a>
                </div>
            </div>

            <div class="item">
                <div class="img">
                    <img src="image/iphone_14.png" />
                </div>
                <div class="content">
                    <div class="title">Iphone 14</div>
                    <div class="des">
                        All kind of awesome.
                    </div>
                    <br />
                    <div class="price">From RM2999</div>
                    </br>
                 
                     <a class="add" href="#" onclick="addToCart()">Add to Cart</a>
                </div>
            </div>

            <div class="item">
                <div class="img">
                    <img src="image/iphone_se.png" />
                </div>
                <div class="content">
                    <div class="title">Iphone SE</div>
                    <div class="des">
                        Serious Power, Serious Value.
                    </div>
                    <br />
                    <div class="price">From RM2199</div>
                    </br>
              
                     <a class="add" href="#" onclick="addToCart()">Add to Cart</a>
                </div>
            </div>

            <div class="item">
                <div class="img">
                    <img src="image/airpods_.png" />
                </div>
                <div class="content">
                    <div class="title">AirPods 4</div>
                    <div class="des">
                        The next evolution of sound and comfort.
                    </div>
                    <div class="price">From RM599</div>
                    </br>
                     <a class="add" href="#" onclick="addToCart()">Add to Cart</a>
                </div>
            </div>

            <div class="item">
                <div class="img">
                    <img src="image/airpods_4.png" />
                </div>
                <div class="content">
                    <div class="title">AirPods 4</div>
                    <div class="des">
                        Active Noise Cancellation
                    </div>
                    <br />
                    <div class="price">From RM829</div>
                    </br>
               
                     <a class="add" href="#" onclick="addToCart()">Add to Cart</a>
                </div>
            </div>

            <div class="item">
                <div class="img">
                    <img src="image/airpods_pro_2.png" />
                </div>
                <div class="content">
                    <div class="title">AirPods Pro 2</div>
                    <div class="des">
                        Pro-level Active Noise.
                    </div>
                    <br />
                    <div class="price">From RM1099</div>
                    </br>
              
                     <a class="add" href="#" onclick="addToCart()">Add to Cart</a>
                </div>
            </div>

            <div class="item">
                <div class="img">
                    <img src="image/airpods_max.png" />
                </div>
                <div class="content">
                    <div class="title">AirPods Max</div>
                    <div class="des">
                        The ultimate over‑ear listening experience.
                    </div>
                    <div class="price">From RM2499</div>
                    </br>
                     <a class="add" href="#" onclick="addToCart()">Add to Cart</a>
                </div>
            </div>


        </div>
        <ul class="listPage">
        </ul>
    </div>


</asp:Content>
