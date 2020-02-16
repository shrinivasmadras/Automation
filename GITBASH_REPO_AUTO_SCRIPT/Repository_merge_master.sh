#! /usr/bin/sh

**************READ ME*****************
#This script is created to avoid merge conflicts and run the scirpt of the github in one go.
#it helps in creating and merging branch automatically with message prompts.
#please check in all the files before running the script

#please provide the path of your repository here and save the script to the local
#open gitbash and navigate to the path of the script
#call the script ---------->  ./Repository******.sh {Branch name arguments here - can be existing branch or new branch}
**************READ ME*****************

#please provide the path of your repository here.
path=''


cd $path

Branch_name=$@

if git show-ref --quiet refs/heads/$@; then
echo The Branch Already Exists.
echo -n "Do you still wish to proceed (y/n)?"
read answer
	if [ "$answer" != "${answer#[Yy]}" ] ;then
	echo Checking for commits....
		if [ -n "$(git status --porcelain)" ]; then 
		echo "Adding the changes";
		git checkout master
		git pull
		git checkout $@
		git add .
		git commit -m "DATACORE COMMITS" 
		git push
		git merge master
		git push
		git checkout $@
		git diff master --name-only
		else
		echo "There are no Changes to be commited. Do you wish to sync the branch with master? (y/n)?" 
		read answer
			if [ "$answer" != "${answer#[Yy]}" ] ;then
			echo proceeding with merge...
			git checkout master
			git pull
			git checkout $@
			git merge master
			git push
			git push
			git checkout $@
			git diff master --name-only
			else
			exit
			fi
		fi
	else
	exit
	fi
else
echo The Branch Does Not Exist.
echo -n "Do you still wish to proceed (y/n)?" 
read answer
	if [ "$answer" != "${answer#[Yy]}" ] ;then
	echo Checking for commits....
		if [ -n "$(git status --porcelain)" ]; then
		echo "Adding the changes";
		git checkout -b $@
		git add .
		git commit -m "DATACORE COMMITS" 
		git push --set-upstream origin $@
		git push
		git checkout master
		git pull
		git checkout $@
		git merge master
		git push
		git push
		git checkout $@
		git diff master --name-only
		else
		echo "There are no Changes to be commited. Do you still wish to proceed (y/n)?"   
		read answer
			if [ "$answer" != "${answer#[Yy]}" ] ;then
			echo Proceeding with push to upstream and merge.... 
			git checkout master
			git pull
			git checkout -b $@
			git merge master
			git push --set-upstream origin $@
			git push
			git checkout $@
			git diff master --name-only
			else
			exit
			fi
		fi	
	else
	exit
	fi
fi
