<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Plant.aspx.cs" Inherits="Plant" %>

<asp:Content ID="Planthead" ContentPlaceHolderID="head" Runat="Server">
    <title>Plant</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="GardensPage">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT PlantID, CommonName
FROM T_PlantIndex
WHERE PlantID = ?
">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="PlantID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h1>
    <asp:GridView ID="PlantTitle" runat="server" AutoGenerateColumns="False" DataKeyNames="PlantID" DataSourceID="SqlDataSource1" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="PlantID" HeaderText="PlantID" ReadOnly="True" SortExpression="PlantID" Visible="False" />
            <asp:BoundField DataField="CommonName" SortExpression="CommonName" ShowHeader="False" />
        </Columns>
    </asp:GridView>
    </h1>
 </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Panel ID="upload" runat="Server">
        <div class="PlantWhite">
    <div class="PlantUpload">
        <h1>Upload Image Here:</h1>

<input id="FileInput" runat="server" type="file"/>
<asp:Button runat="server" ID="btnUpload" OnClick="btnUploadClick" Text="Upload" />

<asp:Label ID="ErrorLabel" runat="server" Text=""></asp:Label>



        <h1>Set Image for This Page:</h1>

<asp:DropDownList ID="PlantDropDown" runat="server"></asp:DropDownList>

    <asp:Button ID="Button2" runat="server" Text="Submit" value="submit" OnClick="Button2_Click"/>
    
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT PlantID, PlantImage
FROM T_PlantIndex
WHERE PlantID=?">
    <SelectParameters>
        <asp:QueryStringParameter Name="?" QueryStringField="PlantID" />
    </SelectParameters>
        </asp:SqlDataSource>
                </div>
    </div>
        </asp:Panel>
    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
     <div class="PlantWhite">
    <div class="PlantImage">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT PlantID, PlantImage
FROM T_PlantIndex
WHERE PlantID = ?">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="PlantID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="ImageGV2" runat="server" AutoGenerateColumns="False" DataKeyNames="PlantID" DataSourceID="SqlDataSource2" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="PlantID" HeaderText="PlantID" ReadOnly="True" SortExpression="PlantID" Visible="False" />
            <asp:ImageField DataAlternateTextField="PlantImage" DataImageUrlField="PlantImage" DataImageUrlFormatString="images/plantimage/{0}" ShowHeader="False">
            </asp:ImageField>
        </Columns>
    </asp:GridView>
         </div>
    </div>
    </asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
     <div class="PlantWhite">
    <div class="PlantDescription">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT 
PlantID, CommonName, CountryOfOrigin, Folklore, PlantCharacteristics, Culinary, Medical, LikesDislikes, EcosystemServices, Maintenance, Resource
FROM T_PlantIndex
WHERE PlantID = ?" UpdateCommand="UPDATE
T_PlantIndex
SET
CommonName=?, 
CountryOfOrigin=?, 
Folklore=?, 
PlantCharacteristics=?, 
Culinary=?, 
Medical=?, 
LikesDislikes=?, 
EcosystemServices=?, 
Maintenance=?, 
Resource=?
WHERE
PlantID = ?">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="PlantID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="PlantID" DataSourceID="SqlDataSource3" OnItemDataBound="ListView1_ItemDataBound">
        <AlternatingItemTemplate>
            <span style="">
            <asp:Label ID="PlantIDLabel" runat="server" Text='<%# Eval("PlantID") %>' Visible="false"/>
            <br />
            CommonName:
            <asp:Label ID="CommonNameLabel" runat="server" Text='<%# Eval("CommonName") %>' />
            <br />
            CountryOfOrigin:
            <asp:Label ID="CountryOfOriginLabel" runat="server" Text='<%# Eval("CountryOfOrigin") %>' />
            <br />
            Folklore:
            <asp:Label ID="FolkloreLabel" runat="server" Text='<%# Eval("Folklore") %>' />
            <br />
            PlantCharacteristics:
            <asp:Label ID="PlantCharacteristicsLabel" runat="server" Text='<%# Eval("PlantCharacteristics") %>' />
            <br />
            Culinary:
            <asp:Label ID="CulinaryLabel" runat="server" Text='<%# Eval("Culinary") %>' />
            <br />
            Medical:
            <asp:Label ID="MedicalLabel" runat="server" Text='<%# Eval("Medical") %>' />
            <br />
            LikesDislikes:
            <asp:Label ID="LikesDislikesLabel" runat="server" Text='<%# Eval("LikesDislikes") %>' />
            <br />
            EcosystemServices:
            <asp:Label ID="EcosystemServicesLabel" runat="server" Text='<%# Eval("EcosystemServices") %>' />
            <br />
            Maintenance:
            <asp:Label ID="MaintenanceLabel" runat="server" Text='<%# Eval("Maintenance") %>' />
            <br />
            Resource:
            <asp:Label ID="ResourceLabel" runat="server" Text='<%# Eval("Resource") %>' />
<br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <br />
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"SeedIndex.aspx?PlantID=" + Eval("PlantID") %>'>Seed Care</asp:HyperLink>    
            <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">PlantID:
            <asp:Label ID="PlantIDLabel1" runat="server" Text='<%# Eval("PlantID") %>' />
            <br />
            CommonName:
            <asp:TextBox ID="CommonNameTextBox" runat="server" Text='<%# Bind("CommonName") %>' />
            <br />
            CountryOfOrigin:
            <asp:TextBox ID="CountryOfOriginTextBox" runat="server" Text='<%# Bind("CountryOfOrigin") %>' />
            <br />
            Folklore:
            <asp:TextBox ID="FolkloreTextBox" runat="server" Text='<%# Bind("Folklore") %>' />
            <br />
            PlantCharacteristics:
            <asp:TextBox ID="PlantCharacteristicsTextBox" runat="server" Text='<%# Bind("PlantCharacteristics") %>' />
            <br />
            Culinary:
            <asp:TextBox ID="CulinaryTextBox" runat="server" Text='<%# Bind("Culinary") %>' />
            <br />
            Medical:
            <asp:TextBox ID="MedicalTextBox" runat="server" Text='<%# Bind("Medical") %>' />
            <br />
            LikesDislikes:
            <asp:TextBox ID="LikesDislikesTextBox" runat="server" Text='<%# Bind("LikesDislikes") %>' />
            <br />
            EcosystemServices:
            <asp:TextBox ID="EcosystemServicesTextBox" runat="server" Text='<%# Bind("EcosystemServices") %>' />
            <br />
            Maintenance:
            <asp:TextBox ID="MaintenanceTextBox" runat="server" Text='<%# Bind("Maintenance") %>' />
            <br />
            Resource:
            <asp:TextBox ID="ResourceTextBox" runat="server" Text='<%# Bind("Resource") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br />
            <br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">CommonName:
            <asp:TextBox ID="CommonNameTextBox" runat="server" Text='<%# Bind("CommonName") %>' />
            <br />CountryOfOrigin:
            <asp:TextBox ID="CountryOfOriginTextBox" runat="server" Text='<%# Bind("CountryOfOrigin") %>' />
            <br />Folklore:
            <asp:TextBox ID="FolkloreTextBox" runat="server" Text='<%# Bind("Folklore") %>' />
            <br />PlantCharacteristics:
            <asp:TextBox ID="PlantCharacteristicsTextBox" runat="server" Text='<%# Bind("PlantCharacteristics") %>' />
            <br />Culinary:
            <asp:TextBox ID="CulinaryTextBox" runat="server" Text='<%# Bind("Culinary") %>' />
            <br />Medical:
            <asp:TextBox ID="MedicalTextBox" runat="server" Text='<%# Bind("Medical") %>' />
            <br />LikesDislikes:
            <asp:TextBox ID="LikesDislikesTextBox" runat="server" Text='<%# Bind("LikesDislikes") %>' />
            <br />EcosystemServices:
            <asp:TextBox ID="EcosystemServicesTextBox" runat="server" Text='<%# Bind("EcosystemServices") %>' />
            <br />Maintenance:
            <asp:TextBox ID="MaintenanceTextBox" runat="server" Text='<%# Bind("Maintenance") %>' />
            <br />Resource:
            <asp:TextBox ID="ResourceTextBox" runat="server" Text='<%# Bind("Resource") %>' />
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
            <b>Common Name:</b>
            <asp:Label ID="CommonNameLabel" runat="server" Text='<%# Eval("CommonName") %>' />
            <br />
                <br />
            <b>Country Of Origin:</b>
            <asp:Label ID="CountryOfOriginLabel" runat="server" Text='<%# Eval("CountryOfOrigin") %>' />
            <br />
                <br />
            <b>Folklore:</b>
            <asp:Label ID="FolkloreLabel" runat="server" Text='<%# Eval("Folklore") %>' />
            <br />
                <br />
            <b>Plant Characteristics:</b>
            <asp:Label ID="PlantCharacteristicsLabel" runat="server" Text='<%# Eval("PlantCharacteristics") %>' />
            <br />
                <br />
            <b>Culinary:</b>
            <asp:Label ID="CulinaryLabel" runat="server" Text='<%# Eval("Culinary") %>' />
            <br />
                <br />
            <b>Medical:</b>
            <asp:Label ID="MedicalLabel" runat="server" Text='<%# Eval("Medical") %>' />
            <br />
                <br />
            <b>Likes/Dislikes:</b>
            <asp:Label ID="LikesDislikesLabel" runat="server" Text='<%# Eval("LikesDislikes") %>' />
            <br />
                <br />
            <b>Ecosystem Services:</b>
            <asp:Label ID="EcosystemServicesLabel" runat="server" Text='<%# Eval("EcosystemServices") %>' />
            <br />
                <br />
            <b>Maintenance:</b>
            <asp:Label ID="MaintenanceLabel" runat="server" Text='<%# Eval("Maintenance") %>' />
            <br />
             <br />
            <b>Resource:</b>
            <asp:Label ID="ResourceLabel" runat="server" Text='<%# Eval("Resource") %>' />

<br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <br />
                <br />
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"SeedIndex.aspx?PlantID=" + Eval("PlantID") %>'>Seed Care</asp:HyperLink>
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">PlantID:
            <asp:Label ID="PlantIDLabel" runat="server" Text='<%# Eval("PlantID") %>' />
            <br />
            CommonName:
            <asp:Label ID="CommonNameLabel" runat="server" Text='<%# Eval("CommonName") %>' />
            <br />
            CountryOfOrigin:
            <asp:Label ID="CountryOfOriginLabel" runat="server" Text='<%# Eval("CountryOfOrigin") %>' />
            <br />
            Folklore:
            <asp:Label ID="FolkloreLabel" runat="server" Text='<%# Eval("Folklore") %>' />
            <br />
            PlantCharacteristics:
            <asp:Label ID="PlantCharacteristicsLabel" runat="server" Text='<%# Eval("PlantCharacteristics") %>' />
            <br />
            Culinary:
            <asp:Label ID="CulinaryLabel" runat="server" Text='<%# Eval("Culinary") %>' />
            <br />
            Medical:
            <asp:Label ID="MedicalLabel" runat="server" Text='<%# Eval("Medical") %>' />
            <br />
            LikesDislikes:
            <asp:Label ID="LikesDislikesLabel" runat="server" Text='<%# Eval("LikesDislikes") %>' />
            <br />
            EcosystemServices:
            <asp:Label ID="EcosystemServicesLabel" runat="server" Text='<%# Eval("EcosystemServices") %>' />
            <br />
            Maintenance:
            <asp:Label ID="MaintenanceLabel" runat="server" Text='<%# Eval("Maintenance") %>' />
            <br />
            Resource:
            <asp:Label ID="ResourceLabel" runat="server" Text='<%# Eval("Resource") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <br />

            </span>
        </SelectedItemTemplate>
    </asp:ListView>
          </div>
    </div>
    </asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">
      <div class="PlantWhite">
    <div class="PlantBackGarden">
    <a href='javascript:history.go(-1)'>Back to Garden</a>
 </div>
    </div>
</asp:Content>