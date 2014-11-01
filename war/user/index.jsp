<%@ include file="../html/header.jsp"%>

<section class="content">

	<div class="row">
		<!-- New Buttons -->
		<div class="col-md-3" style="margin-left: 20px;">
			<div class="row">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>Doc</h3>
						<p>Empty Document</p>
					</div>
					<div class="icon">
						<i class="glyphicon glyphicon-list"></i>
					</div>
					<a id="docView" class="btn small-box-footer" data-toggle="modal"
						data-target="#compose-modal"> Create <i
						class="fa fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="row">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>Sheet</h3>
						<p>Empty Sheet</p>
					</div>
					<div class="icon">
						<i class="glyphicon glyphicon-list-alt"></i>
					</div>
					<a id="sheetView" class="btn small-box-footer" data-toggle="modal"
						data-target="#compose-modal"> Create <i
						class="fa fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="row">
				<!-- small box -->
				<div class="small-box bg-yellow">
					<div class="inner">
						<h3>Present</h3>
						<p>Empty Presentation</p>
					</div>
					<div class="icon">
						<i class="glyphicon glyphicon-credit-card"></i>
					</div>
					<a id="presView" class="btn small-box-footer" data-toggle="modal"
						data-target="#compose-modal"> Create <i
						class="fa fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="row">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>Drawing</h3>
						<p>Empty Art</p>
					</div>
					<div class="icon">
						<i class="glyphicon glyphicon-picture"></i>
					</div>
					<a id="artView" class="btn small-box-footer" data-toggle="modal"
						data-target="#compose-modal"> Create <i
						class="fa fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.New Buttons -->



		<div class="col-md-8" style="margin-left: 20px;">
			<!-- My Drive -->
			<div class="row">
				<div class="box box-solid box-primary">
					<div class="box-header">
						<h1 class="box-title">Files you Own</h1>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding"
						style="overflow: hidden; height: 220px;">
						<table class="table table-hover">
							<tbody>
								<tr>
									<th></th>
									<th>File Name</th>
									<th>Last Modified</th>
									<th>Size</th>
									<th></th>
								</tr>
								<tr>
									<td><span class="label label-primary"> <i
											class="glyphicon glyphicon-list"></i>
									</span></td>
									<td>Sample Document 1</td>
									<td>11-7-2014</td>
									<td>5.14 MB</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
								<tr>
									<td><span class="label label-success"> <i
											class="glyphicon glyphicon-list-alt"></i>
									</span></td>
									<td>Sample Sheet 1</td>
									<td>11-7-2014</td>
									<td>7 Bytes</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
								<tr>
									<td><span class="label label-warning"> <i
											class="glyphicon glyphicon-credit-card"></i>
									</span></td>
									<td>Sample Presentation 1</td>
									<td>11-7-2014</td>
									<td>2.12 MB</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
								<tr>
									<td><span class="label label-danger"> <i
											class="glyphicon glyphicon-picture"></i>
									</span></td>
									<td>Sample Art 1</td>
									<td>11-7-2014</td>
									<td>214 KB</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
								<td><span class="label label-primary"> <i
										class="glyphicon glyphicon-list"></i>
								</span></td>
								<td>Sample Document 2</td>
								<td>11-7-2014</td>
								<td>5.14 MB</td>
								<td><div class="box-tools pull-left">
										<i class="fa fa-times"></i>
									</div></td>
								</tr>
								<tr>
									<td><span class="label label-success"> <i
											class="glyphicon glyphicon-list-alt"></i>
									</span></td>
									<td>Sample Sheet 2</td>
									<td>11-7-2014</td>
									<td>7 Bytes</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
								<tr>
									<td><span class="label label-warning"> <i
											class="glyphicon glyphicon-credit-card"></i>
									</span></td>
									<td>Sample Presentation 2</td>
									<td>11-7-2014</td>
									<td>2.12 MB</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
								<tr>
									<td><span class="label label-danger"> <i
											class="glyphicon glyphicon-picture"></i>
									</span></td>
									<td>Sample Art 2</td>
									<td>11-7-2014</td>
									<td>214 KB</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
								<td><span class="label label-primary"> <i
										class="glyphicon glyphicon-list"></i>
								</span></td>
								<td>Sample Document 3</td>
								<td>11-7-2014</td>
								<td>5.14 MB</td>
								<td><div class="box-tools pull-left">
										<i class="fa fa-times"></i>
									</div></td>
								</tr>
								<tr>
									<td><span class="label label-success"> <i
											class="glyphicon glyphicon-list-alt"></i>
									</span></td>
									<td>Sample Sheet 3</td>
									<td>11-7-2014</td>
									<td>7 Bytes</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
								<tr>
									<td><span class="label label-warning"> <i
											class="glyphicon glyphicon-credit-card"></i>
									</span></td>
									<td>Sample Presentation 3</td>
									<td>11-7-2014</td>
									<td>2.12 MB</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
								<tr>
									<td><span class="label label-danger"> <i
											class="glyphicon glyphicon-picture"></i>
									</span></td>
									<td>Sample Art 3</td>
									<td>11-7-2014</td>
									<td>214 KB</td>
									<td><div class="box-tools pull-left">
											<i class="fa fa-times"></i>
										</div></td>
								</tr>
							</tbody>
						</table>

					</div>
					<!-- /.box-body -->

				</div>
				<!-- /.box -->
			</div>

			<!-- /My Drive -->

			<!-- Shared Files -->


			<div class="row">
				<div class="box box-solid box-primary">
					<div class="box-header">
						<h3 class="box-title">Files shared with you</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding"
						style="overflow: hidden; height: 220px;">
						<table class="table table-hover">
							<tbody>
								<tr>
									<th></th>
									<th>File Name</th>
									<th>File Owner</th>
									<th>Last Modified</th>
									<th>Size</th>

								</tr>
								<tr>
									<td><span class="label label-primary"> <i
											class="glyphicon glyphicon-list"></i>
									</span></td>
									<td>Document 1</td>
									<td>John Doe</td>
									<td>11-7-2014</td>
									<td>5.14 MB</td>

								</tr>
								<tr>
									<td><span class="label label-success"> <i
											class="glyphicon glyphicon-list-alt"></i>
									</span></td>
									<td>Sheet 1</td>
									<td>Jane Doe</td>
									<td>11-7-2014</td>
									<td>7 Bytes</td>

								</tr>
								<tr>
									<td><span class="label label-warning"> <i
											class="glyphicon glyphicon-credit-card"></i>
									</span></td>
									<td>Presentation 1</td>
									<td>Bob Doe</td>
									<td>11-7-2014</td>
									<td>2.12 MB</td>

								</tr>
								<tr>
									<td><span class="label label-danger"> <i
											class="glyphicon glyphicon-picture"></i>
									</span></td>
									<td>Art 1</td>
									<td>Mike Doe</td>
									<td>11-7-2014</td>
									<td>214 KB</td>

								</tr>
								<td><span class="label label-primary"> <i
										class="glyphicon glyphicon-list"></i>
								</span></td>
								<td>Document 2</td>
								<td>John Doe</td>
								<td>11-7-2014</td>
								<td>5.14 MB</td>

								</tr>
								<tr>
									<td><span class="label label-success"> <i
											class="glyphicon glyphicon-list-alt"></i>
									</span></td>
									<td>Sheet 2</td>
									<td>Jane Doe</td>
									<td>11-7-2014</td>
									<td>7 Bytes</td>

								</tr>
								<tr>
									<td><span class="label label-warning"> <i
											class="glyphicon glyphicon-credit-card"></i>
									</span></td>
									<td>Presentation 2</td>
									<td>Bob Doe</td>
									<td>11-7-2014</td>
									<td>2.12 MB</td>

								</tr>
								<tr>
									<td><span class="label label-danger"> <i
											class="glyphicon glyphicon-picture"></i>
									</span></td>
									<td>Art 2</td>
									<td>Mike Doe</td>
									<td>11-7-2014</td>
									<td>214 KB</td>

								</tr>
								<td><span class="label label-primary"> <i
										class="glyphicon glyphicon-list"></i>
								</span></td>
								<td>Document 3</td>
								<td>John Doe</td>
								<td>11-7-2014</td>
								<td>5.14 MB</td>

								</tr>
								<tr>
									<td><span class="label label-success"> <i
											class="glyphicon glyphicon-list-alt"></i>
									</span></td>
									<td>Sheet 3</td>
									<td>Jane Doe</td>
									<td>11-7-2014</td>
									<td>7 Bytes</td>

								</tr>
								<tr>
									<td><span class="label label-warning"> <i
											class="glyphicon glyphicon-credit-card"></i>
									</span></td>
									<td>Presentation 3</td>
									<td>Bob Doe</td>
									<td>11-7-2014</td>
									<td>2.12 MB</td>

								</tr>
								<tr>
									<td><span class="label label-danger"> <i
											class="glyphicon glyphicon-picture"></i>
									</span></td>
									<td>Art 3</td>
									<td>Mike Doe</td>
									<td>11-7-2014</td>
									<td>214 KB</td>

								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->

				</div>
				<!-- /.box -->

			</div>

			<!-- /Shared Files -->

		</div>
	</div>

</section>


<script>
	function clickedButt(inID) {
		var url = "https://docs.google.com/document/d/1vJzoXngfPCEShCwykvwSYQQdUuYZIr8fH7d0jlZUT3U/edit";
		window.location = "/user/driveAppView.jsp?url=" + url;
	}
</script>

<!-- COMPOSE MESSAGE MODAL -->

<div class="modal fade" id="compose-modal" tabindex="-1" role="dialog"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">
					<i class="fa fa-times"></i>
				</button>
				<h4 class="modal-title">
					<i class="fa fa-envelope-o"></i> Create New Message
				</h4>
			</div>
			<form action="#" method="post">
				<div class="modal-body">
					<div class="form-group has-success">
						File Name <br> <br> <input type="text"
							class="form-control" id="inputSuccess" placeholder="Enter ...">
					</div>
			

					<div class="form-group has-success">
						Who has access <br> <br>
						<div >
							<!-- THE MESSAGES -->
							<table class="table">
								<tbody>
									<tr >
									<td><img src="../html/img/avatar.png" height="40px" class="img-circle" alt="User Image"/>
                                                </td>										
										
										<td class="name"><a href="#">John Doe</a></td>
										<td><div class="btn-group">
                                            <button type="button" class="btn btn-info">Can View</button>
                                            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                                                <span class="caret"></span>
                                                <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Action</a></li>
                                                <li><a href="#">Another action</a></li>
                                                <li><a href="#">Something else here</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#">Separated link</a></li>
                                            </ul>
                                        </div></td>
										<td class="small-col">
												<input type="checkbox"
													style="position: absolute; opacity: 0;">
												<ins class="iCheck-helper"
													style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
											</td>
									</tr>
									<tr class="unread">
									<td><img src="../html/img/avatar2.png" height="40px" class="img-circle" alt="User Image"/>
                                                </td>										
										
										<td class="name"><a href="#">John Doe</a></td>
										<td class="small-col"><div class="icheckbox_minimal-blue"
												aria-checked="false" aria-disabled="false"
												style="position: relative;">
												<input type="checkbox"
													style="position: absolute; opacity: 0;">
												<ins class="iCheck-helper"
													style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
											</div></td>
									</tr>
									<tr class="unread">
									<td><img src="../html/img/avatar3.png" height="40px" class="img-circle" alt="User Image"/>
                                                </td>										
										
										<td class="name"><a href="#">John Doe</a></td>
										<td class="small-col"><div class="icheckbox_minimal-blue"
												aria-checked="false" aria-disabled="false"
												style="position: relative;">
												<input type="checkbox"
													style="position: absolute; opacity: 0;">
												<ins class="iCheck-helper"
													style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
											</div></td>
									</tr>
									<tr class="unread">
									<td><img src="../html/img/avatar.png" height="40px" class="img-circle" alt="User Image"/>
                                                </td>										
										
										<td class="name"><a href="#">John Doe</a></td>
										<td class="small-col"><div class="icheckbox_minimal-blue"
												aria-checked="false" aria-disabled="false"
												style="position: relative;">
												<input type="checkbox"
													style="position: absolute; opacity: 0;">
												<ins class="iCheck-helper"
													style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
											</div></td>
									</tr>
									
								</tbody>
							</table>
						</div>

						<p class="help-block">Editors will be allowed to add people
							and change the permissions.</p>
					</div>

				</div>


			</form>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<%@ include file="../html/footer.jsp"%>