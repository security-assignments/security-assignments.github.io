---
layout: assignment
title: Introduction to Google Cloud Platform
published: true
number: 3
---


# Part 0: Complete Intro to Linux Tutorial

Complete [this intro-to-linux tutorial]( {{ '/tutorials/intro-to-linux' | relative_url }})

# Part 1: Join the class Google Group

To get access to the Kali virtual machine created for this class:

{% if site.instructorcollab_username == 'aov' %}
1. If you don't already have one, create a personal Google account by signing up for one [here](https://accounts.google.com/SignUp).
<div class='alert alert-danger'><strong>Heads up!</strong> Your TUmail Google account will not work with Google Cloud Platform. You'll need to use a personal Google account.</div>
{% endif %}
1. While logged into your personal Google account, visit [this link](https://groups.google.com/forum/#!forum/infosec-management/join) to join the Google Group (public access) for this class.
2. Click "Join this group."

![]( {{ '/assets/images/Join-Google-Group.png' | relative_url }} )

# Part 2: Sign up for Google Cloud Platform (GCP)

* Visit [https://cloud.google.com](https://cloud.google.com) and click "Get started for free."
* Make sure you are signed in to Google with your personal account {% if site.instructorcollab_username == 'aov' %} (not your TUmail Google account).{% endif %}
* Step 1 of 2: Agree to the terms of service.
* Step 2 of 2: Choose "Account type" > "Individual". Complete the sign-up form. Provide a credit card.

    <div class='alert alert-info'><strong>Why a credit card?</strong> Google still requires a credit card to make sure you are not a robot. Google will not autocharge your account unless you manually upgrade to a paid plan.</div>
    
* Click "Start my free trial".

# Part 3: Create a new Kali Linux instance

* Click "[Go to Compute Engine](https://console.cloud.google.com/compute?project=zinc-interface-264705)". Wait a few minutes for Compute Engine to set up.
* Click "Create".
* In the "name" field, enter a name like "kali-linux-vm" (must be all lowercase).
* Give your new virtual machine instance the following specs:
    * **Important:** Leave the "Region" field set to "us-central1".
    * Leave the "Series" field set to "N1"
    * Change the "Machine type" field to "n1-standard-4 (4 vCPU, 15 GB memory)"
    * Click the "CPU platform and GPU" link.
    
    ![]( {{ '/assets/images/GCP-CPU-platform.jpg' | relative_url }} )
    * Give it at least 4 vCPU and 15 GB memory
    * For the "CPU platform" field, select "Intel Haswell or later" for CPU platform.
 
    * For the "Boot disk" field, click "Change".
        * Select the "Custom images" tab.
        * In the "Show images from" field, select, "infosec management"
        * Select the most recent Kali version that you see.
        * Leave "Boot disk type" "Standard persistent disk"
        * Under the "Size (GB)" field, change the size to "1000". 

            We won't use anywhere near that much, but on cloud computing, the more space that you allocate for your drive, _the better performance they give to read/write operations for your instance._ So beef up, storage space is cheap!
                
        Your boot disk settings should look like this:

        ![]( {{ '/assets/images/kali-custom-image.png' | relative_url }} )
        
        * Click the "Select" button.
  
  
* Your overall settings should look like this:
  
![]( {{ '/assets/images/kali-custom-image2.png' | relative_url }} )

* Click the "Create" button.
* Wait a few minutes for your image to boot. Once it does, connect to it via `ssh`, using the `gcloud` method -- _not_ the default browser-based method. To do this, click the arrow to open a dropdown menu and select "View gcloud command":

  ![]( {{ '/assets/images/gcloud-ssh.jpg' | relative_url }} )

* Click "Run in Cloud Shell". 

  ![]( {{ '/assets/images/gcp-ssh-run-in-cloud-shell.png' | relative_url }} )

The `gcloud` command will paste an "ssh connect" command into a gcloud terminal -- <strong>you have to press "enter" to run that code and establish the ssh connection</strong>.
  
* When prompted for a passphrase, hit "enter" twice to leave the passphrase blank.
  
  If you are still in `gcloud`, and not `kali`, the prompt will be yellow. If you have a connection to Kali, the prompt will be red.
  Look closely at the last image below -- it shows username@kali in red. That is important -- that means that a successful <code>ssh</code> connection to kali
  has been made. You have to hit "enter".
  
   ![]( {{ '/assets/images/gcp-ssh-connected.jpg' | relative_url }} )
  
# Part 4: Connect to your Kali Linux VM using Chrome Remote Desktop

* Open another browser window, and visit [https://remotedesktop.google.com/headless](https://remotedesktop.google.com/headless).
* Click the "Begin" button.
* Click the "Next" button.
* Click the "Authorize" button.
* Select your personal Google account and click the "Allow" button.
* Click the icon to the right of the Debian Linux command to copy the command:

  ![]( {{ '/assets/images/Debian-copy.jpg' | relative_url }} )
  
* Switch to your browser window with Google Cloud Platform open, and right-click in the gcloud terminal to paste in the command you copied into the Kali Linux command line. Press enter.

  ![]( {{ '/assets/images/Kali_connect.png' | relative_url }} )

* Enter a name for this image, e.g., "Kali".
* Enter and re-enter a six-digit pin. Press enter.
* Switch back to the window with **remotedesktop.google.com** open. Click the "Remote Access" link at the top or visit [this link](https://remotedesktop.google.com/access).

* Click on your Kali instance.

  ![]( {{ '/assets/images/Kali-remote.png' | relative_url }} )

* Type in your six-digit pin, and check the box so that your browser remembers the pin.
* You should see a screen like the following:

  ![]( {{ '/assets/images/Kali-setup.png' | relative_url }} )
  
* Note that if you click the blue arrow tab on the right hand of the screen, it opens additional options in Chrome Remote Desktop:

  ![]( {{ '/assets/images/Kali-remote-options.png' | relative_url }} )

# Part 5: Set up budget alerts

You get $300 in free credits when you sign up for google cloud platform. As of 8/27/2019, the Kali instance that you launch will cost almost $200 per month 
if you run it continuously. _So do not run it continuously._ Shut down the instance when you are not using it. You are only billed by GCP for time that your instance
is _running_.

The semester is about four months long, so set up a budget planning to spend (no more than) $75 per month. To do so:

*   Click the hamburger menu on the upper left > `Billing` > `Budgets & alerts`.
*   `Create Budget`

    ![]( {{ '/assets/images/gcp-budget-create.png' | relative_url }} )

*   `(1) Scope` > Projects => "All projects"

    ![]( {{ '/assets/images/gcp-budget-1-scope.png' | relative_url }} )
    
*   `(2) Amount` > `Budget type` => "Specified amount", `Target amount` => $75, _uncheck_ "Include credits in cost."

    ![]( {{ '/assets/images/gcp-budget-2-amount.png' | relative_url }} )

*   `(3) Actions` > I recommend setting four thresholds -- one for each week of the month -- at 25%, 50%, 75%, and 100%. When you have hit these thresholds within
    a month, you will receive a budget notificaiton email.
    
    ![]( {{ '/assets/images/gcp-budget-3-actions.png' | relative_url }} )
  
These budget reminders will help you to keep an eye on your costs, and will help remind you to shut down an instance that could otherwise cost you a lot of money.

# Deliverable

Using the Kali VM for the steps below shows both that you got your Kali VM up and running, and that you have basic skills with the Linux terminal. You _must use your Kali GCP instance for the following_. 

* Using a terminal, 
    * make a directory called `linux-tutorial`
    * In that directory, create a file called `i-did-it.txt` with the following contents: `Hello, world!`
* Submit a screenshot showing:
    * The browser tab address showing that you are connected via chrome remote desktop to your kali instance
    * The terrifying kali dragon desktop
    * A terminal window, showing:
        * The contents of `i-did-it.txt`
        * A string with your name and uni email, e.g., `echo "Anthony Vance anthony.vance@temple.edu"`
        * Output of the `date` command
    
For example:

{% if site.instructorcollab_domain == 'colorado.edu' %}
![img]( {{ "/assets/images/gcp-kali-chrome-remote-proof.png" | relative_url }})
{% elsif site.instructorcollab_domain == 'temple.edu' %}
![img]( {{ "/assets/images/gcp-kali-chrome-remote-proof-tv.png" | relative_url }})
{% endif %}
