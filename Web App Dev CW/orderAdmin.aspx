<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="orderAdmin.aspx.cs" Inherits="Web_App_Dev_CW.WebForm6" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .background {
            background-image: url('/image/editBackground.jpg');
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            height: 100%;
            z-index: 0;
            padding-bottom: 100px;
        }

        .editproduct {
            width: 100%;
            height: contain;
            padding-top: 50px;
        }

            .editproduct h2 {
                text-align: center;
            }

        .h2container {
            display: block;
            height: 150px;
            width: 100%;
            text-align: center;
            font-size: 40px;
            font-weight: 600;
            color: black;
        }

        .ordercontainer{
            display:block；
        }
    </style>

    <div class="background">
        <div class="editproduct">
            <div class="ordercontainer">
                <div class="text-center" style="display: flex; justify-content: center; align-content: baseline; align-items: center; padding-bottom: 50px;">
                    <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False"
                        CssClass="table" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderStyle="Solid" BorderWidth="1px" Width="996px">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="Order ID" SortExpression="OrderID" />
                            <asp:BoundField DataField="OrderDateTime" HeaderText="Order Date" SortExpression="OrderDateTime" />
                            <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount (RM)" SortExpression="TotalAmount" />
                            <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" SortExpression="CustomerName" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>