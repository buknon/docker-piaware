#!/bin/sh

set -e
set -x

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y --no-install-recommends install \
  git tar wget ca-certificates build-essential devscripts fakeroot debhelper\
  tcl8.6-dev python3-dev python3-venv libz-dev \
  librtlsdr-dev libusb-1.0-0-dev pkg-config dh-systemd libncurses5-dev libbladerf-dev

cd /build
git clone --depth=1 https://github.com/buknon/piaware_builder.git

cd /build/piaware_builder
./sensible-build.sh bionic
cd /build/piaware_builder/package-bionic
debuild -b -us -uc
cd /build/piaware_builder/package-bionic/dump1090
debuild -b -us -uc
