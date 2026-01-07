<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="removeProduct.aspx.cs" Inherits="Admin.admin.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .removeContainer{
            padding-top:50px;
            padding-left:500px;
            padding-right:500px;
            padding-bottom:60px;
        }
    </style>

    <div class ="removeContainer">
    <h2>Remove Product</h2>
    <div class="form-group">
        <label for="ddlProducts">Select Product:</label>
        <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control" Width="800px" ></asp:DropDownList>
    </div>
    <div class="form-group">
        <asp:Button ID="btnRemove" runat="server" Text="Remove Product" CssClass="btn btn-danger" OnClick="btnRemove_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnReturnRemove" runat="server" OnClick="Button1_Click" Text="Return" />
    </div>
    <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>

    </div>
</asp:Content>