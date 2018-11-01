#!/usr/bin/env bash

set -euo pipefail

sudo mkdir -p /var/db/repos
sudo chmod a+rwX /etc/passwd /etc/group /etc /usr /var/db/repos
echo "portage:x:250:250:portage:/var/tmp/portage:/bin/false" >> /etc/passwd
echo "portage::250:portage,travis" >> /etc/group

mkdir -p /etc/portage/repos.conf /var/db/repos/${OVERLAY_NAME}
mv !("${OVERLAY_NAME}") /var/db/repos/${OVERLAY_NAME}/
mv .git /var/db/repos/${OVERLAY_NAME}/
git clone --depth 1 https://git.gomersbach.nl/mgomersbach/gentoo-mirror.git /usr/portage/
cp .travis/gentoo.conf /etc/portage/repos.conf/
cp .travis/${OVERLAY_NAME}.conf /etc/portage/repos.conf/
mkdir -p /usr/portage/metadata/{dtd,xml-schema}
wget -O /usr/portage/metadata/dtd/metadata.dtd https://www.gentoo.org/dtd/metadata.dtd
wget -O /usr/portage/metadata/xml-schema/metadata.xsd https://www.gentoo.org/xml-schema/metadata.xsd

mkdir /tmp/portage && cd /tmp/portage
wget -qO - "https://gitweb.gentoo.org/proj/portage.git/snapshot/portage-${PORTAGE_VER}.tar.gz" | tar xz