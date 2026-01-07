<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="Web_App_Dev_CW.userProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/customerProfile.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <h2>Your Profile</h2>
        <asp:Label ID="lblMessage" CssClass="success-label" runat="server"></asp:Label>
        <asp:Label ID="lblError" CssClass="error-label" runat="server"></asp:Label>

        <div class="profile-form">
            <label for="txtFirstName">First Name</label>
            <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>

            <label for="txtLastName">Last Name</label>
            <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>

            <label for="txtEmail">Email Address</label>
            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>

            <label for="txtPhone">Phone Number</label>
            <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>

            <label for="txtUsername">Username</label>
            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>

            <label for="txtOldPassword">Current Password</label>
            <asp:TextBox ID="txtOldPassword" CssClass="form-control" TextMode="Password" runat="server" Placeholder="Enter your current password"></asp:TextBox>

            <label for="txtPassword">New Password</label>
            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>

            <asp:Button ID="btnUpdate" CssClass="btn update-btn" Text="Update Profile" OnClick="btnUpdate_Click" runat="server" />
        </div>
        <div class="links">
                <a href="homepage1.aspx" class="link">Return</a>
            </div>
    </div>
</asp:Content>