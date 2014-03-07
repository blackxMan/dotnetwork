<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="publicat.index" %>
<%@ Import Namespace ="publicat.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="breadcrumbs" runat="server">
    <li class="active">home</li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form action="#" runat="server">
    hello!!
        <%  int[] n1 = new int[2] { 1, 1 };
            int[] n2 = new int[2] { 2, 0 };
            List<int[]> l = new List<int[]>();
            l.Add(n1);
            l.Add(n2);
            //string s;
            //int z = 0;
            foreach (int[] a in l)
            {%> 
               <%= a[0] %>
            <%}%>
            
            
        </form>
</asp:Content>
