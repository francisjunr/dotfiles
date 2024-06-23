if [ -z "$1" ]
  then
    echo "Usage: note '<title of note>'"
    exit
fi
file_name=$(echo "$1" | tr ' ' '_').md
cd '/Users/francisjr/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/'
nvim 'ram/'$file_name
