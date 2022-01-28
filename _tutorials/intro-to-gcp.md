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


# Part 1: Sign up for Google Cloud Platform (GCP)

**Important:** Do the following while signed in to the Google account that you
want to use with GCP.

* Visit <https://cloud.google.com> and click "Get started for free."
* Make sure you are signed in to Google with the account you want to use with GCP.
* Step 1 of 2: Agree to the terms of service.
* Step 2 of 2: Choose "Account type" > "Individual". Complete the sign-up form. Provide a credit card.

    <div class='alert alert-info'><strong>Why a credit card?</strong> Google still requires a credit card to make sure you are not a robot. Google will not autocharge your account unless you manually upgrade to a paid plan.</div>

* Click "Start my free trial".


# Part 2: Purchase the lab virtual machine access package

To get access to the Google Cloud Platform virtual machines created for the labs
on this site, [visit the storefront]({{ site.baseurl }}/store) and follow
instructions there to purchase access to the "lab virtual machine access
package". This will give your gcp email address access to certain Kali GCP
images used for this class.


# Part 3: Create a new project and launch a new Kali Linux instance

Once you have purchased access and your gcp email address has been added to the infosec-management google group, do the following:

* Return to <https://console.cloud.google.com>
* Then, create a new "project" which will house all of the material for this class.
  1. Click "create project"
     {% include lab-image.html image='gcp-create-project.png' %}
  2. Choose a name for your project, and for the "Location," choose "No Organization".
     {% include lab-image.html image='gcp-choose-organization.png' %}
* Then, expand the hamburger menu and navigate to the ["Compute Engine"](https://console.cloud.google.com/compute) area. Click to enable. Wait a few minutes for Compute Engine to set up.
  {% include lab-image.html image='gcp-go-to-compute.PNG' width="300px" %}
* Click "Enable."
  {% include lab-image.html image='Enable.png' width="300px" %}
* Click "Create Instance".
  {% include lab-image.html image='kali-custom-image-0.png' width="300px" %}
* Use the following settings or the first set of options:
  {% include lab-image.html image='kali-custom-image.png' %}
    1. In the "name" field, enter any name for your instance, such as "kali".
    2. Set the "Region" field to "us-central1". The "Zone" can be anything within
       that zone.
    3. Set the "Series" field set to "N1"
    4. Change the "Machine type" field to "n1-standard-4 (4 vCPU, 15 GB memory)"
    5. For the "CPU platform" field:
       1. Click the "CPU platform and GPU" dropdown to expand this menu section
          {% include lab-image.html image='gcp-cpu-dropdown.png' %}
       2. Select "Intel Haswell or later".

* Use the following settings for the "Boot disk" field:
  {% include lab-image.html image='kali-custom-image-2.png' %}
  1. Click "Change".
  2. Select the "Custom images" tab.
  3. Click "Select a Project." Click the "All" tab to see all projects.
     Choose "security-assignments-kali".
     {% include lab-image.html image='kali-custom-image-6.png' %}
  4. Select the most recent Kali version that you see.
  5. Set "Boot disk type" to "Standard persistent disk"
  6. Under the "Size (GB)" field, you can choose a value between 500GB (the image size)
     and 1,000GB (the quota limit for new accounts).

     The labs don't require anywhere near even 500GB disk space, but with cloud computing, the more space that you allocate for your drive, _the better performance they give to read/write operations for your instance._


* Click the "Create" button.

  {% include lab-image.html image='kali-custom-image-3.png' %}

* Wait a few minutes for your image to boot.
  1. Once it does, it will show a checkmark.
  2. Connect to your instance via `ssh`.
     If it fails to connect, try again (the system may not have finished booting).

     {% include lab-image.html image='kali-custom-image-4.png' %}

     You should see a browser window pop up that looks like the following image. **Leave this popup open** -- you will need it for the next step.

     {% include lab-image.html image='kali-custom-image-5.png' %}


# Part 4: Connect to your Kali Linux VM using Chrome Remote Desktop

Setting up Chrome Remote Desktop (CRD) will enable you to graphically connect
to your Kali instance, from your browser, using a Google account to sign in. You
should be able to log in as long as your Kali instance is running on GCP.

* Open another browser window, and visit [https://remotedesktop.google.com/headless](https://remotedesktop.google.com/headless).
* Click the "Begin" button.
* Click the "Next" button. (Chrome Remote Desktop is already installed on Kali).
* Click the "Authorize" button.
* Select your personal Google account and click the "Allow" button.
* Click the icon to the right of the Debian Linux command to copy the command:

  {% include lab-image.html image='Debian-copy.jpg' %}

* Switch to your browser window with the ssh connection to Kali, paste in the command you copied into the Kali Linux command line. Press `enter`.
  * [This document describes how to copy-paste into the GCP browser ssh window. ](https://cloud.google.com/compute/docs/ssh-in-browser?hl=en#copypaste)

  {% include lab-image.html image='Kali_connect.png' %}

* Enter and re-enter a six-digit pin. Press enter.
  * You will not see any visual feedback as you enter a pin. This is normal.

  <div class='alert alert-warning'><strong>Did you get an OAuth error?</strong> This
  may happen if something went wrong when you ran the command copied , and if you tried
  to run it again. The copied command is only valid for one attempt. You will need to start this section over again, to obtain another authorization url, which will have a new auth token embedded.</div>

* Switch back to the window with **remotedesktop.google.com** open. Click the "Remote
  Access" link at the top or visit <https://remotedesktop.google.com/access>.

* Click on your Kali instance.

  {% include lab-image.html image='Kali-remote.png' %}

* Type in your six-digit pin, and check the box so that your browser remembers the pin.

  <div class='alert alert-info'><strong>Can't get to the pin-entry screen?</strong> Try a different web browser, such as Google Chrome.
  Also try disabling any browser extensions that may be interfering.</div>

* Next, if you are prompted to enter a password to create a "color managed device", type in the password `toor`, and click `authenticate`.

  {% include lab-image.html image='color-management.png' %}

* After you finish logging in, you should see a screen like the following:

  {% include lab-image.html image='Kali-setup.png' %}

* Note that if you click the blue arrow tab on the right hand of the screen, it opens additional options in Chrome Remote Desktop. **Take this opportunity to enable copy-paste across your remote desktop session.**

  {% include lab-image.html image='Kali-remote-options.png' %}

 <div class='alert alert-info'><strong>Enabling copy-paste.</strong> It is possible
 to enable copy-paste between your host computer and your Kali instance. Look in
 the above-shown sidebar
 additional options for a related option if you are having trouble copy-pasting. The
 specific enabling method changes from time to time, but is usually accessible through
 the sidebar.</div>

<div class='alert alert-warning'>If you have suspended or stopped your instance,
you will need to navigate to the GCP console and start it again before attempting
to connect with CRD.</div>

# Part 5: Set up budget alerts

You get $300 in free credits when you sign up for google cloud platform. As of 8/27/2019, the Kali instance that you launch will cost almost $200 per month
if you run it continuously. _So do not run it continuously._ Shut down the instance when you are not using it. You are only billed by GCP for time that your instance
is _running_.

You can either suspend, shut down, or delete an instance. Which you choose will
depend on your needs, but be aware that suspended instances
[still incur some costs](https://cloud.google.com/compute/vm-instance-pricing).

{% include lab-image.html image='gcp-shutdown-suspend.png' %}

The semester is about four months long, so set up a budget planning to spend (no more than) $75 per month. To do so:

*   Click the hamburger menu on the upper left > `Billing` > `Budgets & alerts`.
*   `Create Budget`

    {% include lab-image.html image='gcp-budget-create.png' %}

*   `(1) Scope` > Projects => "All projects"

    {% include lab-image.html image='gcp-budget-1-scope.png' %}

*   `(2) Amount` > `Budget type` => "Specified amount", `Target amount` => $75, _uncheck_ "Include credits in cost."

    {% include lab-image.html image='gcp-budget-2-amount.png' %}

*   `(3) Actions` > Set four thresholds -- one for each week of the month -- at 25%, 50%, 75%, and 100%. When you have hit these thresholds within
    a month, you will receive a budget notificaiton email.

    {% include lab-image.html image='gcp-budget-3-actions.png' %}

These budget reminders will help you to keep an eye on your costs, and will help remind you to shut down an instance that could otherwise cost you a lot of money.

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
