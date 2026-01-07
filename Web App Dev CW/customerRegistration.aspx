<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customerRegistration.aspx.cs" Inherits="Web_App_Dev_CW.customerRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/customerRegistration.css" rel="stylesheet" />
    <script>
        function validateForm() {
            var firstName = document.getElementById('<%= txtFirstName.ClientID %>').value.trim();
            var lastName = document.getElementById('<%= txtLastName.ClientID %>').value.trim();
            var contactNumber = document.getElementById('<%= txtContactNumber.ClientID %>').value.trim();
            var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
            var username = document.getElementById('<%= txtUsername.ClientID %>').value.trim();
            var password = document.getElementById('<%= txtPassword.ClientID %>').value.trim();
            var errorLabel = document.getElementById('<%= lblError.ClientID %>');

            if (!firstName || !lastName || !contactNumber || !email || !username || !password) {
                errorLabel.textContent = "All fields are required.";
                return false;
            }

            var emailRegex = /^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test(email)) {
                errorLabel.textContent = "Invalid email format.";
                return false;
            }

            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:Panel ID="pnlRegistrationForm" runat="server" CssClass="registration-form">
        <asp:Panel ID="pnlRegistrationHeader" CssClass="registration-header" runat="server">
            <h2>User Registration</h2>
        </asp:Panel>

  
        <asp:Panel ID="pnlFormGroupFirstName" runat="server" CssClass="form-group">
            <asp:Label ID="lblFirstName" runat="server" Text="First Name" AssociatedControlID="txtFirstName" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-field" Placeholder="First Name"></asp:TextBox>
        </asp:Panel>


        <asp:Panel ID="pnlFormGroupLastName" runat="server" CssClass="form-group">
            <asp:Label ID="lblLastName" runat="server" Text="Last Name" AssociatedControlID="txtLastName" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="input-field" Placeholder="Last Name"></asp:TextBox>
        </asp:Panel>


        <asp:Panel ID="pnlFormGroupContact" runat="server" CssClass="form-group">
            <asp:Label ID="lblContactNumber" runat="server" Text="Contact Number" AssociatedControlID="txtContactNumber" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtContactNumber" runat="server" CssClass="input-field" Placeholder="Contact Number"></asp:TextBox>
        </asp:Panel>


        <asp:Panel ID="pnlFormGroupEmail" runat="server" CssClass="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email Address" AssociatedControlID="txtEmail" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" Placeholder="Email ID"></asp:TextBox>
        </asp:Panel>


        <asp:Panel ID="pnlFormGroupUsername" runat="server" CssClass="form-group">
            <asp:Label ID="lblUsername" runat="server" Text="Username" AssociatedControlID="txtUsername" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="input-field" Placeholder="Username"></asp:TextBox>
        </asp:Panel>


        <asp:Panel ID="pnlFormGroupPassword" runat="server" CssClass="form-group">
            <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field" Placeholder="Password"></asp:TextBox>
        </asp:Panel>


        <asp:Label ID="lblError" runat="server" CssClass="error-label"></asp:Label>


        <asp:HiddenField ID="hfRole" runat="server" Value="Customer" />


        <asp:Panel ID="pnlFormGroupSubmit" runat="server" CssClass="form-group">
            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="submit-button" OnClientClick="return validateForm();" OnClick="btnSignUp_Click" />
        </asp:Panel>

        <div class="links">
            <a href="login.aspx" class="link">Return</a>
        </div>
    </asp:Panel>
</asp:Content>