#!/bin/sh

#        _ _                      __ _
#   __ _(_) |_   ___ ___  _ __  / _(_) __ _
#  / _` | | __| / __/ _ \| '_ \| |_| |/ _` |
# | (_| | | |_ | (_| (_) | | | |  _| | (_| |
#  \__, |_|\__| \___\___/|_| |_|_| |_|\__, |
#  |___/                               |___/

echo "Git Configuration Script"
echo "By Yann-Thomas Le Moigne"

##############################
# User                       #
##############################

git config --global user.name "Yann-thomas Le Moigne"
git config --global user.email "yann.tho.le.moigne@gmail.com"

##############################
# GitButler                  #
##############################

git config --global gitbutler.aiModelProvider anthropic
git config --global gitbutler.gitbutlerCommitter 0

##############################
# Core                       #
##############################

if [ ! -f ~/.gitignore_global ]; then
  cat <<EOT > ~/.gitignore_global
# macOS
.DS_Store

# Editors / IDEs
.idea/
.vscode/
*.iml

# Java / Gradle / Maven
target/
build/
*.class

# Node / Angular
node_modules/
dist/
.angular/

# Logs
*.log
EOT
fi

git config --global core.excludesfile ~/.gitignore_global

##############################
# Credential                 #
##############################

git config --global credential.helper osxkeychain

##############################
# Commit Signing (SSH key)   #
##############################

git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global commit.gpgsign true

# Register the same key as a *signing* key on GitHub (separate registration
# from the authentication key added in setup.sh) so commits show as "Verified"
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  gh ssh-key add ~/.ssh/id_ed25519.pub --type signing --title "$(scutil --get ComputerName 2>/dev/null || hostname) (signing)" \
    || echo "Could not add the signing key via gh — it may already be registered, or your token is missing the write:ssh_signing_key scope. Try: gh auth refresh -h github.com -s write:ssh_signing_key"
else
  echo "gh CLI isn't authenticated — skipping automatic signing-key registration."
  echo "Run 'gh auth login' then re-run this script, or add ~/.ssh/id_ed25519.pub manually as a Signing Key at https://github.com/settings/ssh/new"
fi

##############################
# Branch                     #
##############################

git config --global branch.sort -committerdate

##############################
# Init                       #
##############################

git config --global init.defaultBranch main

##############################
# Diff                       #
##############################

git config --global diff.algorithm histogram
git config --global diff.colorMoved plain
git config --global diff.mnemonicPrefix true
git config --global diff.renames true

##############################
# Push                       #
##############################

git config --global push.default simple
git config --global push.autoSetupRemote true
git config --global push.followTags true

##############################
# Fetch                      #
##############################

git config --global fetch.prune true
git config --global fetch.pruneTags true
git config --global fetch.all true

##############################
# Help                       #
##############################

git config --global help.autocorrect prompt

##############################
# Commit                     #
##############################

git config --global commit.verbose true

##############################
# Rerere                     #
##############################

git config --global rerere.enabled true
git config --global rerere.autoupdate true

##############################
# Rebase                     #
##############################

git config --global rebase.autoSquash true
git config --global rebase.autoStash true
git config --global rebase.updateRefs true

##############################
# Pull                       #
##############################

git config --global pull.rebase true

##############################
# Sequence                   #
##############################

git config --global sequence.editor interactive-rebase-tool

##############################
# Pager                      #
##############################

git config --global pager.branch false

echo ""
echo "Git configuration done!"
