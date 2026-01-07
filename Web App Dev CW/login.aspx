<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Web_App_Dev_CW.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/userlogin.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2>Customer Login</h2>
        
        <div class="login-form">
            
            <label for="txtMemberID">Username</label>
            <asp:TextBox ID="txtMemberID" CssClass="form-control" runat="server" Placeholder="Enter your username"></asp:TextBox>

           
            <label for="txtPassword">Password</label>
            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server" Placeholder="Enter your password"></asp:TextBox>
            <asp:Label ID="lblError" runat="server" CssClass="error-label"></asp:Label>

            
            <asp:Button ID="btnLogin" CssClass="btn login-btn" Text="Login" OnClick="btnLogin_Click" runat="server" />
            <asp:Button ID="btnSignUp" CssClass="btn signup-btn" Text="Register" OnClick="btnSignUp_Click" runat="server" />

           
            <div class="links">
                <a href="homePage1.aspx" class="link">Return</a>
                <a href="adminLogin.aspx" class="link">Admin Login</a>
            </div>
        </div>
    </div>
</asp:Content>
