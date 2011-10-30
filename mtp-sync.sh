#!/bin/sh

tag ()
{
	id3v2 --list "$1" | grep "$2" | cut -d ":" -f 2- | cut -d " " -f 2-
}

folder=$1

if [[ -d "$folder" ]]
then
	echo "Preparing to sync directory: $1"
	ftree=$(mtp-filetree)
	cd "$folder"
	for mp3 in *.mp3
	do
		echo $ftree | grep "$mp3" > /dev/null
		OUT=$?
		if [ $OUT -eq 1 ]
		then
			set +H
			title=$(tag "$mp3" "TIT2")
			artist=$(tag "$mp3" "TPE1")
			album=$(tag "$mp3" "TALB")
			trackn=$(tag "$mp3" "TRCK")
			year=$(tag "$mp3" "TYER")
			#dur=$(tag "$mp3" "TLEN")
			s=$(wc -c "$mp3" | awk '{print $1}')
			dur=$(expr $s / 126 / 126)
			echo "Syncing File $mp3"
			mtp-sendtr -q -t "$title" -a "$artist" -l "$album" -n "$trackn" "$mp3" "$mp3"
		fi
	done
	echo "Sync complete"
else
	echo "Invalid Music Folder"
fi

