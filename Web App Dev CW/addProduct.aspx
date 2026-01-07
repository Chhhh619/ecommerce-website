<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="addProduct.aspx.cs" Inherits="Admin.admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
    .addContainer{
        padding-top:50px;
        padding-left:500px;
        padding-right:500px;
        padding-bottom:60px;
    }
</style>
    <script>
        $(document).ready(function () {
            function toggleFields() {
                var selectedCategory = $("#<%= ddlCategory.ClientID %>").val();

              
                $(".common-fields").show();
                $(".iphone-fields, .macbook-fields, .airpods-fields").hide();

         
                if (selectedCategory === "1") { // iPhone
                    $(".iphone-fields").show();
                } else if (selectedCategory === "2") { // MacBook
                    $(".macbook-fields").show();
                } else if (selectedCategory === "3") { // AirPods
                    $(".airpods-fields").show();
                }
            }

            
            $("#<%= ddlCategory.ClientID %>").change(function () {
                toggleFields();
            });


            toggleFields();
        });
    </script>


    <div class="addContainer">
    <h2>Add Product</h2>


    
    <div class="form-group common-fields">
        <label for="<%= fileUpload1.ClientID %>">Upload Product Picture:</label>
        <asp:FileUpload ID="fileUpload1" runat="server" CssClass="form-control" />
    </div>

   
    <div class="form-group common-fields">
        <label for="<%= txtName.ClientID %>">Product Name:</label>
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group common-fields">
        <label for="<%= ddlCategory.ClientID %>">Category:</label>
        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
            <asp:ListItem Text="Select Category" Value="0"></asp:ListItem>
            <asp:ListItem Text="iPhone" Value="1"></asp:ListItem>
            <asp:ListItem Text="MacBook" Value="2"></asp:ListItem>
            <asp:ListItem Text="AirPods" Value="3"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group common-fields">
        <label for="<%= ddlColour.ClientID %>">Colour:</label>
        <asp:DropDownList ID="ddlColour" runat="server" CssClass="form-control"></asp:DropDownList>
        <asp:TextBox ID="txtNewColour" runat="server" CssClass="form-control mt-2" Placeholder="Enter new Colour"></asp:TextBox>
        <asp:Button ID="btnAddColour" runat="server" Text="Add New Colour" CssClass="btn btn-secondary mt-2" OnClick="btnAddColour_Click" />
    </div>
    <div class="form-group common-fields">
        <label for="<%= txtPrice.ClientID %>">Price Per Unit:</label>
        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group common-fields">
        <label for="<%= txtQuantity.ClientID %>">Quantity:</label>
        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

   
    <div class="form-group iphone-fields" style="display: none;">
        <label for="<%= ddlCapacity.ClientID %>">Capacity:</label>
        <asp:DropDownList ID="ddlCapacity" runat="server" CssClass="form-control"></asp:DropDownList>
        <asp:TextBox ID="txtNewCapacity" runat="server" CssClass="form-control mt-2" Placeholder="Enter new Capacity"></asp:TextBox>
        <asp:Button ID="btnAddCapacity" runat="server" Text="Add New Capacity" CssClass="btn btn-secondary mt-2" OnClick="btnAddCapacity_Click" />
    </div>

   
    <div class="form-group macbook-fields" style="display: none;">
        <label for="<%= ddlCapacityMac.ClientID %>">Capacity:</label>
        <asp:DropDownList ID="ddlCapacityMac" runat="server" CssClass="form-control"></asp:DropDownList>
         <asp:TextBox ID="txtNewCapacityMac" runat="server" CssClass="form-control mt-2" Placeholder="Enter new Capacity"></asp:TextBox>
         <asp:Button ID="btnAddCapacityMac" runat="server" Text="Add New Capacity" CssClass="btn btn-secondary mt-2" OnClick="btnAddCapacityMac_Click" />
    </div>
    <div class="form-group macbook-fields" style="display: none;">
        <label for="<%= ddlChipset.ClientID %>">Chipset:</label>
        <asp:DropDownList ID="ddlChipset" runat="server" CssClass="form-control"></asp:DropDownList>
        <asp:TextBox ID="txtNewChipset" runat="server" CssClass="form-control mt-2" Placeholder="Enter new Chipset"></asp:TextBox>
<asp:Button ID="btnAddChipset" runat="server" Text="Add New Chipset" CssClass="btn btn-secondary mt-2" OnClick="btnAddChipset_Click" />
    </div>
    <div class="form-group macbook-fields" style="display: none;">
        <label for="<%= ddlMemory.ClientID %>">Memory:</label>
        <asp:DropDownList ID="ddlMemory" runat="server" CssClass="form-control"></asp:DropDownList>
        <asp:TextBox ID="txtNewMemory" runat="server" CssClass="form-control mt-2" Placeholder="Enter new Memory"></asp:TextBox>
<asp:Button ID="btnAddMemory" runat="server" Text="Add New Memory" CssClass="btn btn-secondary mt-2" OnClick="btnAddMemory_Click" />
    </div>
    <div class="form-group macbook-fields" style="display: none;">
        <label for="<%= ddlPowerAdapter.ClientID %>">Power Adapter:</label>
        <asp:DropDownList ID="ddlPowerAdapter" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:TextBox ID="txtNewPowerAdapter" runat="server" CssClass="form-control mt-2" Placeholder="Enter new Power Adapter"></asp:TextBox>
<asp:Button ID="btnAddPowerAdapter" runat="server" Text="Add New Power Adapter" CssClass="btn btn-secondary mt-2" OnClick="btnAddPowerAdapter_Click" />
    </div>

   
    <div class="form-group airpods-fields" style="display: none;">
        <label for="<%= ddlNoiseCancellation.ClientID %>">Noise Cancellation:</label>
        <asp:DropDownList ID="ddlNoiseCancellation" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>
    <div class="form-group airpods-fields" style="display: none;">
        <label for="<%= ddlEngraving.ClientID %>">Engraving:</label>
        <asp:DropDownList ID="ddlEngraving" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>

    
    <div class="form-group">
        <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-primary" OnClick="btnAddProduct_Click" />
        <asp:Button ID="btnReturn" runat="server" Text="Return" CssClass="btn btn-secondary" OnClick="btnReturn_Click" />
    </div>
    <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>

    
    <br />
</div>
    
</asp:Content>