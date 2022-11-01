#!/usr/bin/env bash

echo "# Gnome 3.20+ - based on https://blog.samalik.com/make-your-gnome-title-bar-smaller-fedora-24-update/
window.ssd headerbar.titlebar {
    padding-top: 4px;
    padding-bottom: 4px;
    min-height: 0;
}
window.ssd headerbar.titlebar button.titlebutton {
    padding: 0px;
    min-height: 0;
    min-width: 0;
}" > ~/.config/gtk-3.0/gtk.css
