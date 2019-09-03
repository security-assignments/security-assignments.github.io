---
layout: assignment
title: Introduction to Linux
---

# Part 1. Complete this very gentle introduction to the Linux terminal

CodeAcademy has an [introductory set of lessons](https://www.codecademy.com/learn/learn-the-command-line) that teach the Linux Terminal. 
You should complete the first lesson-set within each module:

1. Navigating the File System
    1. [Navigation](https://www.codecademy.com/courses/learn-the-command-line/lessons/navigation/resume)
2. Viewing and Changing the File System
    1. [Manipulation](https://www.codecademy.com/courses/learn-the-command-line/lessons/command-line-manipulation/exercises/ls-revisited)
3. Redirecting Input and Output
    1. [Redirection](https://www.codecademy.com/courses/learn-the-command-line/lessons/redirection/resume)
4. Configuring the Environment
    1. [Environment](https://www.codecademy.com/courses/learn-the-command-line/lessons/environment/resume)

You do _not_ need to do any of the "projects" or multiple choice quizzes. Just the lesson-sets.
  
  
  
# Part 2. Play the Bandit wargame on OvertheWire.org

Play the [Bandit wargame on OvertheWire.org](http://overthewire.org/wargames/bandit/). Start at Level 0 and complete Level 15 (which gives you the password for Level 16).

To play, you'll need to connect to the Bandit server using an SSH client. SSH stands for **S**ecure **SH**ell, and allows you to remotely control a server using a command line interface. SSH is secure because your connection to the server is encrypted using a symmetric cipher like AES. It also uses asymmetric cryptography such as RSA to establish the server's identity.


## Using SSH on Windows

If you're using Windows, download [Putty](https://www.putty.org) for Windows.

Enter the username (bandit0), server address, and port (2220) into putty like so:

![img]( {{ "/assets/images/putty-connection.png" | relative_url }})

Click the `Open` button. You'll be presented with a message like the following:

![img]( {{ "/assets/images/putty-public-key.png" | relative_url }})

This message tells you that you haven't connected to this server before. The Bandit server is using a ECDSA asymmetric key pair, which is similar to RSA. The fingerprint is a hash of the server's public key. To learn more about verifying SSH fingerprints, see [here](https://www.phcomp.co.uk/Tutorials/Unix-And-Linux/ssh-check-server-fingerprint.html).

To continue logging in, click the `Yes` button.


## Using SSH on MacOS

If you're using a Mac, open `Terminal.app` and use the `ssh` command to connect to the Bandit server, like so:

`ssh -p 2220 bandit0@bandit.labs.overthewire.org`

When you first connect to a sever using SSH, you'll see a message like the following:

![img]( {{ "/assets/images/ssh-warning.png" | relative_url }})

This message tells you that you haven't connected to this server before. The Bandit server is using a ECDSA asymmetric key pair, which is similar to RSA. The fingerprint is a hash of the server's public key. To learn more about verifying SSH fingerprints, see [here](https://www.phcomp.co.uk/Tutorials/Unix-And-Linux/ssh-check-server-fingerprint.html).

To continue logging in, type `yes` and press `enter`.


## Instructions

* When you type in your password, you won't see any characters. This is a security feature to prevent [shoulder surfing](https://en.wikipedia.org/wiki/Shoulder_surfing_(computer_security)). Enter the password `bandit0` and press `enter` to login.
* Start at [Level 0](http://overthewire.org/wargames/bandit/bandit0.html) which requires you to login to the Bandit server using SSH. Next, visit [the Level 0 -> Level 1](http://overthewire.org/wargames/bandit/bandit1.html) for instructions on how to get to the next level. Continue until you successfully complete [Level 15 -> Level 16](http://overthewire.org/wargames/bandit/bandit16.html), which gives you the password for Level 16.
* Use the `man` command and search the web to learn about the recommended commands (i.e., "Commands you may need to solve this level") to help you reach the next level. Learning for yourself how to use new commands is a key part of this tutorial.


# Deliverable

{% if site.instructorcollab_username == 'deargle' %}

Make it all the way to level 16. When you have reached level 16, prove it by taking a screenshot of your ssh terminal session showing:
* you logged in as `bandit16@bandit` in the prompt. 
* your name
* the date. 

For example:

![]( {{ '/assets/images/bandit-level-16-deliverable.png' | relative_url }} )


{% elsif site.instructorcollab_username == 'aov' %}
For each level you complete, take a screenshot of your terminal screen showing the following: 

* Show the password for the next level.
* Run the `date` command to show the current date.
* Print out our name like so: `echo "Your name"`

Add all of the screenshots to Word document and submit the document in the Linux tutorial quiz on Canvas.

![img]( {{ "/assets/images/bandit0.png" | relative_url }})

{% endif %}





# Supplementary -- Optional

## Learn a different Linux text editor

The CodeAcademy lessons above give you basic exposure to the `nano` text editor. However, you are free to use whatever text editor you like, such as `Vim` ([see tutorial here](https://danielmiessler.com/study/vim/)). However, `nano` is good for beginners.


## More thorough walkthrough, but also more difficult

- Using your Kali VM, go through the following sections of <a href='http://www.tldp.org/LDP/intro-linux/intro-linux.pdf'>this Linux tutorial:</a>
	- Chapter 2
		- 2.2
		- 2.3
			- 2.3.1
			- 2.3.2
			- 2.3.3.3
		- 2.5
			- 2.5.3
			- 2.5.4
			- 2.5.5
	- Chapter 3
		- 3.1
			- 3.1.3.1
		- 3.2
			- 3.2.1
			- 3.2.2
			- 3.2.3
			- 3.2.4
		- 3.3 (all)
		- 3.4 (all)
		- 3.6.4
		- 3.6.5
	- Chapter 4
		- 4.1
	- Chapter 5
		- 5.1
		- 5.3
	- Chapter 6
		- Actually, in lieu of reading Chapter 6, read [this note on choosing which text editor to learn]({{ '/note-on-editors/' | relative_url }}), then learn it (i.e., google 'nano tutorial').
	- Chapter 7
		- 7.2.5
		- 7.5.3.2
- Also learn about 
	- <a href='https://www.linux.com/learn/linux-101-introduction-sudo'>sudo</a>
	- man id
	- man 5 passwd
	- man 5 group
	- ssh & scp
