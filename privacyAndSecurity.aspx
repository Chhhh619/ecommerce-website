<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="privacyAndSecurity.aspx.cs" Inherits="Web_App_Dev_CW.privacyAndSecurity" %>
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
        <h1>Privacy and Security</h1>
        <p>Protect your data and secure your device with these guides.</p>
    </div>

    <div class="topics-grid">
        <div class="topic-card">
            
            <h2>Setting a Passcode</h2>
            <p>Learn how to set or change your iPhone passcode.</p>
            <a href="set-passcode.aspx" class="topic-link">Learn More</a>
        </div>
        <div class="topic-card">
           
            <h2>Two-Factor Authentication</h2>
            <p>Enhance your account security with 2FA.</p>
            <a href="two-factor-auth.aspx" class="topic-link">Learn More</a>
        </div>
        <div class="topic-card">
            
            <h2>Adjusting Privacy Settings</h2>
            <p>Control which apps can access your data.</p>
            <a href="privacy-settings-guide.aspx" class="topic-link">Learn More</a>
        </div>
        <div class="topic-card">
            
            <h2>Find My iPhone</h2>
            <p>Learn how to locate your device if it’s lost.</p>
            <a href="find-my-iphone.aspx" class="topic-link">Learn More</a>
        </div>
    </div>

    <div class="faq-section">
        <h3>Frequently Asked Questions</h3>
        <ul class="faq-list">
            <li><a href="how-to-lock-apps.aspx">How to lock specific apps?</a></li>
            <li><a href="block-unwanted-calls.aspx">How to block unwanted calls?</a></li>
            <li><a href="data-privacy.aspx">What data does Apple collect?</a></li>
        </ul>
    </div>
</asp:Content>
