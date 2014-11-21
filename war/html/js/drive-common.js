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
	target.innerHTML = output;
}

function doFilter(isCreated, type) {
	/*	types:
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
