<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add_product.aspx.cs" Inherits="Web_App_Dev_CW.add_product" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/brewislife.css">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/java.css">
    <link rel="stylesheet" href="css/review.css">
    <link rel="stylesheet" href="css/apple.css" />

    <h3>
        Add Product Page
    </h3>
    <table>
        <tr>
            <td>Product Name</td>
            <td><asp:Textbox ID="t1" runat="server"></asp:Textbox></td>
        </tr>
        <tr>
            <td>Product Description</td>
            <td><asp:TextBox ID="t2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Price</td>
            <td><asp:TextBox ID="t3" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Quantity</td>
            <td><asp:TextBox ID="t4" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Image</td>
            <td><asp:FileUpload ID="f1" runat="server"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="b1" runat="server" Text="upload" OnClick="b1_Click" />
            </td>
        </tr>
        
    </table>
</asp:Content>
