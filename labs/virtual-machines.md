---
title: Virtual Machines for the Security Labs
layout: assignment
---

<style>
.language-ascii-noshadows {
    display: block;
    unicode-bidi: embed;
    font-family: monospace;
    white-space: pre;
    font-family: "Lucida Console", Monaco, monospace;
    letter-spacing: -0.2em;
    line-height: 0.8em;
}

</style>

This page documents virtual machines that I have prepared for students in my class to use to complete the labs.


# Setting up your virtual lab

I have created a Kali virtual machine image on Google Cloud Platform which is using nested virtualization to host within it several virtual machines: 
a Windows instance, a Metasploitable2 instance, and a security onion instance. They are hosted using `kvm` and `libvirt` and accessed using `virt-manager`.

Read [these instructions]( {{ '/tutorials/intro-to-gcp.html' | relative_url }}) to get oriented to and set up on Google Cloud Platform, and to get access to the Kali virtual machine. 
Anyone should be able to see and use the custom class kali image if they join [this Google Group](https://groups.google.com/a/daveeargle.com/forum/#!forum/infosec-management) (public access):

## `infosec-net` Network Map

The network map is as follows:
        
<div style='width:40%'> 
    <table class='table'>
        <thead>
            <tr>
                <th>IP Address</th>
                <th>Machine</th>
            </tr>
        </thead>
        <tbody>
        <tr>
            <td>192.168.55.101</td>
            <td>Kali (the host)</td>
        </tr>        
        <tr>
            <td>192.168.55.100</td>
            <td>Windows 7</td>
        </tr>        
        <tr>
            <td>192.168.55.102</td>
            <td>Metasploitable2</td>
        </tr>
        <tr>
            <td>192.168.55.103</td>
            <td>Security Onion</td>
        </tr>
        </tbody>
    </table>
</div>

IPv4 network block in CIDR block notation: <code>192.168.55.0/24</code>


# Using the virtual machines within Kali

1.  The virtual machines are accessed using `virt-manager`. First, you should make
    sure that your user account is a member of the `libvirt` group.

        usermod -a -G libvirt $(whoami)
    
2.  Then, from a terminal, run `virt-manager` to get an interface such as the following:

    {% include image.html image='virt-manager-all-off.PNG' %}

    This shows that three virtual machines are available, but that none are running.

    <div class='alert alert-info'><strong>Virt Manager interface shows no vms?</strong><p>In the <code>virt-manager</code> interface, 
    try running:</p>
    <ul>
    <li><code>File</code></li>
    <li><code>Add Connection...</code></li>
    <li><code>Connect (accept defaults)</code></li>
    </ul>
    </div>

3.  Start a virtual machine by selecting it, and pressing the "play" icon. The virtual machine should
    then update to show that it is running.

    {% include image.html image='virt-manager-running.PNG' %}

4.  To view the running virtual machine, highlight it and click "Open". A new window
    will appear.

    {% include image.html image='virt-manager-running-open.jpg' %}

    You can click into this window and interact with it via keyboard, and mouse if it has a GUI.

    {% include image.html image='virt-manager-running-open-interact.jpg' %}

5.  Details of a virtual machine can be viewed and edited from the "details" pane.

    {% include image.html image='virt-manager-running-open-details.jpg' %}

6.  A network is set up to enable the host (Kali) and the guests (e.g., Metasploitable2, Windows 7) to network with one another.
    Try `ping`ing metasploitable2 from Kali, and Kali from metasploitable2, using the network map ip addresses above.


    {% include image.html image='virt-manager-running-ping.jpg' %}



# How I created the virtual machines

<div class='alert alert-danger'><strong>Heads up!</strong> Students in my class do <em>not</em> need to do any of the following! These are notes for creating from scratch the VMs that I have already provided to you!</div>

[TODO: fill out this documentation]




## Import base kali image into GCP

* Start with a [64-bit prepared Kali VirtualBox .ova from Offensive Security](https://www.offensive-security.com/kali-linux-vm-vmware-virtualbox-image-download/)
* Prepare it for importing into GCP following these instructions:
    * [Automated process](https://cloud.google.com/compute/docs/import/importing-virtual-disks). Or,
    * [Manual import](https://cloud.google.com/compute/docs/import/import-existing-image) and [manual optimization](https://cloud.google.com/compute/docs/import/configuring-imported-images)
        * Install the [guest environment](https://cloud.google.com/compute/docs/images/install-guest-environment)
        * Grab the `gce-disk-expand` package, too, from [here](https://github.com/GoogleCloudPlatform/compute-image-packages)
* Add the [nested virtualization license](https://cloud.google.com/compute/docs/instances/enable-nested-virtualization-vm-instances)
* [Manage image family versioning](https://cloud.google.com/compute/docs/images/create-delete-deprecate-private-images#setting_families)

## Futher Kali Image Customization
*   install xfce desktop
*   install chrome remote desktop tools
*   Set up nested virtualization
    *   install virt-manager
    *   add user to libvirt group
            usermod -a -G libvirt $(whoami)
    *   add virtual network for security-network
            cat <<EOF > infosec-net.xml
            <network>
              <name>infosec-net</name>
              <uuid>b61773a5-0d63-4415-a922-6caca824f1f7</uuid>
            <forward mode='nat'/>
            <bridge name='virbr1'/>
              <ip address='192.168.55.101' netmask='255.255.255.0'/>
            </network>
            EOF

    *   configure libvirt networks to start by default
            sudo virsh net-define infosec-net.xml
            sudo virsh net-start infosec-net
            sudo virsh net-autostart infosec-net

            sudo virsh net-start default
            sudo virsh net-autostart default
*   Set up Kali to pipe audio back over a chrome remote desktop session (very important for rick rolling the windows vm!)
        # audio piping

        deargle@kali:~$ cat pulseaudio.sh 
        #!/usr/bin/bash
        # nu11secur1ty - http://nu11secur1ty.com/
        # Taken from: https://github.com/nu11secur1ty/pulseaudio

        ##### Running pulseaudio autostart ~ gui desktop audio
        echo -e "\n\e[01;32m[+]\e[00m Preparing pulseaudio-user"
        file=/usr/local/bin/pulseaudio.sh; [ -e $file ] && cp -n $file{,.bkup} 

        cat <<EOF> $file
        #!/bin/bash
        timeout 10 pulseaudio -D
        sleep 15
        exit 0;
        EOF

        chmod 0755 $file

        file=/etc/xdg/autostart/pulseaudioscript.sh.desktop; [ -e $file ] && cp -n $file{,.bkup}
        cat <<EOF> $file
        [Desktop Entry]
        Type=Application
        Exec=/usr/local/bin/pulseaudio.sh
        Hidden=false
        NoDisplay=false
        X-GNOME-Autostart-enabled=true
        Name[en_US]=pulseaudio-user
        Name=pulseaudio-user
        Comment[en_US]=
        Comment=
        EOF

        sleep 5;
        exit 0;
        
*   Package installations

        ###########
        # Package installations
        ############

        apt-get install -y libssl-dev libssh-dev
        apt-get install -y hashcat hydra wordlists vim metasploit-framework cewl openvpn leafpad mirage xtightvncviewer

        ####
        # metasploit framework database setup
        ###

        msfdb init
        systemctl enable postgresql
        service postgresql start


        ######
        # social-engineer-toolkit
        #######

        apt-get --force-yes -y install git apache2 python-requests libapache2-mod-php \
          python-pymssql build-essential python-pexpect python-pefile python-crypto python-openssl

        cd /opt
        git clone https://github.com/trustedsec/social-engineer-toolkit/ set/
        cd set
        python setup.py install





## Customize Windows 7 Image

Windows 7 IE8 preview from [here](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)

    apt-get install rtorrent

* start with a developer preview Windows 7 VM from 
* change audio sampling to 48k
* install spice guest additions
* 	switch drivers to virtio
* set adapter 1 to static
* install microsoft office 2007
* install icecast
* run all windows updates
* add spice channel so that copy-paste works






In old versions, I installed:

* [WannaCry](https://github.com/fabrimagic72/malware-samples/tree/master/Ransomware/Wannacry)
* [IceCast 2.0.1](https://ftp.osuosl.org/pub/xiph/releases/icecast/icecast-2.0.1.tar.gz)
* [Microsoft Word 2003](https://softfamous.com/postdownload-file/microsoft-office-2007/455/314/) (because it has an acceptable trial length, and because it is VBA-exploitable)
* Add a script that can pull down windows defender easily.
* [Notepad++](https://notepad-plus-plus.org/)



## Customize metasploitable2

|-|-|
| username: | `msfadmin` |
| password: | `msfadmin` |


I don't remember. 
* For KVM, I think switch hard disk drivers and network to use virtio. 

The only change that I made was to the network interfaces so that they would connecto the `infosec-net`. If you want to make the same changes, do the following from within Metasploitable2:

    cat <<EOF >> /etc/network/interfaces
    auto eth0
    iface eth0 inet static
        address 192.168.55.102
        netmask 255.255.255.0
        gateway 192.168.55.1

    auto eth1
    iface eth1 inet dhcp
    EOF

    cat <<EOF > /etc/resolv.conf
    nameserver 192.168.55.101
    nameserver 8.8.8.8
    nameserver 8.8.4.4
    EOF

    /etc/init.d/networking restart



## Customize security onion

|-|-|
| username: | `securityonion` |
| password: | `Password1` |


Download and install Security Onion following [these instructions](https://github.com/Security-Onion-Solutions/security-onion/wiki/QuickISOImage) and [these instructions](https://askubuntu.com/questions/64915/how-do-i-install-ubuntu-on-a-virtualbox-client-from-an-iso-image). [Make note](https://github.com/Security-Onion-Solutions/security-onion/wiki/Hardware): 

{: style='font-size:16px;'}
> If you just want to quickly evaluate Security Onion in a VM, the bare minimum amount of RAM needed is 3GB. More is obviously better!
	
* I gave mine a 15 GB hard disk.
* Give it two network cards. 
	* **Important:** Set Adapter 1 to "Host-only" or to "Internal Network", click the "Advanced" triangle, and (this is the important part) change "Promiscuous Mode" to "Allow All".
	* On the Adapter 2 tab, select "Enable Network Adapter," and select "NAT."
* I installed with username:password `securityonion:Password1`
* If you value your eyesight, [install VBox Guest Additions](http://www.binarytides.com/vbox-guest-additions-ubuntu-14-04/) to get fullscreen resolution (I had to run it twice).
* Once you have updated everything (`soup up`), double-click "Setup" on the desktop.
	* Choose "eth1" as the Management interface, and use DHCP addressing.
	* Choose "YES, configure sniffing interfaces," and use your promiscuous eth0.
	* Reboot, and double-click "Setup" again, this time skipping network configuration.
	* Choose "Evaluation" mode.
	* Accept the default monitoring interface (eth0).
	* For Squil, here's an easy-to-remember username:password -- analyst:analyst
* Obtain the files necessary for this lab:
	* `sudo mkdir /data && sudo chown -R securityonion /data && cd /data`
	* `wget https://tools.netsa.cert.org/silk/refdata/SiLK-LBNL-05-nonscan.tar.gz`
	* `wget https://tools.netsa.cert.org/silk/refdata/SiLK-LBNL-05-scanners.tar.gz`
	* `gzip -d -c SiLK-LBNL-05-nonscan.tar.gz | tar xf -`
    * `gzip -d -c SiLK-LBNL-05-scanners.tar.gz | tar xf -`
* Install SiLK on Security Onion, [following this guide](http://www.appliednsm.com/silk-on-security-onion/), stopping before the "Configuring SiLK" section.


