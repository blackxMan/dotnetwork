<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="list-article-new.aspx.cs" Inherits="publicat.list_article_new" %>
<asp:Content ID="Content1" ContentPlaceHolderID="breadcrumbHolder" runat="server">
    <li>
        <i class="icon-home home-icon"></i>
		<a href="#">Article</a>
		<span class="divider">
			<i class="icon-angle-right arrow-icon"></i>
		</span>
    </li>
    <li class="active">Nouveaux</li>
</asp:Content>
<asp:Content ID="tp1" runat="server" ContentPlaceHolderID="pageTitleHolder">
    <h1>
		Article
		<small>
			<i class="icon-double-angle-right"></i>
			Nouveaux
		</small>
	</h1>
</asp:Content>
<asp:Content ID="mainMenu" runat="server" ContentPlaceHolderID="mainMenuHolder">
    <li class="active">
		<a href="#">
			<i class="icon-dashboard"></i>
			<span class="menu-text"> Administration </span>
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
				<a href="#">
					<i class="icon-double-angle-right"></i>
					Articles publier
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
    <div class="row-fluid">
		<h3 class="header smaller lighter blue">Liste des nouveaux articles</h3>
		<div class="table-header">
			Derniere article postule sur le site
		</div>

		<table id="article-grid" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center">
						<label>
							<input type="checkbox" />
							<span class="lbl"></span>
						</label>
					</th>
					<th>Titre</th>
					<th class="hidden-480">Theme</th>

					<th class="hidden-phone">
						<i class="icon-time bigger-110 hidden-phone"></i>
						Date
					</th>
					<th class="hidden-480">Autheur</th>
                    <th class="hidden-480">Participant</th>
					<th></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td class="center">
						<label>
							<input type="checkbox" />
							<span class="lbl"></span>
						</label>
					</td>

					<td>
						<a href="#">Hadoop new aproche</a>
					</td>
					<td class="hidden-480">Informatique</td>
					<td class="hidden-phone">2013-09-15</td>

					<td class="hidden-480">
						Fayssal tahtoub
					</td>
                    <td>3</td>
					<td class="td-actions">
						<div class="hidden-phone visible-desktop action-buttons">
							<a class="blue" href="#">
								<i class="icon-zoom-in bigger-130"></i>
							</a>

							<a class="green" href="#">
								<i class="icon-check bigger-130"></i>
							</a>

							<a class="red" href="#">
								<i class="icon-trash bigger-130"></i>
							</a>
						</div>

						<div class="hidden-desktop visible-phone">
							<div class="inline position-relative">
								<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
									<i class="icon-caret-down icon-only bigger-120"></i>
								</button>

								<ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">
									<li>
										<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
											<span class="blue">
												<i class="icon-zoom-in bigger-120"></i>
											</span>
										</a>
									</li>

									<li>
										<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
											<span class="green">
												<i class="icon-edit bigger-120"></i>
											</span>
										</a>
									</li>

									<li>
										<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
											<span class="red">
												<i class="icon-trash bigger-120"></i>
											</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</td>
				</tr>		
			</tbody>
		</table>
	</div>
</asp:Content>
<asp:Content ID="inlinejsContent" ContentPlaceHolderID="inlinejsHolder" runat="server">
    <script type="text/javascript">
        $(function () {
            var oTable1 = $('#article-grid').dataTable({
                "aoColumns": [
			      { "bSortable": false },
			      null, null, null, null, null,
				  { "bSortable": false }
                ]
            });


            $('table th input:checkbox').on('click', function () {
                var that = this;
                $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

            });


            $('[data-rel="tooltip"]').tooltip({ placement: tooltip_placement });
            function tooltip_placement(context, source) {
                var $source = $(source);
                var $parent = $source.closest('table')
                var off1 = $parent.offset();
                var w1 = $parent.width();

                var off2 = $source.offset();
                var w2 = $source.width();

                if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
                return 'left';
            }
        })
		</script>
</asp:Content>

