<%@ page import="org.sithija.google.drive.datastore.domain.Profile"%>
<%@ page import="org.sithija.google.drive.datastore.operations.ProfileApi"%>
<%@ page import="java.util.List"%>

<!-- Share Modal -->
<div class="modal fade" id="compose-modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="fa fa-times"></i>
				</button>
				<h4 class="modal-title">
				<i class="fa fa-file-o"></i> Create New File
			</h4>
			</div>
			<form action="#" method="post">
				<div class="modal-body">
					<div class="form-group has-success">
						File Name
						<br>
						<br>
						<input type="text" class="form-control" id="inputSuccess" placeholder="Enter ...">
					</div>

					<div class="form-group has-success">
						Who has access
						<br>
						<br>
						<div>
							<!-- THE MESSAGES -->
							<table class="table">
								<tbody>
								<%	List<Profile> sharables = ProfileApi.getProfilesByCompanyName(((Profile)session.getAttribute("profile")).getCompanyName());
									for(Profile profile: sharables) { %> 
									<tr>
										<td>
										  <!-- TODO profile image -->
											<img src="<% out.print(""); %>" width="40x" height="40px" class="img-circle" alt="User Image" />
										</td>

										<td class="name"><a href="#"><% out.print(profile.getName()); %></a>
										</td>
										<td>
										  <!-- TODO need existing permission retrieval logic here -->
											<div class="btn-group">
												<button type="button" class="btn btn-info">Can View</button>
												<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
													<span class="caret"></span>
													<span class="sr-only">Toggle Dropdown</span>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li><a href="#">Action</a>
													</li>
													<li><a href="#">Another action</a>
													</li>
													<li><a href="#">Something else here</a>
													</li>
													<li class="divider"></li>
													<li><a href="#">Separated link</a>
													</li>
												</ul>
											</div>
										</td>
										<td class="small-col">
											<input type="checkbox" style="position: absolute; opacity: 0;">
											<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
										</td>
									</tr>
								<% } %> 
								</tbody>
							</table>
						</div>
						<p class="help-block">Editors will be allowed to add people and change the permissions.</p>
					</div>
				</div>

				<div class="modal-footer clearfix">
					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>
					<a href="/user/driveappview.jsp?url=https://docs.google.com/document/d/19vVoApKkRmOkGfzKsentl8OR2Nyxp3iaW1a1V59eVDM/edit" class="btn btn-primary"><i class="fa fa-plus"></i> Create</a>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->