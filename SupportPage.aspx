<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SupportPage.aspx.cs" Inherits="Web_App_Dev_CW.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/support.css" />
    <link rel="stylesheet" href="css/nav.css" />
    <link rel="stylesheet" href="css/brewislife.css" />

    <style type="text/css">
        .auto-style1 {
            cursor: pointer;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 0;
        }
        .auto-style2 {
            cursor: pointer;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 0;
        }
        .auto-style3 {
            max-width: 600px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            padding: 10px 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
        <div class="support-container">
            <header class="support-header">How can we help you?</header>
            <div class="search-bar">
                <label for="t1" class="search-label"></label>
                <div class="search-wrapper">
                    <asp:TextBox ID="t1" runat="server" CssClass="auto-style3" placeholder="Type your question here..." Width="650px"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnSearch1" runat="server" Text="Submit" CssClass="auto-style2" Height="50px" Width="59px" OnClick="btnSearch_Click"/>
                </div>
            </div>
            <div class="categories">
                <a href="iphoneBasic.aspx" class="category">iPhone Basics</a>
                <a href="privacyAndSecurity.aspx" class="category">Privacy & Security</a>
                <a href="battery-charging.aspx" class="category">Battery & Charging</a>
                <a href="icloud-apple-id.aspx" class="category">iCloud & Apple ID</a>
                <a href="apps-features.aspx" class="category">Apps & Features</a>
                <a href="screen-display.aspx" class="category">Screen & Display</a>   
                <a href="updates-software.aspx" class="category">Updates & Software</a>
                <a href="accessories.aspx" class="category">Accessories</a>
                <a href="repair-warranty.aspx" class="category">Repair & Warranty</a>
                <a href="troubleshooting.aspx" class="category">Troubleshooting</a>
                <a href="account-billing.aspx" class="category">Account & Billing</a>
                <a href="backup-restore.aspx" class="category">Backup & Restore</a>
            </div>
        </div>

    


</asp:Content>
