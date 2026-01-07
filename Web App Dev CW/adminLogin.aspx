<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="Admin.admin.adminLogin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .background {
            background-image: url('/image/editBackground.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            position: relative;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            margin: auto;
            justify-content: center;
            align-items: center;
        }

            .login-container h1 {
                text-align: center;
                color: #333;
                font-size: 24px;
                margin-bottom: 20px;
            }

        .form-group {
            margin-bottom: 20px;
        }

            .form-group label {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 14px;
            }

                .form-group input:focus {
                    outline: none;
                    border-color: #007bff;
                    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
                }

        .btn-login {
            width: 100%;
            padding: 10px;
            background-color: #000000;
            border: none;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .btn-login:hover {
                background-color: #737373;
            }

        .btn-return {
            background: none;
            border: none;
            color: #000000;
            font-size: 16px;
            cursor: pointer;
            text-decoration: underline;
            transition: color 0.3s ease;
            padding-top: 20px;
            text-align: center;
        }

            .btn-return:hover {
                color: #737373;
                text-decoration: none;
            }

        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }

        .return {
            margin-top:20px;
            text-align: center;
        }
    </style>

    <div class="background">
        <div class="login-container">
            <h1>Admin Login</h1>
            <asp:Label ID="lblError" runat="server" CssClass="error-message" Text=""></asp:Label>
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Enter your username"></asp:TextBox>
            </div>
            <div ss="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter your password"></asp:TextBox>
            </div>
            <div class="return">
                <asp:Button ID="btnLogin" runat="server" CssClass="btn-login" Text="Login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnReturn" runat="server" CssClass="btn-return" Text="Return" OnClick="btnReturn_Click" />
            </div>
        </div>
    </div>

</asp:Content>