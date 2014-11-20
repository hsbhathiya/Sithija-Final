function filter(isCreated, type) {
	x = new Array();
	j = 0;
	for (i = 0; i < fileList.length; i++) {
		if (type == 'all') {
			if ((isCreated) && (fileList[i].sharedWithMeDate == undefined)) {
				x[j++] = fileList[i];
			} else if ((!isCreated && (fileList[i].sharedWithMeDate != undefined))) {
				x[j++] = fileList[i];
			}
		} else {
			t = typeChecker(fileList[i].fileExtension, fileList[i].mimeType);
			if ((isCreated) && (fileList[i].sharedWithMeDate == undefined) && t == type) {
				x[j++] = fileList[i];
			} else if ((!isCreated) && (fileList[i].sharedWithMeDate != undefined) && t == type) {
				x[j++] = fileList[i];
			}

		}
	}

	return x;
}

function createFileList(files, target) {
	for (var i in files) {
		fileList[i] = files[i];
	}
	seperateFiles('all');
}

function seperateFiles(type) {
	var showButton = document.getElementById('showAll');
	if (type == 'all') {
		showButton.style.display = 'none';
	} else {
		showButton.style.display = 'block';
	}
	var ownedTarget = document.getElementById("ownFiles");
	var sharedTarget = document.getElementById("sharedFiles");
	var sharedFiles = filter(false, type);
	var ownedFiles = filter(true, type);
	printFileList(ownedTarget, ownedFiles);
	printFileList(sharedTarget, sharedFiles);
}
