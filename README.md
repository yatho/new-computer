# Setting up a new computer

My personal installation script for a new computer.

Note, this sets up an extremely opinionated and highly personalized installation, with my preferences and dotfiles. Please adjust as needed!

My dotfile repo is currently private, but I plan on creating a public repo before the end of the year.

Some resources borrowed from:

- https://github.com/ruyadorno/installme-osx/
- https://gist.github.com/millermedeiros/6615994
- https://gist.github.com/brandonb927/3195465/

## Install from script:

Open the terminal, then:

```sh
bash -c "`curl -L https://git.io/new-computer`"
```

This command downloads and runs `setup.sh` from this repo. See [`setup.sh`](./setup.sh) for the actual, up-to-date script (Homebrew, SSH key + GitHub CLI auth, asdf-managed Java/Node/Maven/Gradle, iTerm2 + LazyVim + lazygit + Starship, and macOS defaults) and [`configure-git.sh`](./configure-git.sh) for the git configuration. Read through both before running — they make real changes to your machine.


----


# Manual Configuration

These apps need to be configured manually.

For OSX settings, I'm still looking for the command line way to change this preference.

#### Set Scroll Reverser preferences

##### Scrolling Section

Checked:

- Reverse Scrolling
- Reverse vertical
- Reverse horizontal
- Reverse Mouse

Unchecked:
- Reverse Trackpad

##### App Section

Checked:

- Start at login

Unchecked:

- Show in menu bar

#### Iterm2

* `setup.sh` calls [`iterm-init.sh`](./iterm-init.sh), which installs every profile in `iterm/*.json` as an iTerm2 Dynamic Profile, the Nerd Font they need, and iTerm2 shell integration. Re-run `./iterm-init.sh` on its own any time a profile JSON changes — no need to rerun the whole `setup.sh`.
* **Dev (Java-Angular-Docker)** (`iterm/iTerm-Dev-Profile.json`): dark theme, Nerd Font, semantic history (cmd-click a file:line from a Java/Angular stack trace to open it in VS Code), and triggers highlighting `BUILD FAILED`/`ERROR` in red and `BUILD SUCCESS` in green.
* **Presenter (Accessible Light)** (`iterm/iTerm-Presenter-Profile.json`): high-contrast, sober off-white theme for demos, screen shares, and conference talks/recordings — pure black text on a soft off-white (`#EDEAE3`, still 17.5:1 contrast, much less glare than pure white), every ANSI color re-tuned to at least 7:1 against that background (WCAG AAA), 30pt bold font, 80x22 window, no transparency, no badge/watermark text, same build-status triggers as Dev. Switch to it for a new window with `Cmd+Shift+O`, or for the current session via right-click -> Edit Session... -> Change Profile. Once on it, press `Cmd+Enter` to toggle native full screen so it's readable from anywhere in the room or on a video call.
* Iterm2 -> Preferences -> Profiles -> select **Dev (Java-Angular-Docker)** -> Other Actions -> Set as Default
* Iterm2 -> Preferences -> Profiles -> Terminal -> confirm Report Terminal Type is `xterm-256color` and Mouse Reporting is on (needed for LazyVim, lazygit, and Claude Code's interactive UI)
* Iterm2 -> Preferences -> Keys -> Key Mappings -> Presets... -> Natural Text Editing

#### System Preferences Configuration

**Users & Groups**

* make sure guest account is turned off

**Keyboard**

* Use F1, F2 as standard function keys: ON
* Turn off spotlight (use Alfred instead)
	* Keyboard -> Shortcuts -> Spotlight -> Deselect all
* Customize control strip -> Delete siri from touchbar
* Touch Bar Shows -> F1, F2, etc. Keys

**General**

* Recent items: None
* Appearance: Graphite
* Highlight color: Pink

**Mission Control**

* Dashboard: As Overlay

**Desktop & Screen Saver**

* Screensaver
	* Hot Corners
		* Top right -> Dashboard
		* Bottom right -> Start screen saver

**Trackpad**

* Tap to click: ON
* Secondary click: ON

**Display**

* Night Shift (flux) -> Schedule -> Sunrise to Sunset

**Security & Privacy**

* Firewall -> on
* Firewall options -> Enable stealth mode
* FileVault -> Turn On FileVault (encrypt harddrive)

**Sharing**

* Ensure everything is unchecked

**Finder Preferences**

* General
	* New finder window show: home folder
* Sidebar
	* Show home, remove Recents
* Advanced
	* Show all filename extensions: ON
	* Show warning before changing an extension: OFF
	* Show warning before emptying the trash: OFF

**TrackPad**

* Point & Click
	* Silent clicking -> On

#### Chrome

* Sign into chrome to sync profile & bookmarks
* Chrome -> Warn before quitting: ON

#### Alfred

* Set Double Cmd to Alfred hotkey

#### Configure VPN

#### SizeUp

* configure license
* settings -> automatically start at login

#### Karabiner Elements

* Simple Modifications
	* From key caps_lock to key left_control (Remap caps lock to control for emacs)
	* From key right_control to key `b` (custom setting for my ergonomic keyboard)
* Devices
	* For all devices -> Caps Lock LED Check Manipulate LED

#### Arduino IDE (Set up to use with Adafruit boards)

* Preferences -> Additional Boards Manager URLS -> https://adafruit.github.io/arduino-board-index/package_adafruit_index.json
* Tools -> Board -> Board Manager. Install:
	* Arduino SAMD Boards
	* Adafruit AVR Boards
* Sketch -> Include Library -> Manage Libraries. Install:
	* Adafruit NeoPixel
	* FastLED

#### Dash

* Download
* docs for:
	* python2
	* python3
	* django
	* flask
	* arduino
	* processing
	* man pages
* cheatsheets for:
	* emacs
	* git
	* python debugger
	* python unittest assertions

### Limechat

* log into freenode

### Widgets

Useful [shipping status tracker widget](https://junecloud.com/software/dashboard/delivery-status.html)

#### Optional

Apps:

* [Send to kindle for Mac](https://www.amazon.com/gp/sendtokindle/mac)
* [Delivery Status Dashboard Widget](https://www.apple.com/downloads/dashboard/shopping/deliverystatus.html)
* [Flip Clock Screensaver](https://fliqlo.com/#about)
* [FlyCut Clipboard Manager](https://github.com/TermiT/Flycut)
* Visit [this page](http://optout.aboutads.info/) to opt out of ads (turn off adblock first)

#### Todos

- Configure touchbar?
	- See: https://blog.eriknicolasgomez.com/2016/11/28/managing-or-setting-the-mini-touchbar-control-strip/
- Set up wallpaper
	- osascript -e 'tell application "Finder" to set desktop picture to "/Users/wilsonmar/Pictures/wallpapers/macOS-High-Sierra-Wallpaper-2880x1494.jpg" as POSIX file'
- Set up alfred powerpack