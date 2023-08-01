---
title: Lab Errata and Changelog
layout: page
include_toc: true
---

This page documents fixes for bugs in versions of the virtual machines, including Kali on GCP.

<!-- # Kali-on-GCP Unreleased

* `openssh-server` and openssh-client still need to be pinned to a version in a version of debian supported by GCP -->


# Kali-on-GCP v3.1.1

* Kali is running metasploit-framework v6.1.23-dev, but with [this commit](https://github.com/rapid7/metasploit-framework/commit/9211838a625b02488f4a8ef745cf00a33e4ba113) from v6.1.31 applied to give `chrome_enum.rb` the ability to handle Chrome > v80. 
* Installed docker, Docker version 24.0.5, build ced0996
* Installed DVWA version 2.3 as a Docker container into Kali, running on http://localhost:4280, out of directory `/root/git/DVWA`. The older DVWA v1 version of DVWA on Metasploitable2 is still available, and is still referenced by the labs.
* Re-armed the Windows VM license
* Installed `mirage` into the security-onion VM

# Kali-on-GCP v3.0.0

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
