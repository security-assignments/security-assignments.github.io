---

title: Lab &ndash; System Hardening
number: 8
---


In this lab, you will use Nmap and Nessus to identify and close security vulnerabilities on Metasploitable. Your objective will be to harden this machine against attack to make it less vulnerable.

# Setup

If you’ve finished "Lab: Exploitation", you can use the Metasploitable VM from that lab to complete this lab. Alternatively, you can create a new Metasploitable VM by importing the `.ova` a second time.
But if you haven't finished the exploitation lab, don't perform the steps in this lab on your only Metaspolitable copy.


# Snapshot the Metasploitable VM

1.	Create a snapshot of your Metasploitable VM in case you need to revert to its original state. Do this by highlighting the virtual machine in VirtualBox, and click the “Snapshots button in the top right. Finally, click the “Take a snapshot button.”

![](/images/lab_8_1.jpg){: width=40% .center-block}
 

# Closing Ports on Metasploitable 2

For this part of the lab, use the command `nmap -p 0-65535 -sV [IP address of Metasploitable VM]` to get a list of services. It’s your job to close all ports except for ports 80 (HTTP) and 22 (SSH).

Recall that shutting down services is only one way to harden a system. For services deemed essential to business function, you could also harden by applying security patches (i.e., upgrading the software). But for this lab, you will focus on just shutting down unnecessary services. 

<div class='alert alert-info'>Whenever you are instructed to 'edit' a file, you will use a text editor, such as `nano`. See <a href='/class/security/note-on-editors/'>this note on choosing an editor</a>.</div>

1.	Log in to metasploitable. The password is “msfadmin”. 
2.	On Metasploitable 2, become root by typing: `sudo su –`, then by giving msfadmin's password when prompted.
3.	Use the command `netstat -p -l -n | grep [port number]` (as root) to find process related to the port you want to close. 
    - For help interpreting the output of this command, run `netstat -pln` without piping to `grep` and look at the column headers.
4.	Use the command `ps aux | grep [name of process]` to find the id of the process (the PID) that is listening on the port you want to close. 
    - For help interpreting the output of `ps`, run `ps aux` without piping it to `grep`, and look at the column headers.
5.	You can use the `kill` command to kill running processes. However, these may be restarted by the system. You need to change the configuration so that the services don't restart.
6.	Most processes are started by the init (or initialization) daemon. The directory /etc/init.d/ has scripts that init uses to start programs when started. You can stop a service by running this command:

        /etc/init.d/[name of script] stop
        
    Or, analogously (but this doesn't work on metasploitable):
    
        service [name of script] stop

	You can get a good idea of the name of the script to look for in this directory by using your `nmap -sV` output, and by looking at the output of `netstat` and `ps aux`. You can hunt for a likely script candidate by using tab completion. For example, if you had an idea that the 'tomcat' process was responsible for running a service, you could type `/etc/init.d/tom<tab tab>` (tab twice after typing 'tom'). This will show you a list of everything in the directory that starts with 'tom' -- or it will autocomplete for you if there is only one script name that starts with 'tom'.
    
    You can permanently prevent a script from starting by using this command:

        update-rc.d -f [name of script] remove
        
        
Some gotchas:

*	`vsftpd` is started by `xinetd`. Turn this service off by editing /etc/xinetd.d/vsftpd to change the "disable" variable to "yes". Tell Xinetd to pick up the changes with this command:

        kill -USR2 [process number of xinetd]
        
*	Edit `/etc/inetd.conf`, and comment out all the processes (telnet, tftp, rlogin, rexec, etc.) 

    Then enter the command: 
    
        /etc/init.d/xinetd restart

*	Postfix is required by Linux. Change it from listening to external connections by editing `/etc/postfix/main.cf`, and changing the following line:

        inet_interfaces = all
    
    To:

        inet_interfaces = loopback-only
		
	Then restart postfix:
		
		/etc/init.d/postfix restart

*	The `named` DNS service is run by `bind9`.

*	`smdb` is run by the `samba` process.

*	You can also simply remove programs with this command: 

        dpkg -r [name of package]

You can get a list of installed packages with this command: `dpkg -l`.


# Submitting the Lab

Copy the output of the command `nmap -p 0-65535 -sV [IP address of Metasploitable VM]`, showing that you Metasploitable 2 only has two ports, 22 and 80, that are open.
