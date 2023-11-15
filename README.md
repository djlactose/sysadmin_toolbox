# System Administrator's Toolbox

This repository allows you to create a place to store and run your scripts.  It is designed to allow someone with a low level of knowledge and skill to run scripts which normally would require a high level of access.  When someone connects to the container using SSH they are provided a menu to select which scripts they want to run.  Templates are provided to try and make it easier to setup new scripts.

## How to run the container

There are two volumes which should be created or mounted to keep persistance within the container.  

* /mnt
* /root/bak

### /mnt

/mnt is the location where all of your scripts should be placed.

### /root/bak

The users created in the container are backed up to the /root/bak volume.

## Setting up a new script

Each script should be packaged into a folder which contains the following files:

* name
* run.sh

### 'name' file

The 'name' file should contain a short description of what the script does.  This will be displayed in the menu when a user is going through the scripts.

### 'run.sh' file

This is the file that is going to be run when a script is selected from the menu.  This should be kept simple and should check to make sure any dependancies are already installed before attempting to execute the script.  This script should be in bash but can then run any other scripts you want.
