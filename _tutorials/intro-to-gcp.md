---
layout: assignment
title: Introduction to Google Cloud Platform
published: true
number: 3
---


# Part 0: Complete Intro to Linux Tutorial

Complete [this intro-to-linux tutorial]( {{ '/tutorials/intro-to-linux' | relative_url }})


# Part 1: Sign up for Google Cloud Platform (GCP)

* Visit [https://cloud.google.com](cloud.google.com) and click "Get started for free."
*   Sign in to Google with your personal account (not your Temple Google account).
*   Send your personal Gmail address via email or Slack to I can make the Kali Linux VM available to you.
*   Step 1 of 2: Agree to the terms
*   Step 2 of 2: Choose "Account type" > "Individual". Complete the sign-up form. Provide a credit card.

    <div class='alert alert-info'><strong>Why a credit card?</strong> Google still requires a credit card to make sure you are not a robot. Google will not autocharge your account unless you manually upgrade to a paid plan.</div>

* Create a "project" which will house all of the material for this class.



# Part 2: Complete the "Try Compute Engine" tutorial.

Complete the "try compute engine" tutorial. This tutorial will give you experience with launching, connecting to, and destroying virtual instances. 

When the tutorial prompts you to destroy all tutorial instances, do so.

<img src='{{ '/assets/images/try_compute_engine.png' | relative_url }}' />


# Part 3: Complete walkthrough for "Chrome Remote Desktop on GCP"

Complete [this walkthrough](https://cloud.google.com/solutions/chrome-desktop-remote-on-compute-engine). This tutorial will step you through
launching a "headless" (graphical-desktop-less) server, installing a desktop suite, and then configuring Chrome Remote Desktop, which will allow
you to remotely connect to a graphical user interface for this server.

Notes for the walkthrough:

*   Choose the XFCE desktop. It's more lightweight.
*   When the tutorial prompts you to destroy all tutorial instances, do so.




# Part 4: Create a new instance based on a custom Kali images prepared for this class

A customized image of the Kali penetration-testing operating system, based on Debian, has been prepared for this class for your use.

<strong>Please note:</strong> It already has chrome remote desktop services installed, as well as the XFCE desktop.

Launch your new instance with the following specs:

* Give it at least 4 vCPU and 15 GB memory
* Specify "Intel Haswell or later" for CPU platform

  ![]( {{ '/assets/images/kali-instance-specs.png' | relative_url }} )

* For boot disk
    * click `Change` > `Custom Images` > `Show Images from "infosec management"` > choose the most recent Kali version that you can see.
    * Down towards the bottom of the boot disk selection screen, give your drive something like 500GB or 1,000 GB storage space. We won't use anywhere near that much,
      but on cloud computing, the more space that you allocate for your drive, _the better performance they give to read/write operations for your instance._ So 
      beef up, storage space is cheap!

  ![]( {{ '/assets/images/kali-custom-image.png' | relative_url }} )

* Once your image has booted (wait a few minutes), connect to it via `ssh`, using the `gcloud` method -- _not_ the default browser-based method.
  The `gcloud` command will paste ssh connect code down into a gcloud terminal -- <strong>you have to press "enter" to run that code and establish the ssh connection</code>.
  
  If you are still in `gcloud`, and not `kali`, the prompt will be yellow. If you have a connection to kali, the prompt will be red.
  Look closely at the last image below -- it shows username@kali in red. That is important -- that means that a successful <code>ssh</code> connection to kali
  has been made. You have to hit "enter"
  
  <div class='alert alert-info'><strong>Are you being asked for a passphrase when you run the gcloud connect command?</strong> When you first try to connect to an instance using <code>gcloud</code>,
  gcp generates ssh keys for you. ssh keys may optionally have an associated passphrase encrypting them. If you set a passphrase and cannot remember it, you can wipe out your keys and attempt another
  connection -- gcp will then prompt you to regenerate your keys. I personally leave the passphrases for gcp keys 'blank' when prompted.
  
  <div>
  To wipe out your keys, you can run the following from a gcloud prompt:
  
    <code>
    rm ~/.ssh/*
    </code>
  </div>
  </div>
  
  
  
  <div class='alert alert-danger'><strong>Heads up! </strong> The `ssh` browser-based connection method is not working for this image. 
  But connecting via gcloud console <em>is</em> working. To do so, click the drop-down next to "ssh" from the instances dashboard, as shown below. 
  
  </div>

  ![]( {{ '/assets/images/gcp-ssh-view-gcloud-command.png' | relative_url }} )
  
  ![]( {{ '/assets/images/gcp-ssh-run-in-cloud-shell.png' | relative_url }} )
  
  ![]( {{ '/assets/images/gcp-ssh-connected.png' | relative_url }} )
  
* After successfully connecting to Kali command line using the `gcloud` method, follow the steps in the walkthrough for the Chrome Remote Desktop on [Configuring and starting the Chrome Remote Desktop service](https://cloud.google.com/solutions/chrome-desktop-remote-on-compute-engine#configuring_and_starting_the_chrome_remote_desktop_service) to connect the graphical XFCE desktop on Kali.
	* Set the name to something like "Kali VM"



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
