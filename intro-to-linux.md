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
    1. [Manipulation](https://www.codecademy.com/courses/learn-the-command-line/lessons/manipulation/resume)
3. Redirecting Input and Output
    1. [Redirection](https://www.codecademy.com/courses/learn-the-command-line/lessons/redirection/resume)
4. Configuring the Environment
    1. [Environment](https://www.codecademy.com/courses/learn-the-command-line/lessons/environment/resume)

You do _not_ need to do any of the "projects" or multiple choice quizzes. Just the lesson-sets.
    
# Part 2. Play the Bandit wargame on OvertheWire.org

Play the [Bandit wargame on OvertheWire.org](http://overthewire.org/wargames/bandit/). Use the "man" command and Google to learn about the recommended commands to help you reach the next level. Start at Level 0 and complete Level 15 (which gives you the password for Level 16).

To play, you'll need an SSH client. Use the Terminal.app on a Mac or download [Putty](https://www.putty.org) for Windows.
    
# Learn a Linux text editor

The CodeAcademy lessons above give you basic exposure to the `nano` text editor. However, you are free to use whatever text editor you like, such as `Vim` ([see tutorial here](https://danielmiessler.com/study/vim/)). However, `nano` is good for beginners.



# Deliverable

You _must use your Kali VM for the following_. See [here](https://templeu.instructure.com/courses/54116/pages/virtual-machine-links) for the download link, and [here](/security-assignments/labs/virtual-machines#kali) for the login credentials. Using the Kali VM for the steps below shows both that you got your Kali VM up and running, and that you have basic skills with the Linux terminal.

* Make a directory called `linux-tutorial`
* In that directory, create a file called `i-did-it.txt` with the following contents: `Hello, world!`
* Submit a screenshot showing:
    * The contents of that file (`cat`)
    * A string with your name and uni email, e.g., `echo "Anthony Vance anthony.vance@temple.edu"`
    * Run the `date` command
    
For example:

![img]( {{ "/assets/images/intro-linux-lab-TV.png" | relative_url }})




# Optional—More thorough walkthrough, but also more difficult

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
    
    
