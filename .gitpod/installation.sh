#! /bin/bash

sudo add-apt-repository ppa:mozillateam/ppa -y
sudo apt-get update
sudo apt-get install -y firefox firefox-esr
sudo sed -i 's/Name=Firefox Web Browser/Name=Firefox Web Browser (ESR)/' /usr/share/applications/firefox-esr.desktop

sudo wget -O /opt/firefox-nightly.tar.bz2 "https://download.mozilla.org/?product=firefox-nightly-latest&os=linux64&lang=en-US"
sudo tar -xjf /opt/firefox-nightly.tar.bz2 -C /opt
sudo ln -sf /opt/firefox/firefox /usr/local/bin/firefox-nightly

timeout 5 firefox
timeout 5 firefox-esr
timeout 5 firefox-nightly

MM_FFDIR="$(find ~/.mozilla/firefox -maxdepth 1 -type d -name '*.default-release')"
MM_FFNDIR="$(find ~/.mozilla/firefox -maxdepth 1 -type d -name '*.default-nightly')"
MM_FFEDIR="$(find ~/.mozilla/firefox-esr -maxdepth 1 -type d -name '*.default-esr*')"

for DIR in "${MM_FFDIR}" "${MM_FFNDIR}" "${MM_FFEDIR}"; do
	cp .gitpod/user.js "${DIR}"
	ln -sf "${GITPOD_REPO_ROOTS}/IE6/chrome" "${DIR}/chrome"
done

mkdir -p ~/.local/share/applications
cp .gitpod/firefox-nightly.desktop ~/.local/share/applications/firefox-nightly.desktop
