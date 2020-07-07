<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Gardens.aspx.cs" Inherits="Gardens" %>



<asp:Content ID="Gardenhead" ContentPlaceHolderID="head" Runat="Server">
    <title>Garden</title>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="GardensPage">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT GardenId, GardenName
FROM T_GardenIndex
WHERE T_GardenIndex.GardenId = ?
">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="?" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h1>
    <asp:GridView ID="GardenTitle" runat="server" AutoGenerateColumns="False" DataKeyNames="GardenId" DataSourceID="SqlDataSource2" ShowHeader="False" UseAccessibleHeader="False">
        <Columns>
            <asp:BoundField DataField="GardenName" SortExpression="GardenName" >
            <HeaderStyle Height="1px" />
            </asp:BoundField>
        </Columns>
        <SortedAscendingHeaderStyle Height="1px" />
        <SortedDescendingHeaderStyle Height="1px" />
    </asp:GridView>
    </h1>
    </div>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <div class="GardensPage">
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT GardenId, GardenImage
FROM T_GardenIndex
WHERE T_GardenIndex.GardenId=?">
             <SelectParameters>
                 <asp:QueryStringParameter Name="?" QueryStringField="ID" />
             </SelectParameters>
         </asp:SqlDataSource>
        <asp:GridView ID="ImageGV" runat="server" AutoGenerateColumns="False" DataKeyNames="GardenId" DataSourceID="SqlDataSource3" ShowHeader="False" >
            <Columns>
                <asp:BoundField DataField="GardenId" ReadOnly="True" SortExpression="GardenId" Visible="False" />
                <asp:ImageField DataAlternateTextField="GardenImage" DataImageUrlField="GardenImage" DataImageUrlFormatString="images/gardenimage/{0}">
                </asp:ImageField>
            </Columns>
         </asp:GridView>
</div>
</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <asp:Panel ID="upload" Runat="Server">
        <div class="PlantWhite">
        <div class="PlantUpload">
    <h1>Upload Image Here:</h1>

<input id="FileInput" runat="server" type="file"/>
<asp:Button runat="server" ID="btnUpload" OnClick="btnUploadClick" Text="Upload" />

<asp:Label ID="ErrorLabel" runat="server" Text=""></asp:Label>



        <h1>Set Image for This Page:</h1>

<asp:DropDownList ID="GardenDropDown" runat="server"></asp:DropDownList>

    <asp:Button ID="Button1" runat="server" Text="Submit" value="submit" OnClick="Button1_Click"/>

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT GardenImage
FROM T_GardenIndex
WHERE GardenID = ?
" UpdateCommand="UPDATE
T_GardenIndex
SET
GardenImage=?
WHERE
GardenID = ?">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="GardenID" />
        </SelectParameters>
    </asp:SqlDataSource>
            </div>
            </div>
  </asp:Panel>
</asp:Content>




<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
    <div class="GardensPage">
    <asp:Label class="warningLabel" ID="warningLabel" runat="server" Text="*Please enter text and upload one section at a time, new text will not save in one field if 'Upload' is clicked on another." CssClass="warningLabel"></asp:Label>
    <div class="description">
    <h3>Description</h3>
    <p>
        <asp:TextBox ID="descriptionTextBox" runat="server" Height="200px" TextMode="MultiLine" Width="250px"></asp:TextBox>
        <asp:Button ID="descriptionButton" runat="server" OnClick="descriptionButton_Click" Text="Update" value="Submit"/>
        <asp:Label ID="descriptionLabel" runat="server" Text="Label"></asp:Label>
    </p>
</div>
        <div class="location">
    <h3>Location</h3>
    <p>
        <asp:TextBox ID="locationTextBox" runat="server" Height="225px" TextMode="MultiLine" Width="225px"></asp:TextBox>
        <asp:Button ID="locationButton" runat="server" OnClick="locationButton_Click" Text="Update" value="Submit"/>
        <asp:Label ID="locationLabel" runat="server" Text="Label"></asp:Label>
    </p>
        </div>
        </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">
    <div class="GardensPage">
    <h4>
        Plants To See Here:
    </h4>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GardenConnectionString %>" ProviderName="<%$ ConnectionStrings:GardenConnectionString.ProviderName %>" SelectCommand="SELECT PlantID, CommonName 
FROM T_GardenIndex, T_PlantIndex, T_Garden_Plant
WHERE T_Garden_Plant.PlantID_FK = T_PlantIndex.PlantID
AND T_Garden_Plant.GardenID_FK = T_GardenIndex.GardenID
AND T_GardenIndex.GardenID = ?" DeleteCommand="DELETE FROM
T_Garden_Plant
WHERE
PlantID_FK = ?">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4" GroupItemCount="3" DataKeyNames="PlantID" OnItemDataBound="ListView1_ItemDataBound">

        <AlternatingItemTemplate>
            <td runat="server" style="">

                <asp:Label ID="PlantIDLabel" runat="server" Text='<%# Eval("PlantID") %>' Visible="false"/>

                <br />
                <asp:HyperLink ID="CommonNameLink" runat="server" Text='<%# Eval("CommonName") %>' NavigateUrl='<%#"Plant.aspx?PlantID=" + Eval("PlantID") %>'/>
                <%--<asp:Label ID="CommonNameLabel" runat="server" Text='<%# Eval("CommonName") %>' />--%> 
                <br />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <br />
            </td>
        </AlternatingItemTemplate>

        <EditItemTemplate>
            <td runat="server" style="">
                PlantID:
                <asp:Label ID="PlantIDLabel1" runat="server" Text='<%# Eval("PlantID") %>' />
                <br />
                CommonName:
                <asp:TextBox ID="CommonNameTextBox" runat="server" Text='<%# Bind("CommonName") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
                </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">
                CommonName:
                <asp:TextBox ID="CommonNameTextBox" runat="server" Text='<%# Bind("CommonName") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
                </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="">

                <asp:Label ID="PlantIDLabel" runat="server" Text='<%# Eval("PlantID") %>' Visible="false"/>

                <br />
                <asp:HyperLink ID="CommonNameLink" runat="server" Text='<%# Eval("CommonName") %>' NavigateUrl='<%#"Plant.aspx?PlantID=" + Eval("PlantID") %>'/>
                <%--<asp:Label ID="CommonNameLabel" runat="server" Text='<%# Eval("CommonName") %>' />--%>
                <br />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">
                PlantID:
                <asp:Label ID="PlantIDLabel" runat="server" Text='<%# Eval("PlantID") %>' />
                <br />CommonName:
                <asp:Label ID="CommonNameLabel" runat="server" Text='<%# Eval("CommonName") %>' />
                <br />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
        </div>
    </asp:Content>