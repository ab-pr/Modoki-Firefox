# Modern Modoki

Bringing back the Modern Modoki theme into the post-theme era. **This theme supports Proton**.

![Firefox screenshot running Modern Modoki](https://user-images.githubusercontent.com/11209477/192164979-31f7c725-87c4-4513-aaed-d2c52a17a9b6.png)

This project aims to bring the Modern Modoki (or close in appearance) theme back to Firefox using the amazing Redmond Firefox theme base, via Firefox's remaining UserChrome interface.

If you're using Pale Moon browser, Use **[Modoki Moon][mmm]** instead of this - a full fork of the original.

If you want compact density in Proton, set `browser.uidensity` to `1` ([source](https://www.omgubuntu.co.uk/2021/06/firefox-89-released-with-brand-new-look)).

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/soup-bowl/Modoki-Firefox)

## Plans

Nowadays Firefox button icons are vectors, and generally of a single colour. This allows the current approach to theming to work. My plan is to make a vector background of the familiar circular and square Modoki icons. This would then mean we can keep the original Firefox icons, but have them appear native.

Feel free to suggest further Netscape or Modoki like adjustments in the Issues segment, or fork your own and run with it.

## Bugs

* This theme is primarily tested on **XFCE** with **[Chicago95][c95]** theme. Other setups may encounter bugs.
* This theme is **not compatible** with lightweight themes, or combined title bar.
* This theme does not support dark mode (on a PC set to dark mode, change the theme to light in Firefox Customise setting).
* This theme expects the menu to be visible. The bookmarks bar is optional.
* This theme will look incredibly blurry on screen densities above 1080p.
* Like the original Modern Modoki, not all icons are covered - especially not extensions.

**If you experience graphical oddities in Proton (Firefox 89+) please submit a bug report with screenshots + OS version.**

## Installation

Note: These theme is currently **not supported on macOS**. 

* (Windows & Linux) In Customize, turn on Title Bar and enable Menu bar under toolbars.
* Download a zip copy of the theme (preferably from releases).
* In Firefox, navigate to `about:support`.
* Under 'Profile Directory', click on Open Directory.
* In this folder, drop the `chrome` folder from the theme here.
* In Firefox again, navigate to `about:config`.
* Search for `toolkit.legacyUserProfileCustomizations.stylesheets` and set to true.
* Restart Firefox.

If done correctly, you Firefox will now be skinned with Modern Modoki. **Please note this theme will not be included in synchronise**.

## Credits

CSS based on the great [Internet Explorer 6 theme][rf] by matthewmx86.
Inspired by [Modern Modoki theme][rf], itself inspired by Netscape Navigator ([still available for Pale Moon][mmm]!).

[rf]:  https://github.com/matthewmx86/RetroThemesFirefox
[c95]: https://github.com/grassmunk/Chicago95
[mm]:  http://lowandsh.web.fc2.com/index.en.html
[mmm]: https://addons.palemoon.org/addon/modoki-moon/
