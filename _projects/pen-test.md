---
layout: assignment
title: Penetration Test Assignment
order: 2
---

For this assignment, consider that your team is a group of consultants that offers cybersecurity penetration testing and risk assessment services. You have been retained by Humbleify, a company that describes itself thusly:


> Humbleify is a place for people who enjoy humbling to connect. Find local humbling events or just share your favorite tips and stories with others who love to humble.


Humbleify is in talks to connect their network systems with another company that has required that Humbleify undergo a penetration testing assessment as part of the
negotiations. Furthermore, Humbleify is seeking cybersecurity insurance, who
also requires that Humbleify undergo a cybersecurity risk assessment, including
a penetration test.

Therefore, Humbleify has hired you to assess one of their public-facing webservers. In this
project, the company has intentionally not given you very much background information on this
asset -- they would like you to see what you can find out, going in "blind." But
you are only authorized to perform an evaluation of this particular server.

# Accessing the asset

The company has launched a copy of their webserver behind a VPN network -- one
copy per consultancy team. To access the webserver, you must connect your
Kali instance to the provided VPN network.

To connect Kali to the VPN network:

* Download `client.conf` VPN client config
  file to Kali from Canvas (under your team's "Files" page).
* Open a separate Terminal session, and run `sudo openvpn client.conf` from the
  directory where your `client.conf` is located.
  * Running this will give your Kali instance an ip address on the VPN
    network in the `10.8.0.0/24` CIDR, on a new interface called `tun0`
    (run `ip a` to verify).
* Leave this terminal running for as long as you need to connect to the
  Humbleify asset. If you ever kill it, you will lose your connection to
  the VPN network.

**Once you have connected to the VPN network**, you will be able to access the asset **at the following ip address**:

<div class='alert alert-success'>192.168.10.107</div>

**Important technical details ahead!**

Your Kali instance, however, will not have an IP address on the `192.168.10.107/24` CIDR.
Instead, you will get an address on the `10.8.0.0/24` network.
When you connect Kali to the VPN server, your Kali instance is automatically
configured to route traffic to `192.168.10.107/24` over the VPN server at
`10.8.0.1`, which forwards your traffic.

The VPN server is also configured to allow `client-to-client` traffic between
clients connected to the VPN network. The asset you are assessing is also a
client on the network. Therefore, you can access the asset from your Kali instance,
and you can _also_ access your Kali instance from the asset. However! You will
only be able to talk to Kali _from the asset_ using Kali's `10.8.0.0/24` address.

<div class='alert alert-danger'>
<strong>Heads up!</strong>

<p>This means that, if
you are configuring a reverse-connecting payload, you will need to specify
Kali's <code>10.8.0.0/24</code> address, so that traffic can reach Kali from
the asset.</p>

<p>Your Kali's <code>10.8.0.0/24</code> address may change on subsequent
connections, depending on if your teammates also connect to the VPN server.
This is fine to do, but if you set the wrong <code>LHOST</code> Kali ip address,
you may be telling your malware to reverse-connect back to one of your teammates'
MSF listeners! Just be mindful of your Kali VPN ip address before
you run exploits -- you can check it by running <code>ip a</code> and looking
for the vpn bridge interface and its ip address.</p>

<p>A power-user msfconsole-user move is to set your `LHOST` not to an explicit
ip address, but rather,
<a class='alert-link' href='{{ site.baseurl }}{% link _labs/lab_exploitation.md %}#set-lhost-iface-name'>an interface name</a>.
You can therefore run <code>set LHOST tun0</code> wherever an lhost is required
in msfconsole. <a class='alert-link' href='{{ site.baseurl }}{% link _labs/lab_exploitation.md %}#setg'>Set these values globally</a> to
perhaps save a few more keystrokes over the course of the assignment.</p>
</div>


# Contractual Agreement

You have signed the following contractual agreement with Humbleify for your
penetration test assessment:


> Humbleify and your esteemed consultancy hereby enter into a contractual agreement for you
> to carry out a vulnerability assessment of a specific Humbleify asset described
> below.
>
>
> ## Objectives
>
> Your objectives are threefold:
>
> 1. Document vulnerabilities that you are able to successfully exploit on
> the server. Describe in detail what you did and what level of access you
> were able to obtain. If you obtain a user account with limited
> privileges, document whether you were able to escalate the privileges to
> root. Document each exploit that you are able to successfully launch.
>
> 2. Document potentially sensitive information that you are able to
> obtain from the server. These could include user files or web, database,
> or other server files.
>{
> 3. For both 1 and 2 above, argue for methods that could protect the vulnerabilities and sensitive information from > exploitation.
>
>
> ## Authorization
>
> You are hereby authorized to perform the agreed-upon vulnerability assessment of
> the Humbleify webserver located at IP address 192.168.10.107 on the VPN network
> accessible to you by using your provided vpn configuration file. Your scope of
> engagement is exclusively limited to the single Humbleify asset.
>
> You may:
>
> * Access the server through any technological means available.
> * Carry out activities that may crash the server.
>
> You may not:
>
> * Social engineer any Humbleify employees.
> * Sabotage the work of any other consultancy team hired by Humbleify.
> * Disclose to any other party any information discovered on the asset.
>

# Written Report Deliverable

You should write the report for a managerial audience, one that isn't
versed in information security concepts. In other words, you need to
explain the concepts in terms that can be easily understood by managers
without technical experience. If you use technical or unfamiliar terms,
include a glossary of the terms used.

There is no length requirement for the report, but your report must not
exceed 20 pages (not including appendices).

<div class='alert alert-info'>

<p>In writing your report, <em>organize for impact</em>. This means you should
discuss the most serious vulnerabilities first. Further, in your
description, start by describing macro-level issues and then discuss
micro-level details. This practice makes it easier for a readers to
quickly process your report.</p>

<p>You can think of this process like a pyramid, where at the top you have the one-page executive summary of your findings,
and each successive section provides more granular detail. At the end of the main body of your report, the "supporting details"
section should have sufficient details on how to replicate the exploits you found, including step-by-step commands run in Metasploit or other tools.
This way, a manager can quickly get a sense of the report by reading the first page and then can choose to continue reading to get lower-level details.
</p>

<p>
Continuing the pyramid analogy, appendices are at the very base. Appendices are for very technical information that would bog down the report if included
in the main body. For example, a Nessus report or detailed output from <code>nmap</code> do not belong in the report because the information is too technical for a
managerial reader to process. Also, they tend to be lengthy and would interrupt the flow of your report.
Instead, refer the reader to the appendices for very technical and lengthy information. (I am not interested in seeing a Nessus report. Don't give me one.)
</p>

<p>
Finally, whenever you show a command or output from a command in the main body of your report, <span class='label label-info'>use excerpts or highlighting to point out the most
relevant information</span>, and explain what you show with accompanying text. Imagine you are writing to a manager or executive who doesn't
understand security and needs you to clearly explain your findings and their implications.
</p>

<p>
Writing technical material for a managerial audience is crucial skill for information systems practitioners and managers alike -- especially in information security.
</p>

</div>


# Rubric

Your report will be graded using the following rubric:

{: .table }
{% if site.instructorcollab_username == 'deargle' %}
| Criteria | Points |
| --- | ---: |
| Section E. One page executive summary that highlights the most important findings of your report. | 5  |
| Section 1. Description of the scope of the project, objectives, and your authorization to perform the assessment. | 5  |
| Section 2. Information about the server examined (OS, user accounts, applications installed, databases stored). | 5  |
| Section 3. High-level description of vulnerabilities successfully exploited and sensitive data obtained.| 25 |
| Section 4. Supporting details of successful exploits and sensitive data obtained. The detail should be sufficient for another person to replicate the results of your main findings using your report. | 30 |
| Section 5. Explanation for how to protect against vulnerabilities successfully exploited and sensitive data obtained. Provide concrete steps. | 25 |
| Glossary | 3 |
| Cross-references throughout | 2 |
| Clarity of writing for a managerial audience. | 5 |
| **Total** |  **105** |
{% endif %}
{% if site.instructorcollab_username == 'aov' %}
| Criteria | Points |
| --- | ---: |
| Section E. One page executive summary that highlights the most important findings of your report. | 5  |
| Section 1. Description of the scope of the project, objectives, and your authorization to perform the assessment. | 5  |
| Section 2. Information about the server examined (OS, user accounts, applications installed, databases stored). | 5  |
| Section 3. High-level description of vulnerabilities successfully exploited and sensitive data obtained.| 35 |
| Section 4. Supporting details of successful exploits and sensitive data obtained. The detail should be sufficient for another person to replicate the results of your main findings using your report. | 40 |
| Glossary | 3 |
| Cross-references throughout | 2 |
| Clarity of writing for a managerial audience. | 5 |
| **Total** |  **100** |
{% endif %}

Starting from [this report template]({{ site.baseurl }}{% link projects/pen-test-report-template.md %}),
create your report as a PDF or .docx file.
For submission, have one person on your team submit the report on Canvas.

# Getting help

Per the contract, the client will not answer most questions about the Humbleify server.
However, you are welcome to ask *general questions about the lab material* to your
friends and advisors.


# Tips

This section includes tips that may not have been covered in the labs.

## Tips -- General

*   Did your scan show that the server is running something on port 80? It's
    probably a web page! Try browsing to it by using kali's firefox, and put your
    server's ip address into the address bar.

You may find tools such as the following useful:

*   `scp` - one way to copy files from one computer to another, including from
    your server to kali. You could also use a meterpreter shell to download files if you have one.

    Example `scp` code (from Kali) -- mind the dot at the end!:

        scp midterm-server-username@midterm-server-ip-address:/full/path/to/file/on/midterm/server .

    That will open an `ssh` connection to the midterm server as the specified user,
    and copy a file (that the user must have permission to read!) from the
    specified path down to the current directory
    (`.` means 'current directory that I'm in on Kali').

    Note that this must be run on Kali. Meaning it cannot be run from within an
    exploited shell on the midterm server or from within an ssh connection to the
    midterm server. You cannot scp a file _from_ the midterm server _to_ Kali,
    because you cannot open an ssh session from the midterm server to kali,
    because there is no ssh server listening on Kali.
*   `ssh` - for logging into remote servers
*   `sudo` (including `sudo -l`)
*   `id`
*   `hydra` to crack ssh logins
    *   `hyrda` can try to bruteforce ssh logins. Read the documentation for hydra's `-e` flag.
        For example, to try the reverse of a username of a password, you would pass `-e r`.
        You can pass multiple values for `-e`, like it shows in the documentation.

## Tips -- Productivity

* Put an entry in Kali's `/etc/hosts` file to make it so that you don't have to
  keep typing out the IP address of humbleify's server.

## Tips -- Password Cracking

[//]: # todo: move this into the password cracking lab

*   hashcat expects hashes to be fed to it in a certain format. See
    [here](https://hashcat.net/wiki/doku.php?id=example_hashes) for guidance for that.
*   Remember that you need to tell hashcat what type of hash you are trying to
    crack (with the `-m` flag). It can sometimes be tricky to know what kind of
    hash you have. Try installing and using the package `hash-identifier`.
*   In your experience with hashcat, you passed it a hash, and then if it cracked
    it, it would by default match the plaintext with the hash. For example, if I had:

        user: foobar
        password: dogman
        hash: a8uf33kljufd88

    Then I could ignore the username, and feed the following to hashcat:

        a8uf33kljufd88

    And if it cracked it, it would output:

        a8uf33kljufd88:dogman

    However, if you have several hashes you are trying to crack at once, it is
    convenient if hashcat also associates a hash with a username. You can do that
    by passing the username:hash to hashcat as follows:

        foobar:a8uf33kljufd88

    ... and also set the `--username` flag in your hashcat call, so that hashcat
    knows that you are feeding in a prepended username.

    If you do this, hashcat will output the crack thusly:

        foobar:a8uf33kljufd88:dogman

    Remember that you can view cracked passwords that are saved in hashcat's
    potfile by using the `--show` command. e.g.:

        hashcat --show a8uf33kljufd88

*   If you want to crack usernames and passwords at the same time, you can 'unshadow'
    the files first. This puts the usernames and passwords into the same file.

    Example usage:

        unshadow [passwd file] [shadow file] > myunshadowed_file

*   Just like in the password-cracking lab, if you want to take a crack at hashes
    in `/etc/shadow`, you need to put them into a format that hashcat can
    understand. Read `man shadow`, and then read `man crypt`, to understand
    how to interpret the values in `/etc/shadow`. `man crypt` will also help you
    figure out which hash type is being used.
    *   You have to manually edit the unshadowed file and remove everything except
        for the username and the hash. See [here](https://samsclass.info/123/proj10/p12-hashcat.htm)
        (except, you can leave in the usernames, if you pass the `--username` flag)
