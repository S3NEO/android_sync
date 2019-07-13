#!/bin/sh
echo "Start OTA Generation"
echo "Upload Builds before using the script"

date="$(date '+%s')"
date2="$(date '+%d.%m.%Y')"

file_path_s3ve3g="$(ls /home/buildbot/lineage/nougat/out/target/product/s3ve3g/lineage-* | grep -v Changelog | grep -v md5sum | grep -v json)"
echo $file_path_s3ve3g
file_name_s3ve3g="$(cd /home/buildbot/lineage/nougat/out/target/product/s3ve3g/ && ls lineage-* | grep -v Changelog | grep -v md5sum | grep -v json)"
file_size_s3ve3g="$(ls -l "$file_path_s3ve3g" | awk '{print $5}')"
md5_s3ve3g="$(sha256sum "$file_path_s3ve3g" | awk '{print $1}')"

echo "Generate OTA for s3ve3g"
echo -e "{
  "response": [
    {
      \"datetime\": $date,
      \"filename\": \"$file_name_s3ve3g\",
      \"id\": \"8679bf8758246e6512520e3a4f51a88d29ba0855b8af76612fcf28d1faaafaad\",
      \"romtype\": \"unofficial\",
      \"size\": $file_size_s3ve3g,
      \"url\": \"http://64.190.91.79/s3ve3g/samsung/$file_name_s3ve3g\",
      \"version\": \"14.1\"
    }
  ]
}
" > /var/www/html/s3ve3g/samsung/updater.json
echo "update OTA for s3ve3g"
echo "All Done :D"
