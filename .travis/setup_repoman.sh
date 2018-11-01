#!/usr/bin/env bash

set -euo pipefail

sudo mkdir -p /var/db/repos
sudo chmod a+rwX /etc/passwd /etc/group /etc /usr /var/db/repos
echo "portage:x:250:250:portage:/var/tmp/portage:/bin/false" >> /etc/passwd
echo "portage::250:portage,travis" >> /etc/group

mkdir -p /etc/portage/repos.conf /var/db/repos/${OVERLAY_NAME} || echo "Could not copy repo config"
mv * /var/db/repos/${OVERLAY_NAME}/ || echo "Could not move repo"
mv .git /var/db/repos/${OVERLAY_NAME}/ || echo "Could not move .git"
git clone --depth 1 https://git.gomersbach.nl/mgomersbach/gentoo-mirror.git /usr/portage/ || echo "Could not clone portage"
cp .travis/gentoo.conf /etc/portage/repos.conf/ || echo "Could not copy gentoo repo config"
cp .travis/${OVERLAY_NAME}.conf /etc/portage/repos.conf/ || echo "Could not copy overlay repo config"
mkdir -p /usr/portage/metadata/{dtd,xml-schema} || echo "Could not create metadata folders"
wget -O /usr/portage/metadata/dtd/metadata.dtd https://www.gentoo.org/dtd/metadata.dtd || echo "Could not download dtd"
wget -O /usr/portage/metadata/xml-schema/metadata.xsd https://www.gentoo.org/xml-schema/metadata.xsd || echo "Could not download xsd"

ln -s /var/db/repos/${OVERLAY_NAME}/profiles/chinstrap/default/linux/amd64 /etc/portage/make.profile

mkdir /tmp/portage && cd /tmp/portage
wget -qO - "https://gitweb.gentoo.org/proj/portage.git/snapshot/portage-${PORTAGE_VER}.tar.gz" | tar xz