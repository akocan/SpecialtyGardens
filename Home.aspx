<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="homehead" ContentPlaceHolderID="head" Runat="Server">
    <title>Home</title>
</asp:Content>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="HomePage">
    <asp:Label class="warningLabel" ID="warningLabel" runat="server" Text="*Please enter text and upload one section at a time, new text will not save in one field if 'Upload' is clicked on another." CssClass="warningLabel"></asp:Label>

   <div class="Events">
    <h2>Events</h2>
       <div class="divider"></div>
       <img src="images/backgroundimages/cacti-gardening-grow-707194.jpg" alt="Potted Plants">
       <div class="divider"></div>
    <p>
        <asp:TextBox ID="eventTextBox" runat="server" Height="225px" TextMode="MultiLine" Width="225px"></asp:TextBox>
        <asp:Button ID="eventButton" runat="server" OnClick="eventButton_Click" Text="Update" value="Submit"/>
        <asp:Label ID="eventLabel" runat="server" Text="Label"></asp:Label>
    </p>
   </div>

   <div class="News">
    <h2>News</h2>
       <div class="divider"></div>
       <img src="images/backgroundimages/beautiful-bloom-blooming-414160.jpg" alt="Garden Path">
       <div class="divider"></div>
    <p>
        <asp:TextBox ID="newsTextBox" runat="server" Height="225px" TextMode="MultiLine" Width="225px"></asp:TextBox>
        <asp:Button ID="newsButton" runat="server" Text="Update" value="Submit" OnClick="newsButton_Click"/>
        <asp:Label ID="newsLabel" runat="server" Text="Label"></asp:Label>
    </p>
   </div>

   <div class="About">
    <h2>About</h2>
       <div class="divider"></div>
       <img src="images/backgroundimages/community-feet-friends-53958.jpg" alt="Helping Hands">
       <div class="divider"></div>
    <p>
        <asp:TextBox ID="aboutTextBox" runat="server" Height="225px" TextMode="MultiLine" Width="225px"></asp:TextBox>
        <asp:Button ID="aboutButton" runat="server" Text="Update" value="Submit" OnClick="aboutButton_Click"/>
        <asp:Label ID="aboutLabel" runat="server" Text="Label"></asp:Label>
    </p>
   </div> 

</div> 
            
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
 
</asp:Content>

    

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">
</asp:Content>