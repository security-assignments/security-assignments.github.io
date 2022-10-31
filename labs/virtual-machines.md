---
title: Virtual Machines for the Security Labs
layout: assignment
include_toc: true
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
Anyone should be able to see and use the custom class kali image if they join [this Google Group](https://groups.google.com/forum/#!forum/infosec-management/join) (public access):

## `infosec-net` Network Map

The network map is as follows:

<div>
    <table class='table'>
        <thead>
            <tr>
                <th>IP Address</th>
                <th>Machine</th>
                <th>Login</th>
                <th>Password</th>
                <th>Notes</th>
            </tr>
        </thead>
        <tbody>
        <tr>
            <td>192.168.56.101</td>
            <td>Kali (the host)</td>
            <td><code>root</code></td>
            <td><code>toor</code></td>
            <td></td>
        </tr>        
        <tr>
            <td>192.168.56.100</td>
            <td>Windows VM</td>
            <td><code>Labuser</code></td>
            <td><code>Passw0rd!</code></td>
            <td>This VM is memory-intensive! Will probably freeze and not launch if your GCP instance doesn't have at least 8 GB memory.</td>
        </tr>        
        <tr>
            <td>192.168.56.102</td>
            <td>Metasploitable2 VM</td>
            <td><code>msfadmin</code></td>
            <td><code>msfadmin</code></td>
            <td></td>
        </tr>
        <tr>
            <td>192.168.56.103</td>
            <td>Security Onion VM</td>
            <td><code>securityonion</code></td>
            <td><code>Password1</code></td>
            <td>This VM is memory-intensive!</td>
        </tr>
        </tbody>
    </table>
</div>

IPv4 network block in CIDR block notation: <code>192.168.56.0/24</code>


# Using the virtual machines within Kali

1.  The virtual machines are accessed using `virt-manager`. First, you should make
    sure that your user account is a member of the `libvirt` group.

        sudo usermod -a -G libvirt $(whoami)

    <div class='alert alert-danger'><strong>Heads up!</strong> This will need to be run each time you create a new Kali instance.</div>

    Alternatively, log in as root (password `toor`):

        su root

2.  Then, from a terminal, run `virt-manager` to get an interface such as the following:

    {% include lab-image.html image='virt-manager-all-off.PNG' %}

    This shows that three virtual machines are available, but that none are running.

    <div class='alert alert-info'><strong>Virt Manager interface shows no vms?</strong><p>In the <code>virt-manager</code> interface,
    try running:</p>
    <ul>
    <li><code>File</code></li>
    <li><code>Add Connection...</code></li>
    <li><code>Connect (accept defaults)</code></li>
    </ul>
    </div>



## Starting and accessing virtual machines

3.  Start a virtual machine by selecting it, and pressing the "play" icon. The virtual machine should
    then update to show that it is running.

    {% include lab-image.html image='virt-manager-running.PNG' %}

4.  To view the running virtual machine, highlight it and click "Open". A new window
    will appear.

    {% include lab-image.html image='virt-manager-running-open.jpg' %}

    You can click into this window and interact with it via keyboard, and mouse if it has a GUI.

    {% include lab-image.html image='virt-manager-running-open-interact.jpg' %}

5.  Details of a virtual machine can be viewed and edited from the "details" pane.

    {% include lab-image.html image='virt-manager-running-open-details.jpg' %}

6.  A network is set up to enable the host (Kali) and the guests (e.g., Metasploitable2, Windows 7) to network with one another.
    Try `ping`ing metasploitable2 from Kali, and Kali from metasploitable2, using the network map ip addresses above.


    {% include lab-image.html image='virt-manager-running-ping.jpg' %}



## Updating the virtual machines

The following scripts will update the respective lab virtual machines installed
on the kali pentest lab image.

### Update SecurityOnion

To update Security Onion, run the following:

    wget -O - https://raw.githubusercontent.com/deargle/kali-xfce-gcp-qemu-packer/master/kali-pentest-lab/update-securityonion.sh | sudo bash

### Update Windows Server 2019

To update Windows Server 2019, run the following:

    wget -O - https://raw.githubusercontent.com/deargle/kali-xfce-gcp-qemu-packer/master/kali-pentest-lab/update-server2019.sh | sudo bash

### Update Metasploitable2

To update Metasploitable2, run the following:

    wget -O - https://raw.githubusercontent.com/deargle/kali-xfce-gcp-qemu-packer/master/kali-pentest-lab/update-metasploitable2.sh | sudo bash





## Using snapshots

Virtual machines in `virt-manager` can be "snapshotted", which lets you restore the virtual machine to a previous state if you mess it up by doing something such as deploying malware to it.


### Creating a snapshot

To create a snapshot, **first, shut down the virtual machine**. Then, click the "snapshot" button on the virtual machine pane, then `+`, then set a name, and "Finish."

{% include lab-image.html image='virt-manager-snapshots.PNG' %}


### Restoring a snapshot

To restore to a snapshot, select your snapshot, and then "play" it. You do not need to shut down the virtual machine before restoring a snapshot.

{% include lab-image.html image='virt-manager-snapshot-restore.PNG' %}



# How I created the virtual machines

If you are curious how the lab was set up, then browse [this github repository](https://github.com/deargle/kali-xfce-gcp-qemu-packer).
