
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="publicat.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="dnTable">
		<ul id="dtItems">
			<li data-id="">
				<div class="clickable">
					<img src="front-assets/images/2.jpg" alt="">
					<div class="ct">
						<h3>Php is right space</h3>
						<p>Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de ...</p>
					</div>
				</div>
			</li>
		</ul>
		<div class="holder"></div>
	</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navrightHolder" runat="server">
    <!-- Categories -->
	<aside class="widget widget_categories">
		<h3 class="widget_title">Categories</h3>
		<ul id="rubrique">
			<li class="cat-item"><a href="#">Scienece naturel</a></li>
            <li class="cat-item"><a href="#">Scienece naturel</a></li>
            <li class="cat-item"><a href="#">Scienece naturel</a></li>
            <li class="cat-item"><a href="#">Scienece naturel</a></li>
            <li class="cat-item"><a href="#">Scienece naturel</a></li>
            <li class="cat-item"><a href="#">Scienece naturel</a></li>
            <li class="cat-item"><a href="#">Scienece naturel</a></li>
            <li class="cat-item"><a href="#">Scienece naturel</a></li>
		</ul>
		<div class="holder"></div>
	</aside>
	<!-- /Categories -->
</asp:Content>
