<%@ include file="/html/Dashboard/header.jsp" %>

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
						<a id="docView" class="btn small-box-footer" data-toggle="modal" data-target="#compose-modal"> Create <i
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
						<a id="sheetView" class="btn small-box-footer" data-toggle="modal" data-target="#compose-modal"> Create <i
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
						<a id="presView" class="btn small-box-footer" data-toggle="modal" data-target="#compose-modal"> Create <i
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
						<a id="artView" class="btn small-box-footer" data-toggle="modal" data-target="#compose-modal"> Create <i
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
							<div class="pull-right" style="margin-right: 30px; margin-top: 2px">
								<button id="showAll" onclick="seperateFiles('all')" class="btn btn-danger">show all</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body table-responsive no-padding" style="overflow: hidden; height: 220px;">
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
						<div class="box-body table-responsive no-padding" style="overflow: hidden; height: 220px;">
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
			window.location = "/user/driveappview.jsp?url=" + url;
		}
	</script>

	<%@ include file="shareview.jsp" %>

	<script type="text/javascript" src="/html/js/drive-common.js"></script>
	<script type="text/javascript" src="/html/js/drive-user.js"></script>
	<script type="text/javascript" src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>

<%@ include file="/html/Dashboard/footer.jsp" %>
