<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="listes-correcteurs.aspx.cs" Inherits="publicat.liste_correcteurs" %>
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
			Listes de mes articles
		</small>
	</h1>
</asp:Content>
<asp:Content ID="mainMenu" runat="server" ContentPlaceHolderID="mainMenuHolder">
    <li class="active">
		<a href="#">
			<i class="icon-dashboard"></i>
			<span class="menu-text"> Administrateur </span>
		</a>
	</li>

	<li>
		<a href="#" class="dropdown-toggle">
			<i class="icon-edit"></i>
			<span class="menu-text"> Correcteurs </span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li>
				<a href="listes-correcteurs.aspx">
					<i class="icon-double-angle-right"></i>
					Listes des correcteurs
				</a>
			</li>
			<li>
				<a href="ajouter-correcteur.aspx">
					<i class="icon-double-angle-right"></i>
					Ajouter un Correcteur
				</a>
			</li>
		</ul>
	</li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <form class="form-horizontal" runat="server">
	        
        <asp:GridView ID="grid" runat="server"  AutoGenerateColumns="false" ShowHeader="False" CssClass="table table-striped table-bordered table-hover">
            <columns>
                <asp:BoundField DataField="prenom_corr" />
                <asp:BoundField DataField="nom_corr" />
                <asp:BoundField DataField="email_corr" />
                <asp:BoundField DataField="somme" />
            </columns>
        </asp:GridView> 

        
    </form>
    
</asp:Content>
<asp:Content ID="inlinejsContent" ContentPlaceHolderID="inlinejsHolder" runat="server">
    <script type="text/javascript">
        $(function () {
           // gridview adaptation
            $('#contentHolder_grid tbody').before('<thead><tr><th>prenom</th><th>nom</th><th>Email</th><th>Nbr Articles Corrige</th></tr></thead>');
            
            var oTable1 = $('#contentHolder_grid').dataTable();
            
        })
		</script>
</asp:Content>

