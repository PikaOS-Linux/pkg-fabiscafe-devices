#! /bin/bash

# Clone Upstream
git clone https://codeberg.org/fabiscafe/game-devices-udev rules
mkdir -p ./game-devices-udev/etc/udev/rules.d/
cp -rvf ./rules/*.rules ./game-devices-udev/etc/udev/rules.d/
echo -e "game-devices-udev ("$(date '+%Y%m%d')".git-100pika2"$(date '+%M')") lunar; urgency=medium\n\n  * New Upstream Release\n\n -- Ward Nakchbandi <hotrod.master@hotmail.com> Sat, 01 Oct 2022 14:50:00 +0200" > game-devices-udev/debian/changelog
cd ./game-devices-udev

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
