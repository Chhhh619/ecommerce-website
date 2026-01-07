<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminFeedback.aspx.cs" Inherits="Web_App_Dev_CW.WebForm2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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

    .adminFeedback {
    width: 100%;
    height: contain;
    padding-top: 50px;
}
    </style>

<div class="background">
     <div class="adminFeedback">
    <div class="text-center" style="display: flex; justify-content: center; align-content: baseline; align-items: center; padding-bottom: 50px;">
        <asp:GridView ID="GridViewFeedback" runat="server" AutoGenerateColumns="False"
              CssClass="table" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderStyle="Solid" BorderWidth="1px" Width="996px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Feedback ID" SortExpression="Id" />
                <asp:BoundField DataField="SelectedIssues" HeaderText="Selected Issues" SortExpression="SelectedIssues" />
                <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                <asp:BoundField DataField="SubmissionDate" HeaderText="Submission Date" SortExpression="SubmissionDate" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
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
</asp:Content>
