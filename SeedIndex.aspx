<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeedIndex.aspx.cs" Inherits="SeedIndex" %>

<asp:Content ID="Seedhead" ContentPlaceHolderID="head" Runat="Server">
    <title>Seed</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="GardensPage">
       <asp:sqldatasource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT CommonName
FROM T_PlantIndex
WHERE PlantID=?">
           <SelectParameters>
               <asp:QueryStringParameter Name="?" QueryStringField="PlantID" />
           </SelectParameters>
       </asp:sqldatasource>
    
    <h1>
       <asp:gridview ID="SeedTitle" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowHeader="False">
           <Columns>
               <asp:BoundField DataField="CommonName" SortExpression="CommonName" ReadOnly="True" ShowHeader="False" />
           </Columns>
       </asp:gridview>
    </h1>
        <br />
        <br />
</div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="seedindex">
    <asp:sqldatasource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT 
PlantID, BotanicalName, IdealBeginDate, SeedTreatment, SowPeriodPostTreat, SowDatePostStrat, PeriodToGerm, GermTemp, GermLight, PlantingPeriod, Method, Notes
FROM T_PlantIndex
WHERE PlantID=?;" UpdateCommand="UPDATE
T_PlantIndex
SET
BotanicalName=?, 
IdealBeginDate=?, 
SeedTreatment=?, 
SowPeriodPostTreat=?, 
SowDatePostStrat=?, 
PeriodToGerm=?, 
GermTemp=?, 
GermLight=?, 
PlantingPeriod=?, 
Method=?, 
Notes=?
WHERE
PlantID = ?">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="PlantID" />
        </SelectParameters>
    </asp:sqldatasource>
    <asp:listview ID="SeedListView" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="PlantID"  OnItemDataBound="ListView1_ItemDataBound">
        <AlternatingItemTemplate>
            <span style="">
            <asp:Label ID="PlantIDLabel" runat="server" Text='<%# Eval("PlantID") %>' Visible="false" />
            <br />
            BotanicalName:
            <asp:Label ID="BotanicalNameLabel" runat="server" Text='<%# Eval("BotanicalName") %>' />
            <br />
            IdealBeginDate:
            <asp:Label ID="IdealBeginDateLabel" runat="server" Text='<%# Eval("IdealBeginDate") %>' />
            <br />
            SeedTreatment:
            <asp:Label ID="SeedTreatmentLabel" runat="server" Text='<%# Eval("SeedTreatment") %>' />
            <br />
            SowPeriodPostTreat:
            <asp:Label ID="SowPeriodPostTreatLabel" runat="server" Text='<%# Eval("SowPeriodPostTreat") %>' />
            <br />
            SowDatePostStrat:
            <asp:Label ID="SowDatePostStratLabel" runat="server" Text='<%# Eval("SowDatePostStrat") %>' />
            <br />
            PeriodToGerm:
            <asp:Label ID="PeriodToGermLabel" runat="server" Text='<%# Eval("PeriodToGerm") %>' />
            <br />
            GermTemp:
            <asp:Label ID="GermTempLabel" runat="server" Text='<%# Eval("GermTemp") %>' />
            <br />
            GermLight:
            <asp:Label ID="GermLightLabel" runat="server" Text='<%# Eval("GermLight") %>' />
            <br />
            PlantingPeriod:
            <asp:Label ID="PlantingPeriodLabel" runat="server" Text='<%# Eval("PlantingPeriod") %>' />
            <br />
            Method:
            <asp:Label ID="MethodLabel" runat="server" Text='<%# Eval("Method") %>' />
            <br />
            Notes:
            <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <br />
            <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">PlantID:
            <asp:Label ID="PlantIDLabel1" runat="server" Text='<%# Eval("PlantID") %>' />
            <br />
            BotanicalName:
            <asp:TextBox ID="BotanicalNameTextBox" runat="server" Text='<%# Bind("BotanicalName") %>' />
            <br />
            IdealBeginDate:
            <asp:TextBox ID="IdealBeginDateTextBox" runat="server" Text='<%# Bind("IdealBeginDate") %>' />
            <br />
            SeedTreatment:
            <asp:TextBox ID="SeedTreatmentTextBox" runat="server" Text='<%# Bind("SeedTreatment") %>' />
            <br />
            SowPeriodPostTreat:
            <asp:TextBox ID="SowPeriodPostTreatTextBox" runat="server" Text='<%# Bind("SowPeriodPostTreat") %>' />
            <br />
            SowDatePostStrat:
            <asp:TextBox ID="SowDatePostStratTextBox" runat="server" Text='<%# Bind("SowDatePostStrat") %>' />
            <br />
            PeriodToGerm:
            <asp:TextBox ID="PeriodToGermTextBox" runat="server" Text='<%# Bind("PeriodToGerm") %>' />
            <br />
            GermTemp:
            <asp:TextBox ID="GermTempTextBox" runat="server" Text='<%# Bind("GermTemp") %>' />
            <br />
            GermLight:
            <asp:TextBox ID="GermLightTextBox" runat="server" Text='<%# Bind("GermLight") %>' />
            <br />
            PlantingPeriod:
            <asp:TextBox ID="PlantingPeriodTextBox" runat="server" Text='<%# Bind("PlantingPeriod") %>' />
            <br />
            Method:
            <asp:TextBox ID="MethodTextBox" runat="server" Text='<%# Bind("Method") %>' />
            <br />
            Notes:
            <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">BotanicalName:
            <asp:TextBox ID="BotanicalNameTextBox" runat="server" Text='<%# Bind("BotanicalName") %>' />
            <br />
            IdealBeginDate:
            <asp:TextBox ID="IdealBeginDateTextBox" runat="server" Text='<%# Bind("IdealBeginDate") %>' />
            <br />
            SeedTreatment:
            <asp:TextBox ID="SeedTreatmentTextBox" runat="server" Text='<%# Bind("SeedTreatment") %>' />
            <br />
            SowPeriodPostTreat:
            <asp:TextBox ID="SowPeriodPostTreatTextBox" runat="server" Text='<%# Bind("SowPeriodPostTreat") %>' />
            <br />
            SowDatePostStrat:
            <asp:TextBox ID="SowDatePostStratTextBox" runat="server" Text='<%# Bind("SowDatePostStrat") %>' />
            <br />
            PeriodToGerm:
            <asp:TextBox ID="PeriodToGermTextBox" runat="server" Text='<%# Bind("PeriodToGerm") %>' />
            <br />
            GermTemp:
            <asp:TextBox ID="GermTempTextBox" runat="server" Text='<%# Bind("GermTemp") %>' />
            <br />
            GermLight:
            <asp:TextBox ID="GermLightTextBox" runat="server" Text='<%# Bind("GermLight") %>' />
            <br />
            PlantingPeriod:
            <asp:TextBox ID="PlantingPeriodTextBox" runat="server" Text='<%# Bind("PlantingPeriod") %>' />
            <br />
            Method:
            <asp:TextBox ID="MethodTextBox" runat="server" Text='<%# Bind("Method") %>' />
            <br />
            Notes:
            <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="">
            <asp:Label ID="PlantIDLabel" runat="server" Text='<%# Eval("PlantID") %>' Visible="false"/>
            <br />
                 <br />
            <b>Botanical Name:</b>
            <asp:Label ID="BotanicalNameLabel" runat="server" Text='<%# Eval("BotanicalName") %>' />
            <br />
                <br />
            <b>Ideal Begin Date:</b>
            <asp:Label ID="IdealBeginDateLabel" runat="server" Text='<%# Eval("IdealBeginDate") %>' />
            <br />
                <br />
            <b>Seed Treatment:</b>
            <asp:Label ID="SeedTreatmentLabel" runat="server" Text='<%# Eval("SeedTreatment") %>' />
            <br />
                <br />
            <b>Sow Period-Post Treat:</b>
            <asp:Label ID="SowPeriodPostTreatLabel" runat="server" Text='<%# Eval("SowPeriodPostTreat") %>' />
            <br />
                <br />
            <b>Sow Date-Post Strat:</b>
            <asp:Label ID="SowDatePostStratLabel" runat="server" Text='<%# Eval("SowDatePostStrat") %>' />
            <br />
                <br />
            <b>Period To Germ:</b>
            <asp:Label ID="PeriodToGermLabel" runat="server" Text='<%# Eval("PeriodToGerm") %>' />
            <br />
                <br />
            <b>Germ Temp:</b>
            <asp:Label ID="GermTempLabel" runat="server" Text='<%# Eval("GermTemp") %>' />
            <br />
                <br />
            <b>Germ Light:</b>
            <asp:Label ID="GermLightLabel" runat="server" Text='<%# Eval("GermLight") %>' />
            <br />
                <br />
            <b>Planting Period:</b>
            <asp:Label ID="PlantingPeriodLabel" runat="server" Text='<%# Eval("PlantingPeriod") %>' />
            <br />
                <br />
            <b>Method:</b>
            <asp:Label ID="MethodLabel" runat="server" Text='<%# Eval("Method") %>' />
            <br />
                <br />
            <b>Notes:</b>
            <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div style="" id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">PlantID:
            <asp:Label ID="PlantIDLabel" runat="server" Text='<%# Eval("PlantID") %>' />
            <br />
            BotanicalName:
            <asp:Label ID="BotanicalNameLabel" runat="server" Text='<%# Eval("BotanicalName") %>' />
            <br />
            IdealBeginDate:
            <asp:Label ID="IdealBeginDateLabel" runat="server" Text='<%# Eval("IdealBeginDate") %>' />
            <br />
            SeedTreatment:
            <asp:Label ID="SeedTreatmentLabel" runat="server" Text='<%# Eval("SeedTreatment") %>' />
            <br />
            SowPeriodPostTreat:
            <asp:Label ID="SowPeriodPostTreatLabel" runat="server" Text='<%# Eval("SowPeriodPostTreat") %>' />
            <br />
            SowDatePostStrat:
            <asp:Label ID="SowDatePostStratLabel" runat="server" Text='<%# Eval("SowDatePostStrat") %>' />
            <br />
            PeriodToGerm:
            <asp:Label ID="PeriodToGermLabel" runat="server" Text='<%# Eval("PeriodToGerm") %>' />
            <br />
            GermTemp:
            <asp:Label ID="GermTempLabel" runat="server" Text='<%# Eval("GermTemp") %>' />
            <br />
            GermLight:
            <asp:Label ID="GermLightLabel" runat="server" Text='<%# Eval("GermLight") %>' />
            <br />
            PlantingPeriod:
            <asp:Label ID="PlantingPeriodLabel" runat="server" Text='<%# Eval("PlantingPeriod") %>' />
            <br />
            Method:
            <asp:Label ID="MethodLabel" runat="server" Text='<%# Eval("Method") %>' />
            <br />
            Notes:
            <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:listview>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
       <div class="PlantWhite">
    <div class="PlantBackGarden">
    <a href='javascript:history.go(-1)'>Back to Plant</a>
</div>
           </div>
</asp:Content>

