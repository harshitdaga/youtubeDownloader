#!/bin/bash 
#TODO if no fileName error

#options available
#	-e or -h or -p	: Languange English or Hinid or Playlist. Download Folder is decided based on this param
#	-n 				: [OPTIONAL] Custom name for the file. ex -n filename
#   
#
# example : ./download.sh -h -n "Linkin_Park_Numb" https://www.youtube.com/watch?v=kXYiU_JCYtU

#Variables
###############################
ENG_FOLDER="<define here>"
HINDI_FOLDER="<path here>"
PLAYLIST_FOLDER="<path here>"
SCRIPT_NAME=`basename "$0"`
PLAYLIST_END_NUMBER=50

#Required Input/Substitutions
###############################
lang=""
is_playlist=0 
file_name=""	#optional
url=""
folder=""	#ENG/HINDI/PLAYLIST


#Validation
###############################
arg=$1
if [[ ${arg:0:1} == "-" ]] ; 
	then
	lang=${arg:1:2}
	#http://unix.stackexchange.com/questions/132480/case-insensitive-substring-search-in-a-shell-script
	if echo $lang | grep -iqF e; 
		then
  		folder=$ENG_FOLDER
  	elif echo $lang | grep -iqF h; 
  		then
  		folder=$HINDI_FOLDER
	elif echo $lang | grep -iqF p; 
		then
		folder=$PLAYLIST_FOLDER
		is_playlist=1
  	fi
else 
	echo -e "[Error] Invalid arguments.\n./"$SCRIPT_NAME" -(e or h) <url>"; 
	exit;
fi

url=${@: -1}

#Information
###############################
echo "Folder 		: "$folder;
if [ -n "$file_name" ]; then
	echo "FILE NAME	: "$file_name
fi
echo "URL    		: "$url;


if [[ $is_playlist == 1 ]];
	then
	echo "Downloading Playlist ..."
	youtube-dl --extract-audio --audio-format mp3 --playlist-end $PLAYLIST_END_NUMBER $url
	echo "Moving Files to $folder ..."
	`mv *.mp3 "$folder"`
else
	echo "Downloading File ..."
	path=$folder'%(title)s.%(ext)s'
	youtube-dl --extract-audio --audio-format mp3 -o $path $url
	if [ -n "$file_name" ]; then
		echo "Renaming File ..."
		tmp_file_name=`youtube-dl --get-filename -o '%(title)s' $url`
		tmp_file_name=$folder$tmp_file_name".mp3"
		file_name=$folder$file_name".mp3"
		echo $tmp_file_name " ---> " $file_name
		mv "$tmp_file_name" "$file_name"
	fi
fi

echo "Done, cya soon!"
