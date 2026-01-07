<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SupportPage.aspx.cs" Inherits="Web_App_Dev_CW.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/supportPage.css" rel="stylesheet" />
    <script>
    function showConfirmation() {
        alert("Your report has been submitted successfully!");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
       <div class="support-page">
        <div class="header">Support Page</div>
        <h2 class="title">What issue are you facing?</h2>
        <div class="categories">
            <div class="category">
                <h3 class="category-title">Device Issues</h3>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkScreen" runat="server" />
                        Screen not responding
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkBattery" runat="server" />
                        Battery draining quickly
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkCharge" runat="server" />
                        Unable to charge
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkFaceID" runat="server" />
                        Face ID not working
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkOverheating" runat="server" />
                        Overheating
                    </label>
                </div>
            </div>
            <div class="category">
                <h3 class="category-title">Software Issues</h3>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkAppsCrashing" runat="server" />
                        Apps crashing
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkIOSUpdate" runat="server" />
                        iOS update failed
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkDataLoss" runat="server" />
                        Data loss
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkSyncIssue" runat="server" />
                        Unable to sync with iCloud
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkAppDownload" runat="server" />
                        App download issues
                    </label>
                </div>
            </div>
            <div class="category">
                <h3 class="category-title">Network Issues</h3>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkWifi" runat="server" />
                        Unable to connect to Wi-Fi
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkCellular" runat="server" />
                        Cellular data not working
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkSignal" runat="server" />
                        Poor signal strength
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkBluetooth" runat="server" />
                        Bluetooth connectivity issue
                    </label>
                </div>
                <div class="checkbox-container">
                    <label class="checkbox-label">
                        <asp:CheckBox ID="chkAirdrop" runat="server" />
                        AirDrop not working
                    </label>
                </div>
            </div>
        </div>
        <div class="comments-section">
            <label class="comments-label" for="txtComments">Additional Comments (Optional):</label>
            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" CssClass="comments-box"  placeholder="Enter additional Information here"/>
        </div>
        <div class="submit-section">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Report" CssClass="submit-button" OnClick="btnSubmit_Click" />
        </div>
    </div>

    


</asp:Content>
