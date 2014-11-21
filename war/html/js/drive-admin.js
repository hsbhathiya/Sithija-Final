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
