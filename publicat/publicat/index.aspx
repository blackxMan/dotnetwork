
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="publicat.index" %>
<%@ Import Namespace="publicat.Data" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="dnTable">
		<ul id="dtItems">
            <% foreach(DataRow dr in dtArticles.Rows){%>
			<li data-id="<%= dr["document"] %>">
				<div class="clickable">
					<img src="uploads/images/<%=  dr["id"]+".jpg" %>" alt="">
					<div class="ct">
						<h3><%=  dr["titre"] %></h3>
						<p><%=  dr["desciption"] %></p>
					</div>
				</div>
			</li>
            <%} %>
		</ul>
		<div class="holder"></div>
	</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navrightHolder" runat="server">
    <!-- Categories -->
	<aside class="widget widget_categories">
		<h3 class="widget_title">Categories</h3>
		<ul id="rubrique">
            <% foreach(DataRow dr in dtThemes.Rows){%>
			<li class="cat-item"><a href="<%= dr["libelle"].ToString() %>"><%= dr["libelle"].ToString() %></a></li>
            <%} %>
		</ul>
		<div class="holder"></div>
	</aside>
	<!-- /Categories -->
</asp:Content>
