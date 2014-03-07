<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="authentication-control.ascx.cs" Inherits="publicat.authentication_control" %>
<div id="havAcount">
	<h2>Mon Compte</h2>
	<p>Vous &ecirc;tes d&egrave;jà inscrit ?<br/>S'il vous plaît veuillez connecter.</p>
	<fieldset>
		<form method="post" action="#" runat="server">
			<div>
				<label for="FUsername">Email <span>(required)</span></label>
				<input type="text" id="FUsername" class="FUsername" name="email"/> 
			</div>
			<div>
				<label for="FPassword">Password <span>(required)</span></label>
				<input type="text" id="FPassword" class="FPassword" name="password"/> 
				<input type="submit" id="flok" value="GO"/>
			</div>
			<a href="#" class="forgetpass">imposible d'accéder à mon compte.</a>
									
		</form>
	</fieldset>
</div>
<div id="notYet">
	<h2>Est-ce votre première visite ?</h2>
	<p>Inscrivez-vous maintenant.</p>
	<a href="#">go</a>
</div>