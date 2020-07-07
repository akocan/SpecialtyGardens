<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddPlant.aspx.cs" Inherits="AddPlant" %>

<asp:Content ID="addplanthead" ContentPlaceHolderID="head" Runat="Server">
    <title>Add Plant</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="addplantheader">
    <h1>Add a Plant to Your Database Here:</h1>
        </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="AddPlantSection">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" InsertCommand="INSERT INTO
T_PlantIndex
(CommonName, CountryOfOrigin, Folklore, PlantCharacteristics, Culinary, Medical, LikesDislikes, EcosystemServices, Maintenance, Resource, BotanicalName, IdealBeginDate, SeedTreatment, SowPeriodPostTreat, SowDatePostStrat, PeriodToGerm, GermTemp, GermLight, PlantingPeriod, Method, Notes)
VALUES
(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT 
CommonName, CountryOfOrigin, Folklore, PlantCharacteristics, Culinary, Medical, LikesDislikes, EcosystemServices, Maintenance, Resource, BotanicalName, IdealBeginDate, SeedTreatment, SowPeriodPostTreat, SowDatePostStrat, PeriodToGerm, GermTemp, GermLight, PlantingPeriod, Method, Notes
FROM
T_PlantIndex" OnInserted="SqlDataSource1_Inserted"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="58px" CellSpacing="5" Width="550px" AutoGenerateRows="False" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <Fields>
            <asp:BoundField DataField="CommonName" HeaderText="Common Name:" SortExpression="CommonName" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            <ItemStyle Width="500px" />
            </asp:BoundField>
            <asp:BoundField DataField="CountryOfOrigin" HeaderText="Country Of Origin:" SortExpression="CountryOfOrigin" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Folklore" HeaderText="Folklore:" SortExpression="Folklore" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="PlantCharacteristics" HeaderText="Plant Characteristics:" SortExpression="PlantCharacteristics" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Culinary" HeaderText="Culinary:" SortExpression="Culinary" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Medical" HeaderText="Medical:" SortExpression="Medical" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="LikesDislikes" HeaderText="Likes/Dislikes:" SortExpression="LikesDislikes" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="EcosystemServices" HeaderText="Ecosystem Services:" SortExpression="EcosystemServices" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Maintenance" HeaderText="Maintenance:" SortExpression="Maintenance" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Resource" HeaderText="Resource:" SortExpression="Resource" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="BotanicalName" HeaderText="Botanical Name:" SortExpression="BotanicalName" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="IdealBeginDate" HeaderText="Ideal Begin Date:" SortExpression="IdealBeginDate" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="SeedTreatment" HeaderText="Seed Treatment:" SortExpression="SeedTreatment" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="SowPeriodPostTreat" HeaderText="Sow Period-Post Treat:" SortExpression="SowPeriodPostTreat" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="SowDatePostStrat" HeaderText="Sow Date-Post Strat:" SortExpression="SowDatePostStrat" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="PeriodToGerm" HeaderText="Period To Germ:" SortExpression="PeriodToGerm" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="GermTemp" HeaderText="Germ Temp:" SortExpression="GermTemp" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="GermLight" HeaderText="Germ Light:" SortExpression="GermLight" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="PlantingPeriod" HeaderText="Planting Period:" SortExpression="PlantingPeriod" >
            <ControlStyle Width="300px" />
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Method" HeaderText="Method:" SortExpression="Method" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Notes" HeaderText="Notes:" SortExpression="Notes" >
            <ControlStyle Height="100px" Width="300px" />
            <HeaderStyle VerticalAlign="Top" Width="200px" />
            </asp:BoundField>
            <asp:CommandField ShowInsertButton="True" InsertText="Add This Plant to Database" ShowCancelButton="False">
            <ControlStyle BorderColor="White" BorderStyle="Solid" BorderWidth="5px" />
            <HeaderStyle Width="500px" />
            <ItemStyle BorderColor="White" BorderStyle="Solid" BorderWidth="5px" HorizontalAlign="Right"/>
            </asp:CommandField>
        </Fields>
    </asp:DetailsView>
        <p>Please refresh page to update dropdown.</p>
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div class="optionsAddPlant">
        <h1>Select Plant and Garden Locations:</h1>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CommonName" DataValueField="PlantID" AutoPostBack="True"></asp:DropDownList>
        
 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT [PlantID], [CommonName] FROM [T_PlantIndex] ORDER BY [CommonName]"></asp:SqlDataSource>
        <br />
        <br />
 <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="GardenName" DataValueField="GardenID"></asp:CheckBoxList>
 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT [GardenID], [GardenName] FROM [T_GardenIndex] ORDER BY [GardenName]"></asp:SqlDataSource>
    <br />
 <asp:Button ID="Submit" runat="server" OnClick="Button1_Click" Text="Submit" />
 <asp:Label ID="Label1" runat="server" Text="" Visible="True"></asp:Label>
        <asp:Label ID="ErrorLabel" runat="server" Text="Plant could not be added to Garden, possibly Plant is currrently in chosen Garden." Visible="False"></asp:Label>
        </div>
</asp:Content>

