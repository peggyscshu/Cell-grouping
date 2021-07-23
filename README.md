# Cell-grouping analysis [![DOI](https://zenodo.org/badge/353277738.svg)](https://zenodo.org/badge/latestdoi/353277738)
The red fluorescence labeled cells form clusters during the brain development. In order to understand the distribution of interested cells in different red clusters, we developed these tools to automatically define the cluster code to each interested nucleus.

#Examples
1.	Developmental biology
2.	Cell classification

#Demo image
![Demo](https://user-images.githubusercontent.com/67047201/113233835-adb46400-92d2-11eb-99f6-45804ad7fd39.PNG)

#Description
1.	Two scripts are available in this repository.
2.	The cluster regions according to the red fluorescence image are manually defined in image J to save as a roi list—Red cluster ROI list, while nucleus of interested cells are manually circled in image J and save as another roi list—Nucleus ROI list.
3.	“Measure cluster code and intensity.ijm” is used to generate a new image with the same size as the raw image. The region of each cluster is painted as the cluster index in the “Red cluster ROI list” on this new image, so called “Cluster coded image”.
4.	After the reminder popped out, users can import the “Nucleus ROI list” to measure the cluster index of each cell on the “Cluster coded image”. The red channel image extracted from the raw image is used to measure the fluorescence intensity. This combined csv file is then saved in the automatically generated folder under the parent directory.
5.	After opening the csv file in excel, another code “Calculate frequency.bas” can be imported to automatically reorganize the table and give the cell number in each cluster.

#Instructions Measure cluster code and intensity.ijm
1.	Clone this repository to your own account.
2.	Install “Fiji is just Image J“ in your PC.
3.	Collect the raw image and two roi lists.
4.	Launch Fiji.
5.	Execute the script under Plugins\Macros\Run
6.	Import “Red cluster ROI list” after reminder popped out.
7.	Import “Nucleus ROI list” after the second reminder popped out.
8.	Check the result in the new created folder.

#Instructions Calculate frequency.bas
1.	Open the result csv file in excel.
2.	Click on the “Developer” tab.
3.	Activate “Visual Basic”.
4.	Import this bas file.
5.	Find the script under module and run this module.

#Feedback
1.	Made changes to the layout templates or some other part of the code? Fork this repository, make your changes, and send a pull request.
2.	Do these codes help on your research? Please cite as the follows. Paper title. Authors. Jouranl.

#Structure
![Structure](https://user-images.githubusercontent.com/67047201/113121553-5b793180-9245-11eb-87ba-553fa6fb759b.PNG)
