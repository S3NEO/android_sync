#!/bin/bash
cd /home/buildbot/lineage/nougat/
source build/envsetup.sh
breakfast s3ve3g
brunch s3ve3g
rm -rf /var/www/html/s3ve3g/samsung/*
cp -rf out/target/product/s3ve3g/lineage-*.zip /var/www/html/s3ve3g/samsung/
bash ota.sh
echo "all done going in for a reboot to clear caches...."
