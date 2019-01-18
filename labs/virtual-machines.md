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

<div id='nav-bar'></div>

I prepare virtual machines for students in my class to use, which communicate over a `infosec-net` NatNetwork. This page documents the virtual machines, along with how to install and configure virtualbox to use the network.

# Setting up Virtualbox and the infoset-net network

I pre-prepare the virtual machines to be on the same virtual network so that they have internet access and so that they can talk to one another. However, you must initialize the virtualbox network after you install virtualbox. To do so:

**Note:** Ideally you will have at least 8 GB memory (RAM)

1.  First, install one of the VirtualBox platform packages from [here](https://www.virtualbox.org/wiki/Downloads).
2.  Then, create the virtual network.
    * If on Windows, download and run [this script](https://www.dropbox.com/s/923mt76knrherrm/create-infosec-natnetwork.bat?dl=0)
    * If on Mac:
        * Open `Terminal` application
        * Copy-paste the following lines into the terminal, and press `enter`

                vboxmanage natnetwork add --netname infosec-net --network 192.168.55.0/24 --enable --dhcp off
                vboxmanage natnetwork start --netname infosec-net

    You can test whether the scripts were successful by navigating to `Virtuabox > File > Preferences > Network`, where you should see "infosec-net" in the list of networks. If you don't see that network, then you can manually create the network from this dialog prompt by clicking the `plus` and using the following options:
    
    Then click 'ok', 'ok'. 
    
        * Enable Network: `checked`
        * Network Name: `infosec-net` (case-sensitive!)
        * Network CIDR: `192.168.55.0/24`
        * Network Options:
            * Supports DHCP: `unchecked`
            * Supports IPv6: `unchecked`
            
    ![img]( {{ '/assets/images/virtualbox-infosecnet-config.png' | relative_url }})
            
            
## Troubleshooting

If you are a mac user and virtualbox fails to install with the ever-so-helpful message that "Virtualbox Failed to Install", then I have no idea how to help you, stupid Macs. Let me know if you figure out a solution. There is a computer science help desk in the engineering school who can help you set up virtualization.

## "I forgot to do this before importing the VM, what should I do?"

You will need to reconfigure the network adapter for each VM that you imported before creating the `infosec-net` network. To do this, shut down the virtual machine (_shut down_, not _power off_!), then select the virtual machine from the virtualbox manager, click `Settings` > `Network` > `Adapter 1` > attached to `Nat Network' > name `infosec-net`. Then, start up the VM again. You should hopefully now have a working internet connection.

![img]( {{ '/assets/images/infosec-net-specific-device.png' | relative_url }}){: width="500px"}
            
            
# Importing Virtual Machine (VM) `.ova` files

**Note:** Ideally you will have at least 8 GB memory (RAM)

2. Obtain the `.ova` files for the lab from [this section](#the-virtual-machines)
3. Launch Virtualbox > "File" > "Import appliance"
    * select your downloaded .ova file
    * go through the prompts
4. Launch the newly-created VM by double-clicking it in the list on the left.
5. You can now delete the `.ova` file if you're disk-space-starved.

## Troubleshooting

* If you get an error message like this: "VT-x is disabled in the BIOS for both all CPU modes (VERR_VMX_MSR_ALL_VMX_DISABLED)"...
    * ... then you need to go into your BIOS to enable virtualization for your CPU.
    * If you are brave, you can Google for instructions specific to your machine. For example, if you had a Dell Precision 7520 laptop, you might google: "Dell Precision 7520 enable cpu virtualization bios"
        * Don't brick you laptop.

* There is a computer science help desk in the engineering school who can help you set up virtualization.

* High Sierra Mac users: if you try to launch the VM and get the following error message: **Kernel driver not installed (rc=-1908)** Then follow the instructions [here](https://apple.stackexchange.com/a/300518) then try launching the VM again.

# The Virtual Machines

<div class='alert alert-info'>All VMs can be found here: 
    <a class='btn btn-primary' href='https://templeu.instructure.com/courses/54116/pages/virtual-machine-links'><i class='fa fa-download'></i> VM Download Page</a>
</div>

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
            <td>192.168.55.1</td>
            <td>Gateway</td>
        </tr>        
        <tr>
            <td>192.168.55.100</td>
            <td><a href='#windows-10'>Windows 10</a></td>
        </tr>        
        <tr>
            <td>192.168.55.101</td>
            <td><a href='#kali'>Kali</a></td>
        </tr>
        <tr>
            <td>192.168.55.102</td>
            <td><a href='#metasploitable2'>Metasploitable2</a></td>
        </tr>
        <tr>
            <td>192.168.55.103</td>
            <td><a href='#SecurityOnion'>Security Onion</a></td>
        </tr>
        </tbody>
    </table>
</div>

IPv4 network block in CIDR block notation: <code>192.168.55.0/24</code>


<h2 class='language-ascii-noshadows' id='windows-10'>
 _    _ _           _                     __  _____ 
| |  | (_)         | |                   /  ||  _  |
| |  | |_ _ __   __| | _____      _____  `| || |/' |
| |/\| | | '_ \ / _` |/ _ \ \ /\ / / __|  | ||  /| |
\  /\  / | | | | (_| | (_) \ V  V /\__ \ _| |\ |_/ /
 \/  \/|_|_| |_|\__,_|\___/ \_/\_/ |___/ \___/\___/ 
                                                    
</h2>

<span class='label label-info'>Download link ready! See above</span>

|-|-|
| username: | `labuser` |
| password: | `Password1` |

### Building your own Vuln Windows 10 vm instead of using mine

lol good luck.

I installed:

* [WannaCry](https://github.com/fabrimagic72/malware-samples/tree/master/Ransomware/Wannacry)
* [CryptTool2](https://www.cryptool.org/de/ct2-downloads)
* [HxD](https://mh-nexus.de/en/hxd/)
* [hashdeep](http://md5deep.sourceforge.net/)
* [IceCast 2.0.1](https://ftp.osuosl.org/pub/xiph/releases/icecast/icecast-2.0.1.tar.gz)
* [Microsoft Word 2003](https://softfamous.com/postdownload-file/microsoft-office-2007/455/314/) (because it has an acceptable trial length, and because it is VBA-exploitable)
* Add a script that can pull down windows defender easily.
* [Notepad++](https://notepad-plus-plus.org/)

Add two network adapters to the machine. I set my first one to be NATNetwork with a static ip set in windows.



<h2 class='language-ascii-noshadows' id='windows-10'>
 ____  __.      .__  .__ 
|    |/ _|____  |  | |__|
|      < \__  \ |  | |  |
|    |  \ / __ \|  |_|  |
|____|__ (____  /____/__|
        \/    \/         
</h2>


<span class='label label-info'>Download link ready! See above</span>

|-|-|
| username: | `root` |
| password: | `toor` |


### Building your own Kali instead of using mine

<div class='alert alert-danger'><strong>Warning: </strong>If you are in my class and you do this, <strong>you are crazy <i class='fa fa-sign-language'></i></strong> yet I salute you.</div>

1.  Download Kali Linux Light 64 Bit from [here](https://www.kali.org/downloads/). It's less than 1GB.
2.  Follow the instructions [here](http://www.wikigain.com/install-kali-linux-virtualbox-pc/) to create the VM, except:

    * Use 40GB instead of 15GB for the dynamic disk size (just to be safe).
    * Choose whatever for the "Configure the Network" step. My scripts below reset all that anyway.
    * For Step 7 "Partition disks" step, choose "Guided - use entire disk" to save yourself extra work. Choose "All files in one partition" a few steps later on, too. Continue the instructions with Step 16.
    
3.  Confirm that Network Adapter 1 is set to `NATNetwork` pointed to the `infosec-net` network, and set Network Adapter 2 to be `NAT`.    
3.  In a `terminal` in Kali, run the following commands.
    
        # confirm that the apt repositories are set up
        
        cat <<EOF > /etc/apt/sources.list
        deb http://http.kali.org/kali kali-rolling main non-free contrib
        EOF
        
        #############
        # virtualbox guest additions
        # for fullscreen and shared clipboard
        #################
        
        apt-get update && apt-get upgrade -y                # This might take a while. It will make sure your system is up-to-date.
        
        DEBIAN_FRONTEND=noninteractive \
        APT_LISTCHANGES_FRONTEND=none \
        apt-get \
        -o Dpkg::Options::="--force-confnew" \
        --force-yes \
        -fuy \
        dist-upgrade
        
        reboot
        
        apt-get install -y virtualbox-guest-x11 && reboot   # This should give you nice things like shared clipboard between your host and Kali, and fullscreen.
        
        # speaking of shared clipboard, do 'Devices' > 'Shared Clipboard' > 'Bidirectional'.
        
        ########
        # fix networking
        ########
        
        # first, make sure that 
        #   * your machine has network interface 1 set to NATNetwork and infosec-net
        #   * your machine has network interface 2 set to NAT
        # then, 
        
        apt-get purge network-manager   # banish the horrible mess that is the network-manager
        apt-get install net-tools       # go back to the glory days of ifconfig

        cat <<EOF >> /etc/network/interfaces
        auto eth0
        iface eth0 inet static
            address 192.168.55.101
            netmask 255.255.255.0
            gateway 192.168.55.1

        auto eth1
        iface eth1 inet dhcp
        EOF

        cat <<EOF > /etc/resolv.conf
        nameserver 192.168.55.1
        nameserver 8.8.8.8
        nameserver 8.8.4.4
        EOF

        service networking restart

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
    
4.  You should now have a pretty good Kali install for this class.

<section id='install-nessus'></section>    
#### Install the Nessus vulnerability scanner (wait to do this step until you actually need Nessus -- it takes 1+ hrs to complete)

1.	Register for a Nessus Home license. Browse to the URL below and enter your name and email address:
    
    [https://www.tenable.com/products/nessus-home](https://www.tenable.com/products/nessus-home)

2.	(Note: Nessus is already installed on the lab VM, skip this step if you're using the VM I provided.) Download Nessus to your Kali machine from [here](https://www.tenable.com/products/nessus/select-your-operating-system#tos). 
    Navigate to your Download directory and run `dpkg -i <filename of your download>` to install Nessus. 
    
2.	After you receive the email from Tenable containing your serial number, type in the following command in the Kali terminal:

        /opt/nessus/sbin/nessuscli fetch --register <serial>

    Where `<serial>` is the serial number you received in the email from Tenable. You should see a message saying that your activation code has been registered properly. 

3.	In the Kali VM, open a terminal and type `service nessusd start`

4.	Open a web browser in Kali and navigate to `https://kali:8834` to open the Nessus web interface (note the “s”). (Click 'Advanced' > 'Add Security Exception' > 'Confirm Security Exception' to get past the SSL warning.)

5.	For consistency with my lab, create user `root` password `toor` when prompted by Nesssus. Click “reload” if the page fails to load.


<h2 class='language-ascii-noshadows' id='metasploitable2'>
  __  __      _                  _       _ _        _     _      ___  
 |  \/  |    | |                | |     (_) |      | |   | |    |__ \ 
 | \  / | ___| |_ __ _ ___ _ __ | | ___  _| |_ __ _| |__ | | ___   ) |
 | |\/| |/ _ \ __/ _` / __| '_ \| |/ _ \| | __/ _` | '_ \| |/ _ \ / / 
 | |  | |  __/ || (_| \__ \ |_) | | (_) | | || (_| | |_) | |  __// /_ 
 |_|  |_|\___|\__\__,_|___/ .__/|_|\___/|_|\__\__,_|_.__/|_|\___|____|
                          | |                                         
                          |_|                                         
</h2>

<span class='label label-info'>Download link ready! See above</span>

|-|-|
| username: | `msfadmin` |
| password: | `msfadmin` |

### Configure your own Metasploitable2 instead of using mine.

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
    nameserver 192.168.55.1
    nameserver 8.8.8.8
    nameserver 8.8.4.4
    EOF

    /etc/init.d/networking restart

    
<h2 class='language-ascii-noshadows' id='SecurityOnion'>
 ___  ____  ___  __  __  ____  ____  ____  _  _    _____  _  _  ____  _____  _  _ 
/ __)( ___)/ __)(  )(  )(  _ \(_  _)(_  _)( \/ )  (  _  )( \( )(_  _)(  _  )( \( )
\__ \ )__)( (__  )(__)(  )   / _)(_   )(   \  /    )(_)(  )  (  _)(_  )(_)(  )  ( 
(___/(____)\___)(______)(_)\_)(____) (__)  (__)   (_____)(_)\_)(____)(_____)(_)\_)
</h2>


<span class='label label-info'>Download link ready! See above</span>

|-|-|
| username: | `securityonion` |
| password: | `Password1` |


### Setting up your own instead of using mine

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