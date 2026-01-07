<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="Web_App_Dev_CW.logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Logout</title>
    <style>
        .logout-message {
            font-size: 24px;
            text-align: center; 
            margin-top: 50px;
            color: #007bff; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="logout-message">
        <asp:Label ID="lblMessage" runat="server" Text="You are being logged out..."></asp:Label>
    </div>
</asp:Content>
