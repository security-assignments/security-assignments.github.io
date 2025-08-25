---
layout: assignment
title: Introduction to Google Cloud Platform
published: true
number: 3
include_toc: true
---

# Part 0: Choose a Google account

In this tutorial, you will use a Google account to sign up for Google Cloud Platform (GCP). You will also join a Google Group with this account, which will give you
access to certain GCP resources.

Choose an `@gmail.com` Google account you will use. **Important:** It must be an `@gmail.com` Google account.

You have several options:
* You can use a personal Google account that you already have
* You can create a new personal Google account by signing up for one
  [here](https://accounts.google.com/SignUp)
* If you have a non-`@gmail.com` google account (perhaps through your
  university), it won't work for GCP unless the domain admin has enabled
  creation of GCP resources by your account. **For example, `@temple.edu` GCP
  accounts will not be able to create projects on GCP.** If this is the case,
  use a personal Google account.

Regardless, whenever you use GCP, be sure that you are accessing the platform
while signed in to the correct Google account. Otherwise, you may be confused
to not see expected projects or to get "access denied" messages.

<div class='alert alert-info'><strong>Tip:</strong> You can use a browser
incognito window to make sure you are signed in to the correct google account.
In this window, sign in <em>only</em> to the google account you want to use with
GCP.</div>


# Part 1: Purchase the lab virtual machine access package

To get access to the Google Cloud Platform virtual machines created for the labs on this site, [visit the storefront]({{ site.baseurl }}/store) and follow instructions there to purchase access to the "lab virtual machine access package". During the purchase process, you will specify a `@gmail.com` Google account that you want to use to access GCP for this class. Purchasing access will give your that `@gmail.com` email address access to certain Kali GCP images used for this class.

<p class='text-center'><a class='btn btn-primary text-center' href='{{ site.baseurl }}/store'>Go to the storefront</a></p>

# Part 2: Sign up for Google Cloud Platform (GCP)

**Important:** Do the following while signed in to the Google account for which you purchased class material access.

1. Visit <https://console.cloud.google.com>. Click "Try for Free".
2. Check that you are signed in to Google with your correct account.
3. Step 1 of 2: 
   - Ensure once again that you are signed in with the Google `@gmail.com` account you want to use with GCP. 
   - Agree to the terms of service.
4. Step 2 of 2: Choose "Account type" > "Individual". Complete the sign-up form. Provide a credit card.
5. Click "Start my free trial".

<div class='alert alert-info'><strong>Why is a credit card required?</strong> Google still requires a credit card to make sure you are not a robot. Google will not autocharge your account unless you manually upgrade to a paid plan.</div>


---

{% include lab-image.html caption='Visit the <a href="https://console.cloud.google.com">GCP Cloud Console</a>' image='intro-to-gcp/gcp-console-welcome.png' %}

{% include lab-image.html caption='Step 1: Ensure you are signed in with the same Google `@gmail.com` account you used for the lab virtual machine access package purchase. ' image='intro-to-gcp/gcp-signup-account-info.png' %}

{% include lab-image.html caption='Step 2: Create a new payment profile' image='intro-to-gcp/gcp-signup-payment-1.png' %}

{% include lab-image.html caption='Step 2: Create an "Individual"-type payment profile' image='intro-to-gcp/create-payment-profile.png' %}

{% include lab-image.html caption='Step 2: Confirm the new payment profile information' image='intro-to-gcp/gcp-signup-payment-verify-with-card.png' %}

{% include lab-image.html caption='You can skip the opening questionnaire' image='intro-to-gcp/welcome-skip.png' %}









# Part 3: Create a new project and launch a new Kali Linux instance

Ensure before beginning this step that you have completed parts 1 and 2, after which you should have a GCP account with access to the course lab GCP materials. Then, do the following on <https://console.cloud.google.com>:





## Part 3.1: Create a new project

* Create a new project which will house all of the material for this class.
  1. Click "New Project"
  2. Choose a name for your project, and for the "Location," choose "No Organization".

---

{% include lab-image.html caption='(1) Click the "Project" dropdown on the top, then (2) click "New Project".' image='intro-to-gcp/welcome-new-project.png' %}

{% include lab-image.html caption='Give your project a name such as "My Security Class Project". Ensure its Location is "No Organization". Click "Create".' image='intro-to-gcp/new-project-name-type.png' %}

{% include lab-image.html caption='Select your new project. Ensure that the project dropdown selector now shows your new project name.' image='intro-to-gcp/select-new-project.png' %}


## Part 3.2: Enable the Compute Engine API

1. Click "Create a VM" to navigate to the ["Compute Engine"](https://console.cloud.google.com/compute) area. 
2. Click "enable". Wait a few minutes for Compute Engine to set up.

---

{% include lab-image.html caption='Select "Create a VM".' image='intro-to-gcp/choose-create-vm.png' %}

{% include lab-image.html caption='Enable the Compute Engine API. This will take a few minutes to complete.' image='intro-to-gcp/compute-engine-enable.png' %}





## Part 3.3: Create your Kali Compute Instance

Follow the steps in the images and image-captions below.


{% include lab-image.html caption='On the VM instances screen, click "Create Instance".' image='intro-to-gcp/compute-engine-enabled-create-instance.png' %}

{% include lab-image.html caption='VM machine configuration settings. (1) Set name to `kali`; (2) set region to "us-west1"; (3) set the machine type Series to "N1"; (4) for the machine type, choose `n1-standard-4`; (5) set CPU platform to "Intel Haswell or later"; Do *not* yet click "create".' image='intro-to-gcp/gcp-create-instance-settings-2.png' %}

{% include lab-image.html caption='VM OS and storage settings. (1) Click "OS and storage". (2) Click "Change".' image='intro-to-gcp/gcp-create-instance-settings-3.png' %}

{% include lab-image.html caption='Boot Disk project select -- (1) Click "Custom Images." (2) Click "change". (3) Select `All`. (4) select project `security-assignments-kali`. You should be able to see and select this project if you are using a Google account that has purchased access to the class lab materials.' image='intro-to-gcp/boot-disk-project-select.png' %}

{% include lab-image.html caption='Boot Disk. With "Custom Images" selected and with the project set to `security-assignments-kali`, (1) click the "Image" dropdown and select the most recent Kali image. Then, (2) set the "Boot disk type" to "Standard persistent disk". (3) Choose "Select"' image='intro-to-gcp/boot-disk-settings-2.png' %}


{% include lab-image.html caption='Create the instance -- (1) Review the configuration; (2) review the estimated cost; (3) click "Create"' image='intro-to-gcp/boot-disk-create.png' %}

---

<div class='alert alert-info'><strong>Heads up!</strong> GCP might later suggest that your instance is over-provisioned, and that you should downgrade it to something with less memory. If you do this and switch to an instance with less than 7.5 GB memory, then you won't be able to launch some of the memory-intensive virtual machines, such as the Windows one.</div>
       
   
<div class='alert alert-info'><strong>Do you get an error message saying that a N1 instance is not available?</strong> You might get an error message such as the following: <code>Failed to start kali, A n1-standard-4-VM instance is currently unavailable in [your regional zone]. Alternatively, you can try your request again with a different VM hardware configuration or at a later time.</code> If you get this error message, first try a different regional zone. Then, you can check a different N1-series machine type for availability, such as <code>n1-standard-2</code>. Or you could try an N2-series instance, with machine-type <code>n2-standard-4</code>, and with CPU platform <code>Automatic</code></div>




## Part 3.4: Connect to your instance via SSH-in-browser

1. Wait a few minutes for your image to boot. Once it has booted, it will show a checkmark.
2. Connect to your instance via `ssh`.

   If it fails to connect, try again (the system may not have finished booting).

   You should see a browser window pop up that looks like the following image. **Leave this popup open** -- you will need it for the next step.


---

{% include lab-image.html caption='Once the instance has been created, click SSH to connect to your instance via "SSH-in-browser"' image='intro-to-gcp/instance-created-ssh.png' %}

{% include lab-image.html caption='Authorize "SSH-in-browser"' image='intro-to-gcp/ssh-in-browser-authorize.png' %}

{% include lab-image.html caption='You should see a shell prompt to your Kali instance in the SSH-in-browser window' image='intro-to-gcp/kali-custom-image-5.png' %}









# Part 4: Connect to your Kali Linux VM using Chrome Remote Desktop

Setting up Chrome Remote Desktop (CRD) will enable you to graphically connect to your Kali instance, from your browser, using a Google account to authenticate. You should be able to access your instance from anywhere as long as your Kali instance is running on GCP, and as long as your traffic is not blocked by a local firewall, such as may happen on university Guest WiFi networks.


* Open another browser window, and visit [https://remotedesktop.google.com/headless](https://remotedesktop.google.com/headless).
* Click the "Begin" button.
* On the "Download and Install" page, click the "Next" button. (Chrome Remote Desktop is already installed on Kali).
* Click the "Authorize" button.
* Select your personal Google account and click the "Allow" button.
* Click the "copy" icon to the right of the Debian Linux command to copy the command.
* Switch to your browser window with the ssh connection to Kali, paste in the command you copied into the Kali Linux command line. Press `enter`.
  * [This document describes how to copy-paste into the GCP browser ssh window. ](https://cloud.google.com/compute/docs/ssh-in-browser?hl=en#copypaste)
* Enter and re-enter a six-digit pin. Press enter.
  * You will not see any visual feedback as you enter a pin. This is normal.

  <div class='alert alert-warning'><strong>Did you get an OAuth error?</strong> This
  may happen if something went wrong when you ran the command copied , and if you tried
  to run it again. The copied command is only valid for one attempt. You will need to start this section over again, to obtain another authorization url, which will have a new auth token embedded.</div>

* Switch back to the window with **remotedesktop.google.com** open. Click the "Remote
  Access" link at the top or visit <https://remotedesktop.google.com/access>.
* Click on your Kali instance.
* Type in your six-digit pin, and check the box so that your browser remembers the pin.
  <div class='alert alert-info'><strong>Can't get to the pin-entry screen?</strong> Try a different web browser, such as Google Chrome.
  Also try disabling any browser extensions that may be interfering.</div>
* Next, if you are prompted to enter a password to create a "color managed device", type in the password `toor`, and click `authenticate`.
* After you finish logging in, you should see the Kali Desktop screen.
* Enable copy-paste across your remote desktop session.

  - Click the blue arrow tab on the right hand of the screen to open additional options in Chrome Remote Desktop.
  - Look for an option to "Enable clipboard synchronization." Follow prompts in your browser to grant permission. See [this example](https://superuser.com/a/1543231).

    <div class='alert alert-info'>The specific method to enable copy-paste changes from time to time, but is usually accessible through the sidebar.</div>

<div class='alert alert-warning'>If you have suspended or stopped your instance,
you will need to navigate to the GCP console and start it again before attempting
to connect with CRD.</div>


---

{% include lab-image.html caption='From the "Set up via SSH" tab, choose "Begin"' image='intro-to-gcp/crd-setup-begin.png' %}

{% include lab-image.html caption='Skip the "Download and install" step; Chrome Remote Desktop is already installed on your Kali instance.' image='intro-to-gcp/crd-setup-package-skip.png' %}

{% include lab-image.html caption='Click "Authorize". You can use any Google account you like.' image='intro-to-gcp/crd-setup-authorize.png' %}

{% include lab-image.html caption='Copy the "Debian Linux" remote command text. It contains a code that will connect your Kali instance\'s Chrome Remote Desktop process to your Google account. Note -- this code is single-use only.' image='intro-to-gcp/crd-setup-command-copy.png' %}

{% include lab-image.html caption='Paste the command you copied into your Kali SSH-in-browser window and press `enter`.' image='intro-to-gcp/crd-setup-command-paste.png' %}

{% include lab-image.html caption='Enter and re-enter any 6-digit pin of your choosing. The WARNING message can be ignored.' image='intro-to-gcp/crd-setup-select-pin.png' %}

{% include lab-image.html caption='Back on `remotedesktop.google.com`, select the "Remote Access" tab. Select your kali instance.' image='intro-to-gcp/crd-access-select-instance.png' %}

{% include lab-image.html caption='Enter the 6-digit pin you chose on the earlier step.' image='intro-to-gcp/crd-access-enter-pin.png' %}

{% include lab-image.html caption='If prompted, allow clipboard access. If you are prompted to enter a password to create a “color managed device”, type in the password `toor`, and click "Authenticate".' image='intro-to-gcp/crd-allow-clipboard-1.png' %}


# Part 5: Set up budget alerts

You get $300 in free credits when you sign up for google cloud platform. As of 8/27/2019, the Kali instance that you launch will cost almost $200 per month
if you run it continuously. _So do not run it continuously._ Shut down the instance when you are not using it. You are only billed by GCP for time that your instance
is _running_.

You can either suspend, shut down, or delete an instance. Which you choose will
depend on your needs, but be aware that suspended instances
[still incur some costs](https://cloud.google.com/compute/vm-instance-pricing). (See [figure](#intro-to-gcp-gcp-shutdown-suspend-png).)

Set up a budget planning to spend (no more than) $75 per month. To do so:

*   Use the search bar at the top of the page to find the `Budgets & alerts` page.
*   Click `Create Budget`
*   Use the following configuration:
    * `(1) Scope`
      - `Projects` => "All projects"
      - `Services` => "All services"
      - _uncheck_ "Discounts" and "Promotions and others"

    * `(2) Amount`
      - `Budget type` => "Specified amount"
      - `Target amount` => $75

    * `(3) Actions`
      - Set four thresholds, at 25%, 50%, 75%, and 100%. When you have hit these thresholds within a month, you will receive a budget notification email.

These budget reminders will help you to keep an eye on your costs, and will help remind you to shut down an instance that could otherwise cost you a lot of money.



---


{% include lab-image.html caption='Search for and select "Budgets & Alerts".' image='intro-to-gcp/access-budgets-alerts.png' %}

{% include lab-image.html caption='Click "Create Budget"' image='intro-to-gcp/create-budget-button.png' %}

{% include lab-image.html caption='(1) Choose any name; (2) set the "Time range" to "Monthly", (3) Deselect "Discounts" and "Promotions and others"; (4) click "Next"' image='intro-to-gcp/gcp-create-budget-1.png' %}

{% include lab-image.html caption='Set a budget amount of $75' image='intro-to-gcp/gcp-create-budget-2-amount.png' %}

{% include lab-image.html caption='(1) Set actions at 25, 50, 75, and 100 "Percent of budget"; (2) Leave the default for "Manage notifications." (3) Click "Finish"' image='intro-to-gcp/gcp-create-budget-3-actions.png' %}

{% include lab-image.html caption='To minimize costs, shut down or suspend your Kali instance when not using it for a prolonged period.' image='intro-to-gcp/gcp-shutdown-suspend.png' %}



# Part 6: Install a GCP Console app on a mobile device

You can manage your GCP instances from the
[Cloud Console Mobile App](https://cloud.google.com/console-app).
This can be handy if you realize that you have
accidentally left an instance running -- you can easily shut it down from the app.

# Part 7: Complete the Introduction to Linux Tutorial

Complete [this introduction to Linux tutorial]( {{ '/tutorials/intro-to-linux.html' | relative_url }}).
Then, come back and complete the deliverable for this tutorial.

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

{% include lab-image.html image='gcp-kali-chrome-remote-proof-tv.png' %}
