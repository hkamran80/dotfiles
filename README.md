# macOS and Linux: Dotfiles
* `macos.sh`: macOS dotfile
  * Installs:
    1. `git`
    2. `tshark`
    3. `python3` and modules
         * `requests`
         * `bs4`
         * `flask`
         * `six`
         * `scapy`
         * `PyPDF2`
         * `pyharmony`
         * `pyHS100`
         * `pychromecast`
         * `Pillow`
         * `netifaces`
         * `netdisco`
         * `bottle`
         * `Glances`
    4. `homebrew`
    5. `youtube-dl`
    6. `ffmpeg` (for `youtube-dl`)
    7. `iTerm2`
    8. `Sublime Text 3`
    9. `Spotify`
    10. `Node.js`, `npm`, `nvm`
    11. `Firefox Quantum`
    12. `Sequel Pro`
  * Configures:
    1. Sublime Text for the `subl` command
    2. `git` for name, email, and text editor (MUST be set before script is run!)
    3. Hot Corners (top-left: Mission Control, top-right: Launchpad, bottom-right: Notifications Center)
    4. Finder
* `rpi.sh`: Raspberry Pi dotfile
  * Installs:
    1. `git`
    2. `tshark`
    3. `python3`
    4. `pip3`
        * `requests`
        * `bs4`
        * `flask`
        * `bottle`
        * `Glances`
        * `PyPDF2`
    5. `youtube-dl`
    6. `ffmpeg` (for `youtube-dl`)
  * Configures:
    1. Networking (SSID/password MUST be hard-coded BEFORE running script!)
    2. `git` for name, email, and text editor (MUST be set before script is run!)
    3. Two aliases: `pip3: sudo pip3` and `py3: clear; python3`
