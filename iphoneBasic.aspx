<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="iphoneBasic.aspx.cs" Inherits="Web_App_Dev_CW.iphoneBasic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/support.css" />
    <style>
        .category-header {
            text-align: center;
            padding: 20px;
            background-color: #f9f9f9;
            border-bottom: 1px solid #ddd;
        }

        .category-header h1 {
            font-size: 36px;
            color: #333;
        }

        .category-header p {
            font-size: 18px;
            color: #555;
        }

        .topics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin: 20px;
            padding: 0 10px;
        }

        .topic-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .topic-card:hover {
            transform: translateY(-5px);
        }

        .topic-card img {
            width: 50px;
            margin-bottom: 15px;
        }

        .topic-link {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .topic-link:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="category-header">
        <h1>iPhone Basics</h1>
        <p>Learn the essentials to get started with your iPhone.</p>
    </div>

    <div class="topics-grid">
        <div class="topic-card">
            
            <h2>Setting Up Your iPhone</h2>
            <p>Step-by-step guide to set up your new iPhone.</p>
            <a href="setup-guide.aspx" class="topic-link">Learn More</a>
        </div>
        <div class="topic-card">
            
            <h2>Tips & Tricks</h2>
            <p>Discover hidden features and shortcuts.</p>
            <a href="tips-tricks.aspx" class="topic-link">Learn More</a>
        </div>
        <div class="topic-card">
            
            <h2>Using Navigation</h2>
            <p>Master the gestures and buttons on your iPhone.</p>
            <a href="navigation-guide.aspx" class="topic-link">Learn More</a>
        </div>
        <div class="topic-card">
            
            <h2>Understanding Settings</h2>
            <p>Learn how to customize your iPhone settings.</p>
            <a href="settings-guide.aspx" class="topic-link">Learn More</a>
        </div>
    </div>
</asp:Content>
