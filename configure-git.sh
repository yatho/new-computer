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

git config --global core.excludesfile ~/.gitignore_global

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
