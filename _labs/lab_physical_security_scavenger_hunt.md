---

title: "Lab: Physical Security Scavenger Hunt"
description: There can be no information security without physical security
number: 9
---

<h3><em>There can be no information security without physical security.</em></h3>

**Note:** This lab can be completed in a group of up to four members. Before you make a submission on Canvas, all of your team members should join one of the <span class='label label-danger'>already-existing</span> "Physical Security" groups on Canvas.

To earn full credit for this lab, your team must complete 6 of the 11 items below.

# Deliverable

Submit <span class='label label-info'>one single solitary pdf <i class='fa fa-exclamation-triangle'></i></span> with documentation of <span class='label label-info'>all <i class='fa fa-bullhorn'></i></span> completed items for your team. 

**For each accomplished item** in your **single solitary pdf**, include:
1. Prominent header-text indicating which item you have completed
2. Conclusive photo-documentation of completion. 
3. A sentence or more describing the feat.


# Item 1: Successfully open one of my locks via both (bumping) and (SLP and/or raking)

I need to witness it, and you have to do each method twice. Twice is the rule to let both me and you know that it wasn't just luck.


# Item 2

Either a or b but not both.

## Item 2a: Photograph an Unlocked, Unattended Terminal

Example:

<div markdown='1' style='width:30%'>
<img src="/assets/images/lab_5_3.jpg" width='100%' alt="lab 5 1">
</div>


## Item 2b: Shoulder-Surf to Get a Legible Photo of a Screen in Use

Example:

<div markdown='1' style='width:30%'>
<img src="/assets/images/lab_5_4.jpg" width='100%' alt="lab 5 1">
</div>


# Item 3: Go Dumpster Diving to Obtain a Photo of Sensitive and/or Potentially Valuable Information

**Note:** Please specify the information, but redact the information in the attached photo.

<div class='alert alert-warning'>While it is not illegal to dumpster dive in CO, you can still get in trouble for trespassing, so be mindful and don't trespass. See Colorado : State v. Hillman, 834 P.2d. 1271 (1992), which says that trash
curbside / in front of house / outside fenced area of property is public.</div>

Example:

<div class='row' >
    <div class='col-md-4'>
        <img class='pull-left' src="/assets/images/lab_5_5.jpg" width='100%' alt="lab 5 1">
    </div>
    <div class='col-md-4'>
        <img class='pull-left' src="/assets/images/lab_5_6.png" width='100%' alt="lab 5 1">
    </div>
</div>


# Item 4: Take a Picture of Sensitive/Potentially Valuable Information Left in Someone’s Car

Example:

<div class='row'>
    <div class='col-md-4'>
        <img src="/assets/images/lab_5_10.jpg"  width='100%' alt="lab 5 1">
    </div>
    <div class='col-md-4'>
        <img src="/assets/images/lab_5_11.jpg"  width='100%' alt="lab 5 1">
    </div>
</div>


# Item 5: Gain Access to a Pre-approved Restricted Area

Take a picture of yourself in the restricted area and document how you did it (e.g., tailgaiting). Get permission from a manager, etc. before entering the restricted area. For example, you might explain to a manager that you are doing a class assignment and you would like to test whether their employees will prohibit you from entering the restricted area. Only proceed with the test with the manager's approval.

**Note:** You have my permission to attempt to gain access to my office without picking the lock (please lock the door on your way out). It doesn't count if I am in the office. Otherwise, it counts.

Example:

<div class='row'>
    <div class='col-md-4'>
        <img src="/assets/images/lab_5_7.jpg"  width='100%' alt="lab 5 1">
    </div>
    <div class='col-md-4'>
        <img src="/assets/images/lab_5_8.jpg" width='100%' alt="lab 5 1">
    </div>
    <div class='col-md-4'>
        <img src="/assets/images/lab_5_9.jpg" width='100%' alt="lab 5 1">
    </div>
</div>


# Item 6: Enter a Pre-approved Restricted Area by Disguise

For example, use a clipboard or fake ID. You can double-count this one with #5.



# Item 7: Get a photo of an ID badge that is good enough to make a duplicate, and make a duplicate

**Note:** Bonus points if you actually make a _passable_ counterfeit badge.



# Item 8: More Unattended-Computer Mischief 

Either a or b but not both.


## Item 8a: Access Saved Passwords in a Web Browser on an Unattended Computer

This website has a list of helpful tools to recover passwords from web browsers:

[http://www.nirsoft.net/password_recovery_tools.html](http://www.nirsoft.net/password_recovery_tools.html)



## Item 8b: Install a nuisance-yet-benign browser extension into the web browser of an unattended computer

e.g, [nCage](https://chrome.google.com/webstore/detail/ncage/hnbmfljfohghaepamnfokgggaejlmfol?hl=en) or [Cloud to Butt](https://chrome.google.com/webstore/detail/cloud-to-butt-plus/apmlngnhgbnjpajelfkmabhkfapgnoai?hl=en)




# Item 9: Photo Document the Security Cameras in a Building and Establish a Route through the Building without Being Recorded

The route-establishment can be drawn out, but it's coolest if you video-record doing it.




# Item 10: Install a False Keylogger on a Public Computer

Pretend that a USB drive is a keylogger. Plug it into the back of a public computer, and leave it for a day. Retrieve it later. Take a picture of when you leave it, and when you return. 

**Important:** Do _**not**_ use an actual keylogger unless you have prior approval from the device owner.








# Item 11: Obtain the Password Hashes from an Unattended Public Computer

<div class='alert alert-warning'>

<p><strong>Note:</strong> This Item uses Cain, which is installed on the lab VM. It can be downloaded from <a href='http://www.oxid.it/downloads/ca_setup.exe'>www.oxid.it</a>. However, this file will set off all sorts of virus detection alarms and warnings, both in the browser and on your computer. Cain is <em>not</em> a virus, 
and www.oxid.it is the official site to obtain the file from. But you can use Cain to do *virusy* things, so it gets flagged.</p>

<p><em><i class='fa fa-bolt'></i>You are the virus<i class='fa fa-bolt'></i></em></p>

</div>


<div markdown='1' style='width:30%'>
<img src="/assets/images/lab_5_1.jpg" width='100%' alt="lab 5 1">
</div>

Obtain the password hashes from an unattended public computer. In Windows 7/10, the password hashes are contained in two files (you’ll need both):

`C:\Windows\system32\config\SAM`

`C:\Windows\system32\config\system`

Since these files are protected by the operating system, [boot from a Live CD/USB Linux distribution, such as Kali](https://docs.kali.org/downloading/kali-linux-live-usb-install). From within Kali, copy the SAM and system files to a USB stick.

Password hashes can be dumped from the SAM file using a number of tools. For this lab, use Cain.
 
Run Cain (ignore any messages about the Windows firewall). Click the “Cracker” tab, and click within the right-hand pane to give it focus. Click on the + button in the toolbar and select Import Hashes from a SAM Database. Select the SAM file you obtained. Next to the Boot Key (HEX) field, select the System file you obtained. This will yield a hex string that you must copy and paste into the Boot Key (HEX) field. 

Include a screen shot of the hashes below to prove that you’ve done it. 

**Note:** Include a photo of the hashes, <span class='label label-danger'>but don’t actually crack the hashes</span>.

Example:

<div markdown='1' style='width:30%'>
<img src="/assets/images/lab_5_2.jpg" width='100%' alt="lab 5 1">
</div>

<div class='alert alert-info'><strong>Note:</strong> This attack will not work on any computer in Leeds. A student of mine who worked for LTS tried it out (successfully) and showed his LTS buds, 
who have since password-protected the boot process for... <em>most</em> physical computers in the building.</div>
