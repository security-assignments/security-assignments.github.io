---
layout: assignment
title: Penetration Test Assignment
order: 3
include_toc: true
---

For this assignment, consider that your team is a group of consultants that offers cybersecurity penetration testing and risk assessment services. You have been retained by Humbleify.


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

The company has given you access to a vagrantbox virtual machine version of their webserver.
It is hosted on vagrantcloud as box `deargle/pentest-humbleify`.
To launch the virtual machine, follow the instructions on <https://github.com/security-assignments/pentest-humbleify>.

**Once you have launched the virtual machine on Kali**, you will be able to access the asset **at the following ip address on the `infosec-net` network**:

<div class='alert alert-success'>192.168.56.200</div>

Your Kali instance's IP address on this network is the same as it has been for
all other labs: `192.168.56.101`.

A power-user msfconsole-user move is to set your `LHOST` not to an explicit ip
address, but rather, [an interface name]({{ site.baseurl }}{% link
_labs/lab_exploitation.md %}#set-lhost-iface-name). You can therefore run `set
LHOST virbr1` wherever an lhost is required in msfconsole. [Set these values
globally]({{ site.baseurl }}{% link _labs/lab_exploitation.md %}#setg) to
perhaps save a few more keystrokes over the course of the assignment.


# Contractual Agreement

You have signed the following contractual agreement with Humbleify for your
penetration test assessment:


> Humbleify and your esteemed consultancy hereby enter into a contractual
> agreement for you to carry out a vulnerability assessment of a specific
> Humbleify asset described below.
>
>
> ## Objectives
>
> Your objectives are threefold:
>
> 1. Document vulnerabilities that you are able to successfully exploit on the
> server. Describe in detail what you did and what level of access you were able
> to obtain. If you obtain a user account with limited privileges, document
> whether you were able to escalate the privileges to root. Document each
> exploit that you are able to successfully launch.
>
> 2. Document potentially sensitive information that you are able to obtain from
> the server. These could include user files or web, database, or other server
> files.
>
> 3. For both 1 and 2 above, argue for methods that could protect the
>    vulnerabilities and sensitive information from > exploitation.
>
>
> ## Authorization
>
> You are hereby authorized to perform the agreed-upon vulnerability assessment
> of the Humbleify vagrantbox virtual machine with IP address 192.168.56.200.
> Your scope of engagement is exclusively limited to the single Humbleify asset.
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
>Furthermore, note the following:
> * This is a vagrantbox development version of a live asset. The
>   vagrant-standard privileged user `vagrant` is present on this virtual
>   machine, but not on the live version of the asset. Therefore, any access via
>   the `vagrant` user is moot and out of scope.

Remember that your contract is _not merely_ to access the asset and its
sensitive information. Rather, your contract is to document _all possible_
vulnerabilities/attack vectors.


# Written Report Deliverable

You should write the report for a managerial audience, one that isn't
versed in information security concepts. In other words, you need to
explain the concepts in terms that can be easily understood by managers
without technical experience. If you use technical or unfamiliar terms,
include a glossary of the terms used.

There is no length requirement for the report, but your report must not
exceed 20 pages (not including appendices).


## Report-writing tips

In writing your report, _organize for impact_. This means you should
discuss the most serious vulnerabilities first. Further, in your
description, start by describing macro-level issues and then discuss
micro-level details. This practice makes it easier for a readers to
quickly process your report.

You can think of this process like a pyramid, where at the top you have the
one-page executive summary of your findings, and each successive section
provides more granular detail. At the end of the main body of your report, the
"supporting details" section should have sufficient details on how to replicate
the exploits you found, including step-by-step commands run in Metasploit or
other tools. This way, a manager can quickly get a sense of the report by
reading the first page and then can choose to continue reading to get
lower-level details.

Continuing the pyramid analogy, appendices are at the very base. Appendices are
for very technical information that would bog down the report if included in the
main body. For example, a Nessus report or detailed output from
<code>nmap</code> do not belong in the report because the information is too
technical for a managerial reader to process. Also, they tend to be lengthy and
would interrupt the flow of your report.  Instead, refer the reader to the
appendices for very technical and lengthy information. (Do not include a Nessus report.)

Finally, whenever you show a command or output from a command in the main body
of your report, _use excerpts or highlighting to
point out the most relevant information_, and explain what you show with
accompanying text. Imagine you are writing to a manager or executive who doesn't
understand security and needs you to clearly explain your findings and their
implications.

Writing technical material for a managerial audience is crucial skill for
information systems practitioners and managers alike -- especially in
information security.


# Rubric

Your report will be graded using the following rubric:

{: .table }
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

# Report Template

Starting from [this report template]({{ site.baseurl }}{% link projects/pen-test-report-template.md %}),
create your report.

<a href='{{ site.baseurl }}{% link projects/pen-test-report-template.md %}' class='btn btn-primary'>Go to the Report Template</a>

# Getting help

Per the contract, the client will not answer most questions about the Humbleify server.
However, you are welcome to ask *general questions about the lab material* to your
friends and advisors.


# Tips

This section includes tips that may not have been covered in the labs.

## Tips -- General

*   Did your scan show that the server is running something on port 80? If so, it's
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

* Put an entry for the target in Kali's `/etc/hosts` file to make it so that you don't have to
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
