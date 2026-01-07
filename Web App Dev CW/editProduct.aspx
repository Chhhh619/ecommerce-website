<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="editProduct.aspx.cs" Inherits="Admin.admin.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .background {
            background-image: url('/image/editBackground.jpg');
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            height: 100%;
            z-index: 0;
            padding-bottom:100px;
            display:block;
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
            font-size:40px;
            font-weight:600;
            color:black;
        }

    </style>

    <div class="background">
        <div class="editproduct">
            <strong>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            </strong>

            <div class="gviPhoneContainer" style="display: flex; justify-content: center; align-content: baseline; align-items: center">
                <p>&nbsp;</p>
                <div class="text-center">
                    <asp:GridView ID="gvIPhones" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
                        OnRowEditing="gvProducts_RowEditing"
                        OnRowCancelingEdit="gvProducts_RowCancelingEdit"
                        OnRowUpdating="gvProducts_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="996px">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" />
                            <asp:BoundField DataField="Name" HeaderText="Product Name" ReadOnly="True" />
                            <asp:BoundField DataField="Colour" HeaderText="Colour" ReadOnly="True" />
                            <asp:BoundField DataField="Capacity" HeaderText="Capacity" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Product Image">
                                <ItemTemplate>
                                    <img src='<%# Eval("ProductPicture") %>' alt="Product Image" style="max-width: 100px; max-height: 100px;" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fileUploadImage" runat="server" />
                                    <asp:Label ID="lblImageError" runat="server" ForeColor="Red"></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <%# Eval("PricePerUnit") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("PricePerUnit") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <%# Eval("Quantity") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
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
            <br />

            <div class="gvMacBookContainer" style="display: flex; justify-content: center; align-content: baseline; align-items: center">
                <h2>&nbsp;</h2>
                <h2>&nbsp;</h2>


                <div class="text-center">
                    <asp:GridView ID="gvMacBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
                        OnRowEditing="gvProducts_RowEditing"
                        OnRowCancelingEdit="gvProducts_RowCancelingEdit"
                        OnRowUpdating="gvProducts_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="997px" CssClass="auto-style2">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" />
                            <asp:BoundField DataField="Name" HeaderText="Product Name" ReadOnly="True" />
                            <asp:BoundField DataField="Colour" HeaderText="Colour" ReadOnly="True" />
                            <asp:BoundField DataField="Memory" HeaderText="Memory" ReadOnly="True" />
                            <asp:BoundField DataField="Capacity" HeaderText="Capacity" ReadOnly="True" />
                            <asp:BoundField DataField="Chipset" HeaderText="Chipset" ReadOnly="True" />
                            <asp:BoundField DataField="PowerAdapter" HeaderText="Power Adapter" ReadOnly="True" />

                            <asp:TemplateField HeaderText="Product Image">
                                <ItemTemplate>
                                    <img src='<%# Eval("ProductPicture") %>' alt="Product Image" style="max-width: 100px; max-height: 100px;" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fileUploadImage" runat="server" />
                                    <asp:Label ID="lblImageError" runat="server" ForeColor="Red"></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <%# Eval("PricePerUnit") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("PricePerUnit") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <%# Eval("Quantity") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
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
            <br />

            <div class="gvAirPodsContainer" style="display: flex; justify-content: center; align-content: baseline; align-items: center">

                <div class="text-center">
                    <asp:GridView ID="gvAirPods" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
                        OnRowEditing="gvProducts_RowEditing"
                        OnRowCancelingEdit="gvProducts_RowCancelingEdit"
                        OnRowUpdating="gvProducts_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="993px">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" />
                            <asp:BoundField DataField="Name" HeaderText="Product Name" ReadOnly="True" />
                            <asp:BoundField DataField="NoiseCancellation" HeaderText="Noise Cancellation" ReadOnly="True" />

                            <asp:TemplateField HeaderText="Product Image">
                                <ItemTemplate>
                                    <img src='<%# Eval("ProductPicture") %>' alt="Product Image" style="max-width: 100px; max-height: 100px;" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fileUploadImage" runat="server" />
                                    <asp:Label ID="lblImageError" runat="server" ForeColor="Red"></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <%# Eval("PricePerUnit") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("PricePerUnit") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <%# Eval("Quantity") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:CommandField ShowEditButton="True" ShowCancelButton="True" />
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