# Youtube Downloader
A script to automate download of multiple youtube videos to mp3.

## Requires
[youtube-dl](https://rg3.github.io/youtube-dl/) is a command-line program to download videos from YouTube.com


## Options available
	-e or -h or -p	: Languange English or Hinid or Playlist. Download Folder is decided based on this param
	-n 				: [OPTIONAL] Custom name for the file. ex -n filename
  
## Configuration
Please provide the appropriate paths for the folder in the script

> example : ENG_FOLDER="/Users/hd/Music/English/"


## Example 
./download.sh -h -n "Linkin_Park_Numb" https://www.youtube.com/watch?v=kXYiU_JCYtU
