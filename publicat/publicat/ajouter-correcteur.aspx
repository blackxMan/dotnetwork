<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="ajouter-correcteur.aspx.cs" Inherits="publicat.ajouter_correcteur" %>
<asp:Content ID="Content1" ContentPlaceHolderID="breadcrumbHolder" runat="server">
    <li>
        <i class="icon-home home-icon"></i>
		<a href="#">Correcteur</a>
		<span class="divider">
			<i class="icon-angle-right arrow-icon"></i>
		</span>
    </li>
    <li class="active">Ajouter</li>
</asp:Content>
<asp:Content ID="tp1" runat="server" ContentPlaceHolderID="pageTitleHolder">
    <h1>
		Correcteur
		<small>
			<i class="icon-double-angle-right"></i>
			Ajouter un nouveau correcteur
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
		<div class="control-group">
            <asp:Label ID="Label1" AssociatedControlID="nom" CssClass="control-label" runat="server">Nom de correcteur</asp:Label>
			<div class="controls">
                <asp:TextBox ID="nom" runat="server" placeholder=""/>
                <asp:RequiredFieldValidator  Text="*" ID="RequiredFieldValidator1" ControlToValidate="nom" runat="server" ErrorMessage="Vous devez renseigner le nom de correcteur"></asp:RequiredFieldValidator>
			</div>
		</div>
        <div class="control-group">
			<asp:Label ID="Label2" AssociatedControlID="prenom" CssClass="control-label" runat="server">Prenom de Correcteur</asp:Label>

			<div class="controls">
                <asp:TextBox runat="server" ID="prenom" placeholder="" />
			    <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator2" ControlToValidate="prenom" runat="server" ErrorMessage="Vous devez renseigner le prenom de correcteur"></asp:RequiredFieldValidator>
            </div>
		</div>
        <div class="control-group">
			<asp:Label ID="Label7" AssociatedControlID="email" CssClass="control-label" runat="server">Email de Correcteur</asp:Label>

			<div class="controls">
                <asp:TextBox TextMode="Email" runat="server" ID="email" placeholder="example@gmail.com" />
			    <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator6" ControlToValidate="email" runat="server" ErrorMessage="Vous devez renseigner l'email de correcteur"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Text="*" ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="L'email n'est pas correct" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
		</div>
        <div class="control-group">
			<asp:Label ID="Label8" AssociatedControlID="password" CssClass="control-label" runat="server">Mot de passe</asp:Label>

			<div class="controls">
                <asp:TextBox runat="server" TextMode="Password" ID="password" placeholder="****" />
			    <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidator7" ControlToValidate="password" runat="server" ErrorMessage="Vous devez renseigner le mot de passe de correcteur"></asp:RequiredFieldValidator>
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

