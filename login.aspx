<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Web_App_Dev_CW.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <style>
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .login-container header {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .login-container label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #555;
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .login-container .button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .login-container .button:hover {
            background-color: #0056b3;
        }

        .login-container .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <form id="f1" runat="server">
            <header>Admin Login</header>
            <label for="t1">Username <span>*</span></label>
            <asp:TextBox ID="t1" runat="server" CssClass="input" placeholder="Enter your username"></asp:TextBox>

            <label for="t2">Password <span>*</span></label>
            <asp:TextBox ID="t2" runat="server" CssClass="input" TextMode="Password" placeholder="Enter your password"></asp:TextBox>

            <asp:Button ID="b1" runat="server" Text="Login" CssClass="button" OnClick="b1_Click" />

            <asp:Label ID="l1" runat="Server" CssClass="error-message" Text=""></asp:Label>
        </form>
    </div>
</asp:Content>
