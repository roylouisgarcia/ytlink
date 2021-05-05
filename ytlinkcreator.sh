#!/bin/bash

#-------------------------
#	filename: ytlinkcreator.sh
#	description: This script creates a webpage with links that seaches Youtube for songs listed in a specified text file
#-------------------------

echo "This script by NostradmsX started. Creating links based on the songs listed in $1 ... "
input_file=$(echo $1 | sed "s/\.txt//")
#processed_file=$(sed -i )
#echo "input_file:$input_file"
yt_search_link="https://www.youtube.com/results?search_query="
output_file=./createdlinkpages/ytlink_for_$input_file.html
cat ./html_helper/ytlink_top.html > ${output_file}
echo "Youtube links for $input_file: Open this file: $output_file" >> ${output_file}
cat ./html_helper/ytlink_middle.html >> ${output_file}

IFS=$'\n'       # make newlines the only separator
set -f          # disable globbing


for i in $(cat < "$1"); do
   query_link=$yt_search_link$(echo "$i" | sed "s/\s/+/g")
   echo "<a href=\"$query_link\" target=\"_blank\"><strong>$i</strong></a><br>" >> ${output_file}
done

cat ./html_helper/ytlink_bottom.html >> ${output_file}
#cat $output_file

echo "Finished! Your Youtube Link Page is ${output_file}. Thank you - Roy"