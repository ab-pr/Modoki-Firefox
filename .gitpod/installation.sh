#! /bin/bash

sudo apt-get remove -y firefox

mkdir -p ~/.local/share/applications

# In case a prior installation has failed.
sudo rm -rf /opt/firefox

declare -A firefox_versions=(
	["firefox-regular"]="firefox-latest"
	["firefox-esr"]="firefox-esr-latest"
    ["firefox-nightly"]="firefox-nightly-latest"
    ["firefox-developer"]="firefox-devedition-latest"
)

for version in "${!firefox_versions[@]}"; do
    product=${firefox_versions[$version]}
	existed=0

	echo ""
	echo "🦊 Installing: ${version}"
	echo "---------------------------------------"

	if [ -d "/opt/${version}" ]; then
		existed=1
		echo "ℹ️  Detected existing install, reinstalling..."
		echo "> sudo rm -r \"/opt/${version}\""
		sudo rm -r "/opt/${version}"
	fi

	if [ ! -f "/opt/${version}.tar.bz2" ]; then
		echo "> wget -q -O \"/opt/${version}.tar.bz2\" \"https://download.mozilla.org/?product=${product}&os=linux64&lang=en-US\""
		sudo wget -q -O "/opt/${version}.tar.bz2" "https://download.mozilla.org/?product=${product}&os=linux64&lang=en-US"
	else
		echo "ℹ️  ${version} has already been downloaded. Skipping..."
	fi

	echo "> sudo tar -xjf \"/opt/${version}.tar.bz2\" -C /opt"
    sudo tar -xjf "/opt/${version}.tar.bz2" -C /opt

	echo "> sudo mv /opt/firefox \"/opt/${version}\""
    sudo mv /opt/firefox "/opt/${version}"

	if [ $existed -eq 0 ]; then
		echo "> ln -sf \"/opt/${version}/firefox\" \"/usr/local/bin/${version}\""
		sudo ln -sf "/opt/${version}/firefox" "/usr/local/bin/${version}"

	
		echo "> /opt/${version}/firefox -CreateProfile $version"
		/opt/${version}/firefox -CreateProfile $version
		exit_status=$?

		if [ $exit_status -eq 0 ]; then
			DIR="$(find ~/.mozilla/firefox -maxdepth 1 -type d -name "*.${version}")"

			echo "> cp .gitpod/user.js \"${DIR}\""
			cp .gitpod/user.js "${DIR}"

			echo "> ln -sf \"${GITPOD_REPO_ROOTS}/IE6/chrome\" \"${DIR}/chrome\""
			ln -sf "${GITPOD_REPO_ROOTS}/IE6/chrome" "${DIR}/chrome"

			cat << EOF > ~/Desktop/${version}.desktop
[Desktop Entry]
Version=1.0
Name=${version}
GenericName=Web Browser
Exec=/opt/${version}/firefox -P ${version} %u
Icon=/opt/${version}/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Categories=Network;WebBrowser;
Keywords=web;browser;internet;
EOF

			sudo chmod +x ~/Desktop/${version}.desktop
			cp ~/Desktop/${version}.desktop ~/.local/share/applications/${version}.desktop
		else
			echo "❌ A problem occurred during profile creation. Skipping ${version}..."
		fi
	else
		echo "ℹ️  Since ${version} was already installed, let's skip the gubbins."
	fi
done

echo ""
echo "🚀 Script has concluded - Firefox (of various variants) installed!"
