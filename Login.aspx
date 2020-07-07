<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="loginhead" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="LoginSection">

    <h2>Administrative Login</h2>
    <asp:Label ID="Label1" runat="server" Text="User Name:   "></asp:Label>
    <asp:TextBox ID="userNameTxtBox" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="UserNameValidator" runat="server" ControlToValidate="userNameTxtBox" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Underline="True" ForeColor="Red" Display="Dynamic">You must enter a user name!</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Password:   "></asp:Label>
    <asp:TextBox ID="passwordTxtBox" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="passwordTxtBox" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Underline="True" ForeColor="Red" Display="Dynamic">You must enter a password!</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="loginButton_Click" />
    <br />
    <asp:Label ID="LabelUserResults" runat="server" Visible="False"></asp:Label>
    <br />
    <br />
    
  </section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>

