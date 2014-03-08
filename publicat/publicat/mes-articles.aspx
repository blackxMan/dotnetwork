<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="mes-articles.aspx.cs" Inherits="publicat.mes_articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="breadcrumbHolder" runat="server">
    <li>
        <i class="icon-home home-icon"></i>
		<a href="#">Article</a>
		<span class="divider">
			<i class="icon-angle-right arrow-icon"></i>
		</span>
    </li>
    <li class="active">Mes articles</li>
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
				<a href="ajouter-article.aspx">
					<i class="icon-double-angle-right"></i>
					Nouveaux Articles
				</a>
			</li>
			<li>
				<a href="mes-articles.aspx">
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
                <asp:TemplateField>
                     <ItemTemplate>
                        <asp:HyperLink runat="server" Text='<%# Eval("titre") %>' target="_new" NavigateUrl='<%# "uploads/articles/" + Eval("document") %>'></asp:HyperLink>
                     </ItemTemplate>
                 </asp:TemplateField>
                <asp:BoundField DataField="desciption" />
                <asp:TemplateField>
                     <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# getStatusText(Convert.ToBoolean(Eval("etat"))) %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                <asp:BoundField DataField="justification" />
                <asp:BoundField DataField="date_creation" />
            </columns>
        </asp:GridView> 

        
    </form>
    
</asp:Content>
<asp:Content ID="inlinejsContent" ContentPlaceHolderID="inlinejsHolder" runat="server">
    <script type="text/javascript">
        $(function () {
           // gridview adaptation
            $('#contentHolder_grid tbody').before('<thead><tr><th>Titre</th><th>Description</th><th>Etat</th><th>Justification</th><th>Date</th></tr></thead>');
            
            var oTable1 = $('#contentHolder_grid').dataTable();
            
        })
		</script>
</asp:Content>

