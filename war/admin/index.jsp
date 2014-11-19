<%@ page import="org.sithija.google.drive.datastore.domain.Profile"%>
<%@ page import="org.sithija.google.drive.datastore.operations.ProfileApi"%>
<%@ page import="java.util.List"%>
<%@ include file="../html/header.jsp" %>

	<section class="content">
		<div class="row">
			<input type="button" id="authorizeButton" style="display: none" value="Authorize" />

			<!-- Users -->
			<div class="col-md-4" style="margin-left: 20px;">
				<div class="box box-solid box-primary">
					<div class="box-header">
						<h1 class="box-title">Users</h1>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding" style="overflow: hidden;">
						<button class="btn btn-success pull-right" data-toggle="modal" data-target="#compose-modal" style="margin-top:10px; margin-bottom:10px;margin-right:20px;">Create User</button>
						<br>
						<h3 style="margin-left:10px;">List of Users</h3>
						<br>
						<table class="table table-hover">
							<tbody>
							<%	List<Profile> employees = ProfileApi.getProfilesByCompanyName(((Profile)session.getAttribute("admin")).getCompanyName());
								for(Profile profile: employees) { %> 
								<tr>
									<td width="10%"></td>
									<!-- TODO profile image -->
									<td>
										<img src="<% out.print(""); %>" width="40x" height="40px" class="img-circle" alt="User Image" />
									</td>

									<td class="name"><a href="#"><% out.print(profile.getName()); %></a>
									</td>
									<td>
										<div class="btn-group">
											<button type="button" class="btn btn-info">Delete</button>
											<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
												<span class="caret"></span>
												<span class="sr-only">Toggle Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Promote</a>
												</li>
												<li><a href="#">Suspend</a>
												</li>
												<li><a href="#">De-Activate</a>
												</li>
											</ul>
										</div>
									</td>
								</tr>
							<% } %> 
							</tbody>
						</table>
					</div>
				</div>
				<!-- /Users -->
				
				<!-- My Drive -->
				<div class="col-md-7" style="margin-left: 20px;">
					<div class="row">
						<div class="box box-solid box-primary">
							<div class="box-header">
								<h1 class="box-title">All Files</h1>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding" style="overflow: hidden;">
								<!-- LOAD FILES -->
								<div id="files"></div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- / Drive -->
				</div>
			</div>
	</section>

	<!-- Create New User Modal -->
	<div class="modal fade" id="compose-modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<i class="fa fa-times"></i>
					</button>
					<h4 class="modal-title">
				<i class="fa fa-user"></i> Create New User
			</h4>
				</div>
				<form action="#" method="post">
					<div class="modal-body">
						<div class="form-group has-success">
							User Name
							<br>
							<br>
							<input type="text" class="form-control" id="inputSuccess" placeholder="Enter ...">
						</div>
						<div class="form-group has-success">
							User Email
							<br>
							<br>
							<input type="text" class="form-control" type="email" id="inputSuccess" placeholder="Enter ...">
						</div>
					</div>
					<div class="modal-footer clearfix">
						<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>
						<a href="/user/driveappview.jsp?url=https://docs.google.com/document/d/1vJzoXngfPCEShCwykvwSYQQdUuYZIr8fH7d0jlZUT3U/edit" class="btn btn-primary"><i class="fa fa-plus"></i> Create</a>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script>
		function adminLogout() {
			window.location = "adminlogin.jsp";
		}
	</script>

	<!-- no longer useful (need to access company Drive under a different logic)
	<script type="text/javascript" src="../html/js/drive-common.js"></script>
	<script type="text/javascript" src="../html/js/drive-admin.js"></script>-->
	<script type="text/javascript" src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>

<%@ include file="../html/footer.jsp" %>
