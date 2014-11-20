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
							<tr>
								<td width="10%"></td>
								<td>
									<img src="../html/img/sanka.jpg" width="40x" height="40px" class="img-circle" alt="User Image" />
								</td>

								<td class="name"><a href="#"> Sanka Rasnayaka</a>
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
							<tr class="unread">
								<td width="10%"></td>
								<td>
									<img src="../html/img/ridwan.jpg" width="40x" height="40px" class="img-circle" alt="User Image" />
								</td>

								<td class="name"><a href="#">Ridwan Shariffdeen</a>
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
							</tr>
							<tr class="unread">
								<td width="10%"></td>
								<td>
									<img src="../html/img/tharindu.jpg" width="40x" height="40px" class="img-circle" alt="User Image" />
								</td>

								<td class="name"><a href="#">Tharindu Munasinghe</a>
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
							<tr class="unread">
								<td width="10%"></td>
								<td>
									<img src="../html/img/bhathiya.jpg" height="40px" class="img-circle" alt="User Image" />
								</td>

								<td class="name"><a href="#">Bhathiya Supun</a>
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

						</tbody>
					</table>
					</div>
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
		window.location = "/user/index.jsp";
	}
</script>

<script type="text/javascript">
	var CLIENT_ID = '1035394417482-cmvmigrlonuatrohjm3j18nnnjrrre3e.apps.googleusercontent.com';
	var SCOPES = 'https://www.googleapis.com/auth/drive';
	var fileList = new Array();
	/**
	 * Called when the client library is loaded to start the auth flow.
	 */
	function handleClientLoad() {
		window.setTimeout(checkAuth, 1);
	}

	/**
	 * Check if the current user has authorized the application.
	 */
	function checkAuth() {
		gapi.auth.authorize({
				'client_id': CLIENT_ID,
				'scope': SCOPES,
				'immediate': true
			},
			handleAuthResult);
	}

	/**
	 * Called when authorization server replies.
	 *
	 * @param {Object} authResult Authorization result.
	 */
	function handleAuthResult(authResult) {
		var authButton = document.getElementById('authorizeButton');
		if (authResult && !authResult.error) {
			// Access token has been successfully retrieved, requests can be sent to the API.
			authButton.style.display = 'none';
			console.log('authenticated');
			gapi.client.load('drive', 'v2', loadFiles);
		} else {
			// No access token could be retrieved, show the button to start the authorization flow.
			authButton.style.display = 'block';
			authButton.onclick = function () {
				gapi.auth.authorize({
						'client_id': CLIENT_ID,
						'scope': SCOPES,
						'immediate': false
					},
					handleAuthResult);
			};
		}
	}

	/**
	 * .
	 *
	 * @param {} callback.
	 */
	function loadFiles() {
		var fileDiv = document.getElementById('files');

		retrieveAllFiles(createFileList, fileDiv);
	}

	function retrieveAllFiles(callback, target) {
		var retrievePageOfFiles = function (request, result) {
			request.execute(function (resp) {
				result = result.concat(resp.items);
				var nextPageToken = resp.nextPageToken;
				if (nextPageToken) {
					request = gapi.client.drive.files.list({
						'pageToken': nextPageToken
					});
					retrievePageOfFiles(request, result);
				} else {
					callback(result, target);
				}
			});
		}
		var initialRequest = gapi.client.drive.files.list();
		retrievePageOfFiles(initialRequest, []);
	}

	/**
	 * .
	 *
	 * @param {} callback.
	 */


	function filter(isCreated, type) {
		x = new Array();
		j = 0;
		for (i = 0; i < fileList.length; i++) {


			t = typeChecker(fileList[i].fileExtension, fileList[i].mimeType);
			//console.log(t);
			if ((isCreated != fileList[i].shared) && t == type) {
				console.log(fileList[i].mimeType);
				x[j++] = fileList[i];
			} else if (type == 'all') {
				console.log(fileList[i].mimeType + " ****BLA");
				x[j++] = fileList[i];
			}

		}

		return x;
	}

	function createFileList(files, target) {
		for (var i in files) {
			fileList[i] = files[i];
		}
		var newTarget = document.getElementById("files");
		printFileList(newTarget, fileList);
	}

	function printFileList(target, files) {
		var output = "<table class='table table-hover'>";
		output += "<tr>";
		output += "<th></th><th>File Name</th><th>Last Modified</th><th>Size</th><th></th>";
		output += "</tr>";
		for (var i in files) {
			var file = files[i];
			var fileSize = (file.fileSize / 1024) + " KB";

			if (isNaN(file.fileSize)) {
				fileSize = '-';
			}
			output += "<tr>";
			output += "<td><img src='" + file.iconLink + "' /\></td>";
			output += "<td>";

			output += "<a href='/user/driveappview.jsp?url=" + file.alternateLink + "' target='_blank'>" + file.title + "</a>"
			output += "</td>";
			output += "<td>";
			output += file.modifiedDate;
			output += "</td>";
			output += "<td>";
			output += fileSize;
			output += "</td>";
			output += "</tr>";
		}
		output += "</table>";
		console.log(output);
		target.innerHTML = output;
	}

	function doFilter(isCreated, type) // RIDWAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAN
	 {

		/*
				types:
				document
				spreadsheet
				presentation
				drawing
			*/
		list = filter(isCreated, type);
		s = "";
		for (var x in list) {
			s += list[x].title + "\n";
		}

	}

	function typeChecker(extention, mime) {
		var type = "";
		if (extention == undefined) {
			type = mime.substr(mime.lastIndexOf('.') + 1);
		} else {
			type = extention.substr(extention.indexOf('.') + 1);
		}
		return type;
	}
</script>
<script type="text/javascript" src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>

<%@ include file="../html/footer.jsp" %>