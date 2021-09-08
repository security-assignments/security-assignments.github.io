---
title: Lab Eratta
layout: page
include_toc: true
---

This page documents fixes for bugs in versions of the virtual machines, including Kali on GCP.

# Kali v3.0.0

## **Problem:** A lock screen appears when the screensaver turns on

**Reason**: Chrome remote desktop is using the wrong desktop environment (it is using `cinnamon` instead of `xfce4`).

**Solution**: Set xfce4 to be the default desktop environment used by chrome remote desktop.

* log in via GCP's ssh-in-the-browser
* Change the default desktop environment used by chrome remote desktop:

  ```bash
  sudo bash -c 'echo "exec xfce4-session" > /etc/chrome-remote-desktop-session'
  ```
* Reboot your instance. (This will terminate your ssh session.)

  ```bash
  sudo reboot
  ```
* Wait for your instance to reboot. Then, connect again via chrome remote desktop
  (<https://remotedesktop.google.com/access>)
