<%@ include file="../html/header.jsp" %>

<div class="row">
	<%-- <p>
		Hello, (You can <a href="<%=userService.createLogoutURL(" /authentication.jsp ")%>">sign
		out</a>.)
		</p>

		<p>
			User Nickname:
			<%=user.getNickname()%>
		</p>

		<p>
			User Email:
			<%=user.getEmail()%>
		</p>

		<p>
			User ID:
			<%=user.getUserId()%>
		</p>--%>

		<script type="text/javascript">
			function setSRC() {
				document.getElementById('f').src = window.location.href
					.substr(window.location.href.indexOf('=') + 1);
			}
		</script>
		<button class="btn btn-primary pull-right" data-toggle="modal" data-target="#compose-modal" style="margin-top:10px; margin-bottom:10px;margin-right:20px;">Share</button>

		<iframe id="f" frameborder=0 width="100%" height="600px"></iframe>
</div>

<!-- Share Option Modal -->

<div class="modal fade" id="compose-modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="fa fa-times"></i>
				</button>
				<h4 class="modal-title">
				<i class="fa fa-file-o"></i> File Access
			</h4>
			</div>
			<form action="#" method="post">
				<div class="modal-body">
					<div class="form-group has-success">
						Who has access
						<br>
						<br>
						<div>
							<!-- THE MESSAGES -->
							<table class="table">
								<tbody>
									<tr>
										<td>
											<img src="../html/img/sanka.jpg" width="40x" height="40px" class="img-circle" alt="User Image" />
										</td>

										<td class="name"><a href="#"> Sanka Rasnayaka</a>
										</td>
										<td>
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
											<input type="checkbox" checked style="position: absolute; opacity: 0;">
											<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
										</td>
									</tr>
									<tr class="unread">
										<td>
											<img src="../html/img/ridwan.jpg" width="40x" height="40px" class="img-circle" alt="User Image" />
										</td>

										<td class="name"><a href="#"> Ridwan Shariffdeen</a>
										</td>
										<td>
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
											<div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
												<input type="checkbox" checked style="position: absolute; opacity: 0;">
												<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
											</div>
										</td>
									</tr>
									<tr class="unread">
										<td>
											<img src="../html/img/tharindu.jpg" width="40x" height="40px" class="img-circle" alt="User Image" />
										</td>

										<td class="name"><a href="#"> Tharindu Munasinghe</a>
										</td>
										<td>
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
											<div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
												<input type="checkbox" checked style="position: absolute; opacity: 0;">
												<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
											</div>
										</td>
									</tr>
									<tr class="unread">
										<td>
											<img src="../html/img/bhathiya.jpg" width="40x" height="40px" class="img-circle" alt="User Image" />
										</td>

										<td class="name"><a href="#"> Bhathiya Supun</a>
										</td>
										<td>
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
											<div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
												<input type="checkbox" style="position: absolute; opacity: 0;">
												<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
						<p class="help-block">Editors will be allowed to add people and change the permissions.</p>
					</div>
				</div>
				<div class="modal-footer clearfix">

					<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

					<a href="/user/driveappview.jsp?url=https://docs.google.com/document/d/1vJzoXngfPCEShCwykvwSYQQdUuYZIr8fH7d0jlZUT3U/edit" class="btn btn-primary"> Apply</a>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%@ include file="../html/footer.jsp" %>