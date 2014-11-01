<%@ include file="../html/header.jsp"%>

<section class="content">

	<div class="row">
		<!-- New Buttons -->
		<div class="col-md-3" style="margin-left: 20px;">
			<div class="row">
				<!-- small box -->
				<div class="small-box bg-aqua">
				
					<div class="inner" onclick="seperateFiles('document')">
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
				<div class="small-box bg-green" onclick="seperateFiles('spreadsheet')">
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
				<div class="small-box bg-yellow" onclick="seperateFiles('presentation')">
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
				<div class="small-box bg-red" onclick="seperateFiles('drawing')">
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
						<div class="pull-right" style="margin-right: 30px; margin-top: 2px"><button id = "showAll" onclick="seperateFiles('all')"class="btn btn-danger">show all</button></div>
				
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding"
						style="overflow: hidden; height: 220px;">
						<div id="ownFiles">
						</div>
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
					<div id="sharedFiles">
						</div>
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
				
				<div class="modal-footer clearfix">

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

                            <a href="/user/driveAppView.jsp?url=https://docs.google.com/document/d/1vJzoXngfPCEShCwykvwSYQQdUuYZIr8fH7d0jlZUT3U/edit" class="btn btn-primary"><i class="fa fa-plus"></i> Create</a>
                        </div>


			</form>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script type="text/javascript">
			var CLIENT_ID = '1035394417482-cmvmigrlonuatrohjm3j18nnnjrrre3e.apps.googleusercontent.com';
			var SCOPES = 'https://www.googleapis.com/auth/drive';
			var fileList=new Array();
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
				gapi.auth.authorize(
						{'client_id': CLIENT_ID, 'scope': SCOPES, 'immediate': true},
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
					authButton.onclick = function() {
							gapi.auth.authorize(
									{'client_id': CLIENT_ID, 'scope': SCOPES, 'immediate': false},
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
				var retrievePageOfFiles = function(request, result) {
					request.execute(function(resp) {
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


			function filter(isCreated,type)
			{
				x=new Array();
				j=0;
				for(i=0;i<fileList.length;i++)
				{	
					if(type=='all')
					{
						if((isCreated) && (fileList[i].sharedWithMeDate==undefined))
						{
							console.log(fileList[i].mimeType);
	 						 x[j++]=fileList[i];					
						}	
						
						else if((!isCreated && (fileList[i].sharedWithMeDate!=undefined))){
							console.log(fileList[i].mimeType+" ****BLA");
							 x[j++]=fileList[i];
						}				
					}
					
					else{
						t=typeChecker(fileList[i].fileExtension,fileList[i].mimeType);  
						//console.log(t);
						if((isCreated) && (fileList[i].sharedWithMeDate==undefined) && t==type)
						{
							console.log(fileList[i].mimeType);
	 						 x[j++]=fileList[i];					
						}	
						
						else if((!isCreated)&& (fileList[i].sharedWithMeDate!=undefined) && t==type){
							console.log(fileList[i].mimeType+" ****BLA");
							 x[j++]=fileList[i];
						}
						
					}
					
					
					
				}

				return x;
			}
			function createFileList(files, target) {				
				for(var i in files) {					
					fileList[i]=files[i];
				}
				seperateFiles('all');
				
			}
			function seperateFiles(type){
				var showButton = document.getElementById('showAll');
				if (type == 'all'){
					showButton.style.display = 'none';
				}
				
				else{
					showButton.style.display = 'block';
				}
				var ownedTarget = document.getElementById("ownFiles");
				var sharedTarget = document.getElementById("sharedFiles");
				var sharedFiles = filter(false, type);
				var ownedFiles = filter(true, type);
				printFileList(ownedTarget, ownedFiles);
				printFileList(sharedTarget, sharedFiles);
			}
			
			function printFileList(target, files) {
				var output = "<table class='table table-hover'>";
				output += "<tr>";
				output += "<th></th><th>File Name</th><th>Last Modified</th><th>Size</th><th></th>";
				output += "</tr>";
				for(var i in files) {
					var file = files[i];					
					var fileSize = (file.fileSize/1024) + " KB";
					
					if (isNaN(file.fileSize)){
						fileSize = '-';
					}
					output += "<tr>";
					output += "<td><img src='" + file.iconLink + "' /\></td>";
					output += "<td>";

					output +="<a href='/user/driveAppView.jsp?url=" + file.alternateLink + "' target='_blank'>" + file.title + "</a>"
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
	
			function doFilter(isCreated,type) // RIDWAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAN
			{

				/*
					types:
					document
					spreadsheet
					presentation
					drawing
				*/
				list=filter(isCreated,type);
				s="";
				for(var x in	list){
					s+=list[x].title+"\n";
				}	
							
			}
			function typeChecker(extention,mime)
			{
				var type="";
				if(extention==undefined)
				{
					type=mime.substr(mime.lastIndexOf('.')+1);
				}
				else
				{
					type=extention.substr(extention.indexOf('.')+1);
				}		
				return type;
			}

	</script>
<script type="text/javascript"
	src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>


<%@ include file="../html/footer.jsp"%>