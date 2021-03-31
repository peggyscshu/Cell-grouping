//Prepare for analysis
	tifName=getTitle();
	dir1parent=File.directory;
	run("Set Scale...", "distance=0 known=0 unit=pixel");
	run("Set Measurements...", "area mean min centroid redirect=None decimal=1");
	getDimensions(width, height, channels, slices, frames);
	run("Split Channels");
	selectWindow(tifName+" (green)");
	rename("Green");
	selectWindow(tifName+" (red)");
	rename("Red");
	selectWindow(tifName+" (blue)");
	rename("Nucleus");
// create folder for ROI manager
	folderName = replace(tifName, ".tif", "");
	dir1parent = File.directory;
	dir2 = dir1parent+File.separator+folderName ;
	if (File.exists(dir2)==false) {
				File.makeDirectory(dir2);
		}
//Save image for future combine
	selectWindow("Green");
	save(dir2 + File.separator + "Green.tif");
	selectWindow("Red");
	save(dir2 + File.separator + "Red.tif");
	selectWindow("Nucleus");
	save(dir2 + File.separator + "Nucleus.tif");
	selectWindow("Green");
	close();
	selectWindow("Nucleus");
	close();
//Define red region	
/*	selectWindow("Red");
	run("Duplicate...", "title=Red_Raw");
	selectWindow("Red");
	run("Gaussian Blur...", "sigma=2");
	run("Threshold...");
	setThreshold(90, 255);
	waitForUser("Adjust the threshold");
	run("Analyze Particles...", "size=1000-Infinity add");
*/
	waitForUser("Open the group list");
	g=roiManager("Count");
	if(g>0){
		//roiManager("Save", dir2 + File.separator + "Group.zip");
		newImage("Group code", "8-bit black", width, height, 1);
		for (i = 0; i < g; i++) {
			selectWindow("Group code");
			gv = i +1 ;
			roiManager("Select", i);
			setForegroundColor(gv, gv, gv);
			roiManager("fill");
		}
		roiManager("Delete");
	}
/*	//Clear
	selectWindow("Red");
	close();
*/
//Get nucleus circle group code
	waitForUser("Open cell circle list");
	selectWindow("Group code");
	roiManager("Show All");
	roiManager("Measure");//Max is the red group
//Get nucleus circle intesity in red
	selectWindow("Red");
	roiManager("Show All");
	roiManager("Measure");
//Generate result image
	selectWindow("Group code");
	roiManager("Show All without labels");
	save(dir2 + File.separator + "Group code.tif");
	saveAs("Results", dir2 + File.separator + "UhMaxIsGroup_LhMeanIsRedMean.csv");
	
//Clear
	selectWindow("Red");
	close();
    selectWindow("Group code");
	close();
	roiManager("Delete");
	run("Clear Results");
	