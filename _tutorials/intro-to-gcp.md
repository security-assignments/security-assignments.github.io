---
layout: assignment
title: Introduction to Google Cloud Platform
published: true
number: 3
---

# Part 1: Join the class Google Group

To get access to the Kali virtual machine created for this class:

{% if site.instructorcollab_username == 'aov' %}
1. If you don't already have one, create a personal Google account by signing up for one [here](https://accounts.google.com/SignUp).
<div class='alert alert-danger'><strong>Heads up!</strong> Your TUmail Google account will not work with Google Cloud Platform. You'll need to use a personal Google account.</div>
{% endif %}
1. While logged into your personal Google account, visit [this link](https://groups.google.com/forum/#!forum/infosec-management/join) to join the Google Group (public access) for this class.
2. Click "Join this group."

{% include lab-image.html image='Join-Google-Group.png' %}

# Part 2: Sign up for Google Cloud Platform (GCP)

* Visit [https://cloud.google.com](https://cloud.google.com) and click "Get started for free."
* Make sure you are signed in to Google with your personal account {% if site.instructorcollab_username == 'aov' %} (not your TUmail Google account).{% endif %}
* Step 1 of 2: Agree to the terms of service.
* Step 2 of 2: Choose "Account type" > "Individual". Complete the sign-up form. Provide a credit card.

    <div class='alert alert-info'><strong>Why a credit card?</strong> Google still requires a credit card to make sure you are not a robot. Google will not autocharge your account unless you manually upgrade to a paid plan.</div>

* Click "Start my free trial".

# Part 3: Create a new project and launch a new Kali Linux instance

* First, create a new "project" which will house all of the material for this class.
* Then, expand the hamburger menu and navigate to the ["Compute Engine"](https://console.cloud.google.com/compute) area. Wait a few minutes for Compute Engine to set up.
  {% include lab-image.html image='gcp-go-to-compute.PNG' %}
* Click "Create".
* In the "name" field, enter a name like "kali-linux-vm" (must be all lowercase).
* Give your new virtual machine instance the following specs:
    * **Important:** Leave the "Region" field set to "us-central1".
    * Leave the "Series" field set to "N1"
    * Change the "Machine type" field to "n1-standard-4 (4 vCPU, 15 GB memory)"
    * Click the "CPU platform and GPU" link.

    {% include lab-image.html image='GCP-CPU-platform.jpg' %}
    * Give it at least 4 vCPU and 15 GB memory
    * For the "CPU platform" field, select "Intel Haswell or later" for CPU platform.

    * For the "Boot disk" field, click "Change".
        * Select the "Custom images" tab.
        * In the "Show images from" field, select, "infosec management"
        * Select the most recent Kali version that you see.
        * Leave "Boot disk type" "Standard persistent disk"
        * Under the "Size (GB)" field, select the default size of "500".

            We won't use anywhere near that much, but on cloud computing, the more space that you allocate for your drive, _the better performance they give to read/write operations for your instance._

        Your boot disk settings should look like this:

        {% include lab-image.html image='kali-custom-image.png' %}

        * Click the "Select" button.


* Your overall settings should look like this:

{% include lab-image.html image='kali-custom-image2.png' %}  

* Click the "Create" button.
* Wait a few minutes for your image to boot. Once it does, connect to it via `ssh`:

  {% include lab-image.html image='gcloud-ssh-v2.png' %}

* You should see a browser window pop up that looks like the following:

  {% include lab-image.html image='gcp-ssh-connected.png' %}

  The "@kali" after your username shows that you are connected to your Kali VM workstation.

# Part 4: Connect to your Kali Linux VM using Chrome Remote Desktop

* Open another browser window, and visit [https://remotedesktop.google.com/headless](https://remotedesktop.google.com/headless).
* Click the "Begin" button.
* Click the "Next" button.
* Click the "Authorize" button.
* Select your personal Google account and click the "Allow" button.
* Click the icon to the right of the Debian Linux command to copy the command:

  {% include lab-image.html image='Debian-copy.jpg' %}

* Switch to your browser window with Google Cloud Platform open, and right-click in the gcloud terminal to paste in the command you copied into the Kali Linux command line. Press enter.

  {% include lab-image.html image='Kali_connect.png' %}

* Enter a name for this image, e.g., "Kali".
* Enter and re-enter a six-digit pin. Press enter.
* Switch back to the window with **remotedesktop.google.com** open. Click the "Remote Access" link at the top or visit [this link](https://remotedesktop.google.com/access).

* Click on your Kali instance.

  {% include lab-image.html image='Kali-remote.png' %}

* Type in your six-digit pin, and check the box so that your browser remembers the pin.

* If a screen asks you to select a session type, click "OK" to accept the default.

  {% include lab-image.html image='default-session.png' %}

  * Next, if you are prompted to enter a password to create a "color managed device", type in the password `toor`, and click `authenticate`.

  {% include lab-image.html image='color-management.png' %}

* After you finish logging in, you should see a screen like the following:

  {% include lab-image.html image='Kali-setup.png' %}

* Note that if you click the blue arrow tab on the right hand of the screen, it opens additional options in Chrome Remote Desktop:

  {% include lab-image.html image='Kali-remote-options.png' %}

# Part 5: Set up budget alerts

You get $300 in free credits when you sign up for google cloud platform. As of 8/27/2019, the Kali instance that you launch will cost almost $200 per month
if you run it continuously. _So do not run it continuously._ Shut down the instance when you are not using it. You are only billed by GCP for time that your instance
is _running_.

The semester is about four months long, so set up a budget planning to spend (no more than) $75 per month. To do so:

*   Click the hamburger menu on the upper left > `Billing` > `Budgets & alerts`.
*   `Create Budget`

    {% include lab-image.html image='gcp-budget-create.png' %}

*   `(1) Scope` > Projects => "All projects"

    {% include lab-image.html image='gcp-budget-1-scope.png' %}

*   `(2) Amount` > `Budget type` => "Specified amount", `Target amount` => $75, _uncheck_ "Include credits in cost."

    {% include lab-image.html image='gcp-budget-2-amount.png' %}

*   `(3) Actions` > I recommend setting four thresholds -- one for each week of the month -- at 25%, 50%, 75%, and 100%. When you have hit these thresholds within
    a month, you will receive a budget notificaiton email.

    {% include lab-image.html image='gcp-budget-3-actions.png' %}

These budget reminders will help you to keep an eye on your costs, and will help remind you to shut down an instance that could otherwise cost you a lot of money.

# Part 6: Complete the Introduction to Linux Tutorial

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

{% if site.instructorcollab_domain == 'colorado.edu' %}
{% include lab-image.html image='gcp-kali-chrome-remote-proof.png' %}
{% elsif site.instructorcollab_domain == 'temple.edu' %}
{% include lab-image.html image='gcp-kali-chrome-remote-proof-tv.png' %}
{% endif %}
