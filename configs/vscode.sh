#!/usr/bin/env bash

# execute command
# -------------------
# curl -s https://raw.githubusercontent.com/karaage0703/vscode-dotfiles/master/install-vscode-extensions.sh | /bin/bash

# Visual Studio Code :: Package list
pkglist=(
akamud.vscode-theme-onedark
anseki.vscode-color
be5invis.vscode-icontheme-nomo-dark
cssho.vscode-svgviewer
file-icons.file-icons
golang.go
Gruntfuggly.todo-tree
hbenl.vscode-test-explorer
HookyQR.beautify
jamesmaj.easy-icons
KnisterPeter.vscode-github
mechatroner.rainbow-csv
Meezilla.json
mikestead.dotenv
mohd-akram.vscode-html-format
mohsen1.prettify-json
ms-azuretools.vscode-docker
ms-python.python
ms-python.vscode-pylance
ms-toolsai.jupyter
ms-toolsai.jupyter-keymap
ms-toolsai.jupyter-renderers
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode.cpptools
ms-vscode.makefile-tools
ms-vscode.test-adapter-converter
naumovs.color-highlight
njpwerner.autodocstring
PKief.material-icon-theme
ritwickdey.LiveServer
searKing.preview-vscode
tht13.html-preview-vscode
tomoki1207.pdf
vsciot-vscode.vscode-arduino
vscode-icons-team.vscode-icons
WakaTime.vscode-wakatime
wayou.vscode-todo-highlight
yzhang.markdown-all-in-one
ZainChen.json
zhuangtongfa.material-theme
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done