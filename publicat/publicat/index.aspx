<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="publicat.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="breadcrumbs" runat="server">
    <li class="active">home</li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form action="#" runat="server">
    hello!!<asp:Button ID="Button1" runat="server" Text="flsdjflksdfjls" /><%= publicat.test.Data.getTitle() %>
        </form>
</asp:Content>
