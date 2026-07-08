#!/bin/sh

#  _ _
# (_) |_ ___ _ __ _ __ ___         _ _ __ (_) |_
# | | __/ _ \ '__| '_ ` _ \ _____ | | '_ \| | __|
# | | ||  __/ |  | | | | | |_____|| | | | | | |_
# |_|\__\___|_|  |_| |_| |_|      |_|_| |_|_|\__|

echo "iTerm2 Profile Setup"
echo "By Yann-Thomas Le Moigne"

# Standalone script: installs/refreshes every iTerm2 Dynamic Profile in
# ./iterm/*.json (currently: Dev (Java-Angular-Docker) and
# Presenter (Accessible Light)), the Nerd Font they need, and iTerm2's shell
# integration. Safe to re-run any time a profile JSON changes — no need to
# rerun the full setup.sh. setup.sh calls this script during a fresh install.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DYNAMIC_PROFILES_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

##############################
# Dynamic Profiles           #
##############################

echo "Installing iTerm2 dynamic profiles..."

mkdir -p "$DYNAMIC_PROFILES_DIR"

for profile in "$SCRIPT_DIR"/iterm/*.json; do
  [ -e "$profile" ] || continue
  cp "$profile" "$DYNAMIC_PROFILES_DIR/"
  echo "  -> installed $(basename "$profile")"
done

##############################
# Nerd Font                  #
##############################

if ! brew list --cask font-meslo-lg-nerd-font >/dev/null 2>&1; then
  echo "Installing MesloLGS Nerd Font..."
  brew install --cask font-meslo-lg-nerd-font
fi

##############################
# Shell integration          #
##############################

# Command marks in the scrollbar, jump-to-prompt, and a badge showing the
# currently running job (docker, mvn, ng serve, etc.) in both profiles.
if [ ! -e "$HOME/.iterm2_shell_integration.zsh" ]; then
  curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
fi
ITERM_INTEGRATION_LINE='test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"'
grep -qF "$ITERM_INTEGRATION_LINE" ~/.zshrc 2>/dev/null || echo "$ITERM_INTEGRATION_LINE" >> ~/.zshrc

echo ""
echo "Done. Restart iTerm2 (or open Preferences > Profiles) to see:"
echo "  - Dev (Java-Angular-Docker): daily-driver dark theme"
echo "  - Presenter (Accessible Light): high-contrast light theme for demos/talks/screen shares"
echo ""
echo "Switch profile for a new window: Cmd+Shift+O."
echo "Switch profile for the current session: right-click > Edit Session... > Change Profile."
