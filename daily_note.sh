cd '/Users/francisjr/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/'
if [ -e "./ram/$(date "+%d-%m-%Y").md" ]
then
	echo "file exits"
	echo "\n## $(date '+%H:%M')" >>  "./ram/$(date "+%d-%m-%Y").md"
	nvim -c 'silent ObsidianToday'
else
	echo "file does not exits"
	nvim -c 'silent ObsidianToday'
fi
