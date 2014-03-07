<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="ajouter-article.aspx.cs" Inherits="publicat.ajouter_article" %>
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
		<div class="control-group">
            <asp:Label ID="Label1" AssociatedControlID="titre" CssClass="control-label" runat="server">Titre d'article</asp:Label>
			<div class="controls">
                <asp:TextBox ID="titre" runat="server" placeholder="Titre d'article"/>
                <asp:RequiredFieldValidator  Text="*" ID="RequiredFieldValidator1" ControlToValidate="titre" runat="server" ErrorMessage="Vous devez renseigner le titre "></asp:RequiredFieldValidator>
			</div>
		</div>
        <div class="control-group">
			<asp:Label ID="Label2" AssociatedControlID="description" CssClass="control-label" runat="server">Description d'article</asp:Label>

			<div class="controls">
                <asp:TextBox TextMode="MultiLine" runat="server" ID="description" data-maxlength="50" placeholder="votre description sur l'article ici" />
			    <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator2" ControlToValidate="description" runat="server" ErrorMessage="Vous devez renseigne la description"></asp:RequiredFieldValidator>
            </div>
		</div>
        <div class="control-group">
			<asp:Label ID="Label3" AssociatedControlID="theme" CssClass="control-label" runat="server">Theme d'article</asp:Label>

			<div class="controls">
				
                <asp:DropDownList runat="server" ID="theme" CssClass="chzn-select" data-placeholder="Choisir le theme">
                    <asp:ListItem Value="1">Science Naturel</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator  Text="*" ID="RequiredFieldValidator3" ControlToValidate="theme" runat="server" ErrorMessage="Vous devez renseigne le theme"></asp:RequiredFieldValidator>
			</div>
		</div>
        <div class="control-group">
			<asp:Label ID="Label4" AssociatedControlID="auteurs" CssClass="control-label" runat="server">Auteurs associes</asp:Label>

			<div class="controls">
                <asp:TextBox ID="auteurs" runat="server" value="nom prenom" placeholder="Introduire les auteurs"/>
			</div>
		</div>
        <div class="control-group">
			<asp:Label ID="Label5" AssociatedControlID="cover" CssClass="control-label" runat="server">Couverture</asp:Label>

			<div class="controls">
                <asp:FileUpload ID="cover" runat="server" placeholder="choisir votre couverture" />
                <asp:RegularExpressionValidator Text="*" ID="RegularExpressionValidator1" runat="server" ControlToValidate="cover" ErrorMessage="seule les extentions jpg/png sont supporte" ValidationExpression="[a-zA-Z0_9].*\b(.jpeg|.JPEG|.jpg|.JPG||.png|.PNG)\b"></asp:RegularExpressionValidator>
			    <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator5" ControlToValidate="cover" runat="server" ErrorMessage="Vous devez rensigner la photo de couverture"></asp:RequiredFieldValidator>
            </div>
		</div>
        <div class="control-group">
			<asp:Label ID="Label6" AssociatedControlID="document" CssClass="control-label" runat="server">Document</asp:Label>

			<div class="controls">
				<asp:FileUpload ID="document" runat="server" placeholder="choisir votre article au format (zip/rar)" />
			    <asp:RegularExpressionValidator Text="*" ID="RegularExpressionValidator2" runat="server" ControlToValidate="document" ErrorMessage="seule les extentions zip/rar sont supporte" ValidationExpression="[a-zA-Z0_9].*\b(.rar|.RAR|.zip|.ZIP)\b"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator4" ControlToValidate="document" runat="server" ErrorMessage="Vous devez rensigner votre document"></asp:RequiredFieldValidator>
            </div>
		</div>

        <asp:ValidationSummary ID="ValidationSummary1" HeaderText="" CssClass="alert alert-error" DisplayMode="BulletList" EnableClientScript="true" runat="server"/>

        <div class="form-actions">
            <asp:Button id="submit" runat="server" Text="Valide" CssClass="btn btn-info" OnClick="submit_Click">

            </asp:button>
		</div>
        
        
    </form>
    
</asp:Content>
<asp:Content ID="inlinejsContent" ContentPlaceHolderID="inlinejsHolder" runat="server">
    <script type="text/javascript">
        $(function () {
            $(".chzn-select").chosen();

            //we could just set the data-provide="tag" of the element inside HTML, but IE8 fails!
            var tag_input = $('#contentHolder_auteurs');
            if (!(/msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase())))
                tag_input.tag({ placeholder: tag_input.attr('placeholder') });
            else {
                //display a textarea for old IE, because it doesn't support this plugin or another one I tried!
                tag_input.after('<textarea id="' + tag_input.attr('id') + '" name="' + tag_input.attr('name') + '" rows="3">' + tag_input.val() + '</textarea>').remove();
                //$('#form-field-tags').autosize({append: "\n"});
            }

            
            
        })
		</script>
</asp:Content>

