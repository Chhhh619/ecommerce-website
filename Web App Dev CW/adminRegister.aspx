<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminRegister.aspx.cs" Inherits="Web_App_Dev_CW.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
       
         .background {
            background-image: url('/image/editBackground.jpg');
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size:cover;
            height: 100%;
            z-index: 0;
            padding-bottom:100px;
            padding-top: 20px;
            display:block;
        }

        .register-container {
            width: 100%;
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

       

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #007bff;
            outline: none;
        }

        .form-group img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 10px;
            
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn {
            padding: 10px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .error-message {
            color: red;
            font-size: 12px;
            margin-top: -10px;
            margin-bottom: 10px;
        }
        .profile-picture{
            border-radius: 50%; 
            border: 2px solid #ccc;
            object-fit: cover;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="background">
    <div class="register-container">
        
        <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
        <asp:Panel runat="server">
            <div class="form-group">
                <label for="admin-picture">Admin Picture</label>
                <asp:Image ID="imgPreview" runat="server" CssClass="profile-picture" />
                <asp:FileUpload ID="fileUpload" runat="server" />
            </div>

            <div class="form-group">
                <label for="first-name">First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter First Name"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="last-name">Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="phone-number">Phone Number</label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" placeholder="Enter Phone Number"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="role">Role</label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem>Admin</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="username">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            </div>

            <div class="form-actions">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-secondary" Text="Return to Login" OnClick="Button1_Click" />
            </div>
        </asp:Panel>
    </div>
        </div>
</asp:Content>