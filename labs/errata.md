---
title: Lab Errata
layout: page
include_toc: true
---

This page documents fixes for bugs in versions of the virtual machines, including Kali on GCP.

# Kali v3.0.0

## **Problem:** A lock screen appears when the screensaver turns on

**Reason**: Chrome remote desktop is using the wrong desktop environment (it is using `cinnamon` instead of `xfce4`).

**Solution**: Set xfce4 to be the default desktop environment used by chrome remote desktop.

* log in via Google Cloud Console's [SSH from the Browser](https://cloud.google.com/compute/docs/ssh-in-browser).
* Change the default desktop environment used by chrome remote desktop:

  ```bash
  sudo bash -c 'echo "exec xfce4-session" > /etc/chrome-remote-desktop-session'
  ```
* [Reboot your instance](https://cloud.google.com/compute/docs/instances/stop-start-instance#resetting_an_instance).
* When your instance has finished rebooting, connect again via chrome remote desktop
  (<https://remotedesktop.google.com/access>)

**Resolved in**: v3.0.1
