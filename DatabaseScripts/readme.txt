SQL Patching Automation Script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Make sure “DatabaseScripts” and “Python31” are stored in “DeploymentPy” folder preferably on the main drive such as C

C:\DeploymentPy
	DatabaseScripts
	Python31

ini_path.txt
~~~~~~~~~~~~
This file contains paths to each client file

Each line in the ini_path.txt is broken into two parts
left part: this is the client's database name
right part: this is where the client's ini file is stored, ini file can be located in ini folder in DatabaseScripts folder or any other folder that is accessible by the script

patch_medmas.bat
~~~~~~~~~~~~~~~~~~~~~~~~~
If you are running this for one client who has one medmas database, then you will need one patch_medmas.bat; but if you have more than one medmas database on the same server, then you will need one patch_[client]_medmas.bat for each client, where you can name them to reflect each client's database

e.g
one medmas database on the server
    patch_medmas.bat

multiple medmas databases on the server
    patch_moc_medmas.bat --> for moc client
    patch_lmg_medmas.bat --> for lmg client
    ... etc

In each patch_[client]_medmas.bat, make sure you use the client's database name as the passed parameter in the command line

e.g
    DeploySQL.bat --dbname=medmas > %log%

prereqs folder
~~~~~~~~~~~~~~
In this folder you may specify all patches that need to run first before any other patches, patch names in this folder must be sequenced but may not have version in their name

logs folder
~~~~~~~~~~~
Contains execution logs, you may need to clean it up down the road

sqlpatches folder
~~~~~~~~~~~~~~~~~
this is the place where all release ready patches are kept, patch file name should follow the naming standard; ref patch naming standard doc

archive folder
~~~~~~~~~~~~~~
Once all patches have been released to all clients, you may move them from sqlpatches folder into this folder for future reference

Patches are stored in step_version_info and version_info tables for future ref
