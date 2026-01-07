<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="UserManagement1.aspx.cs" Inherits="Web_App_Dev_CW.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .background {
            background-image: url('/image/editBackground.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: repeat;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            position: relative;
        }

        .tableuser{
            padding:100px;
            width:100%;
            height:contain;
        }

        .auto-style1 {
            height: 23px;
            width: 597px;
        }

        .auto-style2 {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .auto-style3 {
            height: 23px;
            width: 139px;
            font-weight: bold;
            font-display: auto;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
        }

        .auto-style4 {
            padding: 10px;
            font-size: 14px;
            color: #1d1d1f;
            outline: none;
        }

        .auto-style5 {
            height: 23px;
            width: 143px;
            font-weight: bold;
            font-display: auto;
        }

        .auto-style6 {
            padding: 10px;
            width: 70%;
            margin-bottom: 10px;
            font-size: 14px;
            color: #1d1d1f;
            min-width: 500px;
        }

        .auto-style10 {
            width: 90%;
            margin-right: 0px;
        }

        .auto-style11 {
            background-color: #007aff; /* Apple blue */
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 15px 30px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .profile-picture {
            border-radius: 50%; /* Makes the image circular */
            border: 2px solid #ccc;
            object-fit: cover; /* Ensures the image fits the frame without distortion */
        }

        select {
            padding: 10px;
            border: 1px solid #d2d2d7;
            border-radius: 8px;
            background-color: #ffffff;
            font-size: 14px;
            color: #1d1d1f;
            outline: none;
        }

        /* Inputs */
        input[type="text"], input[type="password"] {
            padding: 10px;
            border: 1px solid #d2d2d7;
            border-radius: 8px;
            background-color: #ffffff;
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 10px;
            font-size: 14px;
            color: #1d1d1f;
        }


        input[type="text"], input[type="password"], select {
            padding: 15px; /* Increase padding for better visibility */
            border: 1px solid #c7c7c7; /* Lighter border */
            border-radius: 8px;
            background-color: #f8f8f8; /* Slightly lighter background */
            font-size: 16px;
            color: #333;
            width: 100%; /* Ensure full width for title-like appearance */
            box-sizing: border-box;
            margin-bottom: 15px; /* Increase spacing between textboxes */
        }

        button {
            background-color: #007aff;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 15px 30px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            button.customer {
                background-color: #007aff;
                color: black;
            }

            button.admin {
                background-color: #32d74b;
                color: black;
            }

            button.reset {
                background-color: #ff3b30;
                color: black;
            }

            button:hover {
                background: #ff8573;
            }

        .gridview {
            width: 100%;
            min-width: 1000px;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            table-layout: auto;
        }

            .gridview th, .gridview td {
                padding: 15px;
                text-align: left;
                font-size: 14px;
                color: #333;
                border-bottom: 1px solid #eee;
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow: hidden;
            }

            .gridview th {
                background-color: #f3f3f3;
                color: #555;
                font-weight: 600;
                border-bottom: 2px solid #ddd;
            }

            .gridview tr:hover {
                background-color: #f9f9f9;
                cursor: pointer;
            }

            .gridview button {
                padding: 8px 12px;
                border: none;
                border-radius: 5px;
                background-color: #007aff;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

                .gridview button:hover {
                    background-color: #0056b3;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="background">

        <div class="tableuser">

            <table class="auto-style10">

                <tr>
                    <td class="title">User Management</td>
                    <td class="auto-style5"></td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="imgPreview" runat="server" />
                    </td>
                    <td>&nbsp;</td>
                    <td class="title">User List</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:FileUpload ID="fileUpload" runat="server" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnShowAdmin" runat="server" class="auto-style11" Text="Admin" OnClick="btnShowAdmin_Click" Width="117px" />
                        <asp:Button ID="btnShowCustomer" runat="server" class="auto-style11" Text="Customer" OnClick="btnShowCustomer_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;&nbsp; Username</td>
                    <td class="auto-style5">&nbsp;&nbsp; Password</td>
                    <td class="auto-style1">
                        <asp:GridView ID="gvAdminList" runat="server" OnSelectedIndexChanged="gvAdminList_SelectedIndexChanged" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowEditing="gvAdminList_RowEditing" OnRowDeleting="gvAdminList_RowDeleting" OnRowUpdating="gvAdminList_RowUpdating" DataKeyNames="AdminID" CssClass="gridview">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                <asp:BoundField DataField="AdminID" HeaderText="AdminID" ReadOnly="True" SortExpression="AdminID" />
                                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                                <asp:TemplateField HeaderText="Picture Path">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPicturePath" runat="server" Text='<%# Eval("PicturePath") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Pineapple %>" SelectCommand="SELECT a.AdminID,  b.Username , a.FirstName, a.LastName, a.PhoneNumber, a.PicturePath
FROM Admin a
INNER JOIN Account b ON a.AccountNumericID = b.AccountNumericID;"
                            DeleteCommand="DELETE FROM Account
WHERE AccountNumericID = (SELECT AccountNumericID FROM Admin WHERE AdminNumericID = @AdminNumericID);


DELETE FROM Admin
WHERE AdminNumericID = @AdminNumericID;"
                            UpdateCommand="UPDATE Admin
SET FirstName = @FirstName, 
    LastName = @LastName, 
    PhoneNumber = @PhoneNumber
WHERE AdminID = @AdminID;UPDATE Account 
SET Username = @Username 
WHERE AccountNumericID = (SELECT AccountNumericID FROM Admin WHERE AdminID = @AdminID);">
                            <DeleteParameters>
                                <asp:Parameter Name="AdminNumericID" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FirstName" />
                                <asp:Parameter Name="LastName" />
                                <asp:Parameter Name="PhoneNumber" />
                                <asp:Parameter Name="AdminID" />
                                <asp:Parameter Name="Username" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <asp:GridView ID="gvCustomerList" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                            DataSourceID="SqlDataSource1" CssClass="gridview">
                            <Columns>
                                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                <asp:BoundField DataField="PhoneNum" HeaderText="PhoneNum" SortExpression="PhoneNum" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pineapple %>" SelectCommand="SELECT [CustomerID], [LastName], [FirstName], [PhoneNum] FROM [Customer]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnRefresh" runat="server" class="auto-style11" OnClick="btnRefresh_Click" Text="Refresh" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;&nbsp;
                        FirstName</td>
                    <td class="auto-style5">&nbsp;&nbsp;
                        LastName</td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;&nbsp;
                        PhoneNumber</td>
                    <td class="auto-style5">&nbsp;&nbsp;
                        Role</td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlRole" runat="server">
                            <asp:ListItem>Admin</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;
                        <asp:Button ID="btnUpload" runat="server" class="auto-style11" OnClick="btnUpload_Click" Text="Upload" />
                    </td>
                    <td>&nbsp;&nbsp;
                        <asp:Button ID="btnReset" runat="server" class="auto-style11" OnClick="btnReset_Click" Text="Reset" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>

            </table>

        </div>
    </div>

</asp:Content>
