<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="grid-example.aspx.cs" Inherits="publicat.grid_example" %>
<asp:Content ID="Content1" ContentPlaceHolderID="breadcrumbHolder" runat="server">
    <li>
        <i class="icon-home home-icon"></i>
		<a href="#">Article</a>
		<span class="divider">
			<i class="icon-angle-right arrow-icon"></i>
		</span>
    </li>
    <li class="active">Ajouter</li>
</asp:Content>
<asp:Content ID="tp1" runat="server" ContentPlaceHolderID="pageTitleHolder">
    <h1>
		Article
		<small>
			<i class="icon-double-angle-right"></i>
			Ajouter un nouveau article
		</small>
	</h1>
</asp:Content>
<asp:Content ID="mainMenu" runat="server" ContentPlaceHolderID="mainMenuHolder">
    <li class="active">
		<a href="#">
			<i class="icon-dashboard"></i>
			<span class="menu-text"> Autheur </span>
		</a>
	</li>

	<li>
		<a href="#" class="dropdown-toggle">
			<i class="icon-edit"></i>
			<span class="menu-text"> Articles </span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li>
				<a href="list-article-new.aspx">
					<i class="icon-double-angle-right"></i>
					Nouveaux Articles
				</a>
			</li>
			<li>
				<a href="wysiwyg.html">
					<i class="icon-double-angle-right"></i>
					Historique des articles
				</a>
			</li>
		</ul>
	</li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <form class="form-horizontal" runat="server">
	        
        <asp:GridView ID="grid" runat="server"  AutoGenerateColumns="false" ShowHeader="False" CssClass="table table-striped table-bordered table-hover">
            <columns>
                <asp:BoundField DataField="checkbox" htmlencode="false" ControlStyle-BorderWidth="0"/>
                <asp:BoundField DataField="firstname"/>
                <asp:BoundField DataField="lastname"/>
            </columns>
        </asp:GridView> 

        
    </form>
    
</asp:Content>
<asp:Content ID="inlinejsContent" ContentPlaceHolderID="inlinejsHolder" runat="server">
    <script type="text/javascript">
        $(function () {
           // gridview adaptation
            $('#contentHolder_grid tbody').before('<thead><tr><th class="center"></th><th>Autheur</th><th>Correcteur</th><th></th></tr></thead>');
            
            var oTable1 = $('#contentHolder_grid').dataTable();
            
        })
		</script>
</asp:Content>

