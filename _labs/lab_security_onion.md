---
title: "Lab: Network Security Monitoring and Security Onion"
number: 12
vms:
    - SecurityOnion
description: Learn your network before an intruder does
published: true
---

<div class='alert alert-info'>All commands, tools, and files for this lab should be run and are found in the Security Onion virtual machine -- username: <code>securityonion</code> password: <code>Password1</code></div>

# Part 1: Analyzing NetFlow information

Although full-content data are powerful, they are less useful for fast querying and timely incident response. This is where NetFlow records, some of the most powerful information sources available to incident responders, become very useful. These records are brief summaries of network traffic which can be maintained indefinitely due to their small file size. They provide a running history of network connections at the time of an incident.
Read the below article and use Google to answer the following questions:

[https://en.wikipedia.org/wiki/NetFlow](https://en.wikipedia.org/wiki/NetFlow)


{% include lab_question.html question='What types of information do NetFlow records contain?' %}

{% include lab_question.html question='What are at least three benefits of NetFlow over full PCAP files?' %}



Now that you have basic understandings of NetFlow, we will use YAF and SiLK (open-source incident response tools for Linux) to analyze NetFlow data.
Further documentation can be found at http://www.appliednsm.com/silk-on-security-onion/.

We will analyze sample data hosted [here](https://tools.netsa.cert.org/silk/referencedata.html#) (already downloaded to my security-onion virtual machine), which says the following about the data source:

{: style="font-size:16px"}
> This sample data is derived from anonymized enterprise packet header traces obtained from Lawrence Berkeley National Laboratory and ICSI,
and is used here with their permission. This data covers selected hours on selected dates in late 2004 and early 2005.

1.  Open a terminal. One way to do this is to right-click the desktop and choose `Open Terminal`.

3.  First, you should run the following commands in your terminal for the start and end dates to filter on:

        export sd="--start-date=2004/10/04:20"

        export sd="$sd --end-date=2005/01/08:05"

    <div class='alert alert-info'>
    This is just a convenience variable that lets you not have to type out the `--start-date` and `--end-date` flags for each of the following commands. It is stored in `$sd`. You can view it by running `echo $sd`. Go on,
    it's just text!
    </div>

    <div class='alert alert-danger'>
    These <code>export</code> commands will only persist for the current terminal session. If you open a new terminal and use any of the commands in this section
    that rely on the <code>$sd</code> variable, you will get a cryptic error.
    </div>

    We can now start querying the sample data to find some interesting and important information about the sample network.

    All commands that start with `rw` are part of the SiLK Tool Suite. `rwfilter` first selects records from netflow files, and
    `rwstats` summarises those records.


4.  Query the top “talkers” (those host-pairs that send and receive the most traffic)
    <span class='label label-info'>by bytes</span>.

    Enter the following on one line, or use the backslash `\` to let you press enter to continue the command on a new line.

        rwfilter --data-rootdir=/data/SiLK-LBNL-05 --protocol=0- \
            --type=all $sd --pass=stdout \
            | rwstats --percentage=1 --fields=sip,dip --bytes

    **Important:** Note that the `-` at the end of `--protocol=0-` is important. It indicates that all protocols from `0` and above
    will be included. It is equivalent to `--protocol=0-255`. If you don’t include the hyphen, no results will be returned.
    [IP protocols include](https://en.wikipedia.org/wiki/List_of_IP_protocol_numbers), but are not limited to, TCP and ICMP (ping,
    traceroute)

    **Note:** The code following the `|` (pipe) symbol passes the output of `rwfilter` to `rwstats`, which provides fast and
    powerful statistics. The `sip` and `dip` fields stand for source and destination IP respectively.
    To understand "source" and "destination", consider the client-server architecture pattern. In the vulnerability scanning lab,
    we identified services listening on ports on metasploitable. One such service was
    an sshd -- an ssh server listening on port 22. If we were to connect to this server with an ssh client, say, to log in to a
    metasploitable account from kali, and if that login were captured in a netflow record,
    then the "source" for that record would be kali, and the "destination" would be metasploitable.


    **Note:** The `--percentage=1` flag specifies that we only want to retain a `sip,dip` pair if total bytes exchanged between the
    two comprised at least 1% of total network byte traffic. The `--fields` conceptually performs
    a "group-by" on the incoming `rwfilter` data for, in this case, unique `sip,dip` pairs. Then the `--percentage` flag filters
    based on ranked group aggregate values for, in this case, `--bytes`.

    {% include lab_question.html question='Looking at the output, take note of the top 5 talkers source and destination IPs, ranked
    by the % of bytes the pair generated.' %}


8.  Query "top talkers" (those host-pairs that send and receive the most traffic) <span class='label label-info'>by the number of
    netflow records they generated</span>:

        rwfilter --data-rootdir=/data/SiLK-LBNL-05 \
        --proto=0- --type=all $sd \
        --pass=stdout | rwstats --count=25 \
        --fields=sip,dip

    **Note:** The `--count=25` flag specifies that we only want to retain a `sip,dip` pair if the number of netflow records
    associated with traffic exchanged
    between that pair  was in the top 25 of all netflow-record pair-counts.

    {% include lab_question.html question='Take note of the source and desination IPs of the top three talker-pairs, ranked by
    number of flow records.' %}

    <div class='alert alert-info'><strong>Consider:</strong> Conceptually, why do you think it’s important information to know the
    top talkers on the network?</div>


9.  Query top SSH flows. This is typically done using a destination port (`dport`) filter for port 22, as follows:

        rwfilter --data-rootdir=/data/SiLK-LBNL-05 \
        --proto=0- --type=all $sd \
        --dport=22 --pass=stdout | rwstats --count=10 \
        --fields=sip,dip

    {% include lab_question.html question="Take note of the host IP address that has the greatest number of flow records associated
    with ssh'ing to another specific host." %}

    <div class='alert alert-info'><strong>Consider:</strong> will the <code>sIP</code> or <code>dIP</code> represent the ssh-
    connection initiator, if the
    destination SSH port is 22?</div>


10. Starting from the query in the previous step, do a follow-up analysis on a particular SSH-connection-starter.

    <div class='alert alert-info'>
        <strong>Take heed!</strong> This question <em>intentionaly</em> offers minimal guidance.
    </div>

    *   Write a query using a `rwfilter` flag to select only records associated with a single ip address (`rwfilter --help` and
        browse through the "partitioning switches" section).
        Filter to only SSH connections initiated by `128.3.161.229`.
    *   Pipe that to `rwstats`, group by unique source ip and destination ip addresses, and examine the pairs with the 10 highest
        total number of ssh flow records.

    {% include lab_question.html question='What are the top SSH destination IPs for <code>128.3.161.229</code>? In other words,
    what hosts is this box SSH\'ing to the most often?' %}


11. Query for long standing SSH traffic:

        rwfilter --data-rootdir=/data/SiLK-LBNL-05 \
        --proto=0- --type=all \
        --dport=22 --duration=1700- \
        $sd --pass=stdout | rwcut

    **Note:** `rwcut` dumps out all `rwfilter`-piped records -- it performs no aggregations like until `rwstats`.

    **Note:** In this example, `--duration=1700-` and `--dport=22` filters to only records with a ssh connection time of at least
    1700 seconds (almost 30 minutes).

    {% include lab_question.html question='What is the IP address of the host client (source) that had an an ongoing SSH connection/
    session to an ssh server on another host (destination) of <em>at least 30 minutes</em>?' %}

    <div class='alert alert-info'><strong>Reflect:</strong> Conceptually, why should we look for long standing SSH connections?
    </div>

    There are many other filters that we can use to analyze the network traffic in many situations, especially under incident
    response circumstances.
    To learn more about YAF and SILK, you can find additional material on [https://tools.netsa.cert.org/](https://tools.netsa.cert.org/)


# Part 2: Examining PCAP Files

In this section, you’ll examine the network traffic for a Windows VM that browsed to a compromised website that in turn referred
the Windows VM to a server that delivered malware to the Windows VM. You’ll use Squert and Wireshark to investigate these events.

<div class='alert alert-info'>If you get a blank screen while trying to use Squert, then copy-paste the squert web address into an
"incognito" window within security onion's web browser.</div>

1.  Ensure that a IDS signature rule 2000419 is enabled.

    The following steps in this lab rely on a snort rule being enabled in securityonion that will be tripped by a windows EXE being
    downloaded over a non-standard HTTP port. Downloading executables is a normal
    part of using operating systems, but perhaps not so much in a corporate environment where employees shouldn't be downloading
    executable files onto their machines.

    The signature rule we want to enable is [2000419](https://doc.emergingthreats.net/bin/view/Main/2000419). This signature is in
    a list of rules downloaded by PulledPork, which securityonion uses to manage IDS rules. Ensure that it is enabled by adding it
    sid 2000419 is enabled, even if it is default-disabled
    in downloaded rule sets, by adding this id to a pulledpork config file:

        sudo bash
        echo 1:2000419 >> /etc/nsm/pulledpork/enablesid.conf
        rule-update

    Examine the rule at the link above. When this rule is triggered, it will write "ET POLICY PE EXE or DLL Windows file download"
    or "ET POLICY PE EXE or DLL Windows file download Non-HTTP", depending on the rule
    version in use.


1.  Navigate to the `/data` directory, where `case.pcap` is found (available [here](https://daveeargle.com/class/cu/mgmt4250/case.pcap) if you don't already have it). Run the following command.

        sudo tcpreplay -i eth1 -M 10.0 case.pcap

    This command replays network traffic stored in the `case.pcap` file onto security onion's network card, as if the network
    activity were happening again, live.

    You should see the following at the end of your output (ignore the error messages for the 20 failed packets):

        Statistics for network device: eth1
                Attempted packets:         4682
                Successful packets:        4662
                Failed packets:            20
                Retried packets (ENOBUFS): 0
                Retried packets (EAGAIN):  0

2.  Log in to Squert using the icon on the Security Onion desktop using `analyst:analyst` for the username:password. (Bypass the
    SSL warning by clicking "Advanced" then "Proceed to site." From SquertProject.org:


    >“Squert is a web application that is used to query and view event data stored in a Sguil database (typically IDS alert data).
    Squert is a visual tool that attempts to provide additional context to events through the use of metadata, time series
    representations and weighted and logically grouped result sets. The hope is that these views will prompt questions that
    otherwise may not have been asked.”

    (IDS stands for Intrusion Detection System.)


3.  Each row in Squert lists an IDS event. Click on the `QUEUE “2”` button on the row with `ET POLICY PE EXE or DLL Windows file
    download` to see the detail of this alert.

    {% include lab-image.html image='lab_12_1.png' width="70%" %}

    When you click this number, more details will appear below the accordion expansion, including the source and destination IP of
    the associated IDS event.

    <div class='alert alert-info'>
    This particular record is a response to a HTTP web browser request which downloaded a malicious executable payload. Because it
    is a response, the source IP represents the attack machine, and the destination IP
    represents the victim machine. This convention will not always hold for this case analysis-- it depends on whether a query or a
    response is being examined.
    </div>

    {% include lab_question.html question='What is the IP address of the the Windows VM to where the malware payload was sent (the
    destination IP)?' %}

    {% include lab_question.html question='What is the IP address of the host that sent the malware payload? (the source IP)?' %}

    You can also click on the Summary tab to see a map and summary of traffic by countries.

    {% include lab-image.html image='lab_12_2.png' width="30%" %}

    If the map isn't working, just search for the IP address using Wolfram-Alpha. Or, follow the instructions in the box below to
    update your map.

    {% include lab_question.html question='What country does this malware payload comes from?' %}

    <div class='alert alert-info'>If you don't have any country information showing:
      <ul>
        <li>first make sure that you have an internet connection (try `ping google.com`).</li>
        <li>
          If you can't ping google.com, run this:
          <code><pre>
          sudo ifdown eth1 && sudo ifup eth1</pre></code>
        </li>
        <li>
          Once you can ping google.com, run this:<code><pre>
          cd /var/www/so/squert/.scripts
          sudo ./ip2c.tcl</pre></code>
        </li>
        <li>
        Then press Squert's "Refresh" button (not the browser refresh button):

        {% include lab-image.html image='lab_so_1.png' width="600px" %}
        </li>
      </ul>
    </div>




4.  You can pivot from Squert to other network forensics tools for follow-up analyses. From the Events view, drill-down one level deeper by clicking on the second `QUEUE “2”` button that appeared after
    clicking on the first. You should now see two events. Click on one of these "event ids." Doing so will pivot you to another tool called `CapME.` Log in with username:password `analyst:analyst`.

    After a moment, you will see a representation of the HTTP web request which fetched and downloaded the malware payload. In <span class='label label-danger'>red text</span> is the the HTTP request that the browser made for the download,
    and in <span class='label label-info'>blue text</span> is the malicious server's response in which the payload was actually downloaded.

    In the RED text you should see a `HOST` header, as well as a `GET` header. the `HOST` header shows the domain name and port that the browser requested. This is the malicious web domain. the `GET` header shows the specific URL that was requested
    that delivered the malware payload.

    <div class='alert alert-info'><strong>Feeling saucy?</strong> If the host were still serving the malware, you could theoretically combine the HOST and the GET values and paste them into your browser, and download the malware anew!
    But there is no need to do this if it is the malware you seek. You already can extract it because you have a record of the entire malware download network activity. This is the power of NSM -- to know all, see all, recreate all,
    for anything going to or sent from anyone on your network (assuming it's not encrypted).
    </div>

    {% include lab_question.html question='What is the domain name that served the malicious payload?' %}


5.  At the top and on the bottom of the CAPme report, you will see links to download a `.pcap` file. Do so, then open the download from the browser. This will pivot to WireShark, another network forensics tool, with a different
    view of the same event.

    The very first row in the wireshark view shows the packet that the victim sent to the attack machine to begin the request to download the malware payload. So, the "source" is the victim, and the "destination" is the attack machine.

    We are interested in knowing the MAC address of the victim machine so that we can do followup analysis. Examine this first packet. Expand the "Ethernet II" frame in the packet view, and note the 6-octet-long address delineated by `:`.

    {% include lab_question.html question='What is the MAC address of the victim VM?' %}


5.  But what was this host doing that led to them downloading malware? What sent them to that malicious domain? Let's investigate!

    In Wireshark’s File menu, choose “Open,” navigate to `/data/case.pcap` file, click “Open.” This will load the entire traffic file -- not just the traffic directly associated with the malware download.

    <div class='alert alert-info'><strong>Pay attention!</strong> In the above step, we opened the _entire_ case pcap file in wireshark. If you forget to do this and are still looking at a .pcap from CapME, you will have a bad time.</div>

    Note the source IP address for packet number 1. This is the Windows VM that gets infected. This entire network trace only pertains to web-based traffic associated with our victim for a certain time window.

    Right-click the first packet, and choose `Follow TCP Stream`. This will bundle together all of the network packets associated with this single HTTP web request, as did `CAPme` for the single HTTP event that resulted
    in the malware download.

    {% include lab_question.html question='What HOST did the victim machine make a request to in the initial TCP session?' %}

6.  We know from earlier that the malicious HTTP download request included a request for a page located at `/cars.php?honda=1185...` etc. Let's find that event, and its corresponding stream, by filtering for it:

        http contains "cars.php"

    This should return one result -- the one web request associated with fetching a route called "cars.php". For this record, note again the IP address of the attack host --
    in this case, the destination ip address.

    For this one record, right-click the destination field value (the ip address), then choose `Apply as Filter` > `Selected`. This will filter the entire tracefile
    to only activity with a destination ip matching this field. Let's filter even further to only select the records with `HTTP` protocol.
    This can be done by appending `and http` after your `ip.dst ==` filter expression.

    You should now see three HTTP requests to this malicious IP. We recognize the second one -- the `GET /cars.php` one. It is the one that delivered the malware. Let's look at the first one -- right-click `Follow TCP Stream` it.
    You will notice that this HTTP request as a `REFERER` header. This is http-speak for the site that redirected the browser to the current one. Note the value for the `REFERER`.
    There is a good chance that this is a compromised website. They're probably all compromised, but hey, world we live in. Fix or blacklist one site at a time.

    {% include lab_question.html question='What is the domain name of the “referer” website that referred the Windows VM to the IP that delivered the malware?' %}

    We are also interested in knowing the IP address of this referer website -- the host at that IP may be hosting other compromised sites, so we may want to blacklist the address.
    One way that you can find that IP address is by applying the following filter: `http contains "Host: name.of.the.referer"` (case-sensitive, and do not include the protocol (e.g., `http://` ))

    {% include lab_question.html question='What was the IP address of this referer website?' %}


    <div class='alert alert-info'><strong>What could you do with this information?</strong> Oh, lots of things.

        <ul>
            <li>You could be proactive and contact the website to alert them to their likely compromise. If it's a giant
        such as ebay though and the compromise is a malicious script embedded in someone's item listing, fat chance that ebay will do anything about it. Or maybe they will, and take down the listing. But if they do not
        take further steps to block malicious redirects from being postedo on their site, it will likely just happen again and again.</li>
            <li>You could just block this domain from being accessed within your organization. Why is this employee doing online shopping during work anyway? Fire the guy. Oh wait, everyone in your organization cyberloafs,
        you can't just fire everyone. Or maybe it was the CEO who was doing the online shopping. Sigh.</li>
            <li><p>You could report the compromise to Google, who can put a rule into the Chrome browser to block requests to this domain from being fulfilled. You may have seen a message along these lines in Chrome before:

            <p>"The site
            that you are trying to visit is currently serving malware. Try again later. <em>If you are the domain administrator and are viewing this message, contact us *here* for more information on what we found. If you
            think that this is a false positive, you are wrong, haha puny sysadmin. File a complaint and maybe a human or probably just a computer will get back with you.</em></p>

            At which point your CEO will switch to Internet Explorer and visit the site anyway. Sigh, pwned.</p>
            </li>
        </ul>

        <p>As you can see, you have many options.</p>
    </div>


6.  Well shoot. What exactly was downloaded? Let's carve it out and search online for a report on what it does.

    Follow again the tcp.stream related to the http request for getting `cars.php` (review above if you have forgotten how). From
    the popup window, choose "Save As", and save the stream somewhere.

    Note the “MZ” string at the top of the blue response stream. This string is a magic number that identifies the
    file type that is being downloaded in this request (see [https://asecuritysite.com/forensics/magic](https://asecuritysite.com/forensics/magic)). Note also the `This program…` message.
    This is another indicator of the file type.

    Next, open a terminal and navigate to the directory where you saved the stream, and use a forensics file carving tool called
    Foremost.

    First, install foremost:

        sudo apt install foremost

    Then, use it:

        foremost -i the.name.you.chose -o name.of.the.directory.where.you.want.to.save.the.carved_files

    This will create a directory `name.of.the.directory.where.you.want.to.save.the.carved_files` containing all of the files that
    Foremost carved out of the network stream.

    <div class='alert alert-info'><strong>Foremost stuck on "reading from stdin"?</strong> This happens when foremost cannot find
    the file you reference on <code>-i</code>. It will never end.
        <code>stdin</code> means that it is sitting there waiting for you to enter something, because it couldn't find an input
        otherwise.
        It's an odd behavior, but makes sense I guess in some programmer's mind. Kill the process (<code>Ctrl+c</code>). Then, navigate to the directory where your input file is located, and <em>then</em> run <code>foremost</code>.
    </div>

    Inside your carved files directory, you will find a subdirectory for each file type recovered. For this analysis, you should
    see two subdirectories -- one for extracted `png` files,
    and another for extracted `exe` files. The `.exe` in the `exe` directory is the malware payload.

    Use a hashing algo such as `sha256sum` to hash the extracted `.exe` file.

    {% include lab_question.html question='What is the <code>sha256</code> hash of the exe payload?' %}

    Browse to a website such as [virustotal.com](https://virustotal.com) or [hybrid-analysis.com](https://hybrid-analysis.com) and
    search the site using the payload's hash. This can tell you more about what you're
    dealing with in your network and potentially how to clean it up.

    {% include lab_question.html question='As shown on virustotal.com, what does Kaspersky antivirus report the exe to likely be?' %}

    [Read about](https://krebsonsecurity.com/2014/01/feds-to-charge-alleged-spyeye-trojan-author/) the arrest of, charges against,
    and plea to conspiracy from Aleksander Panin, the author of the variant of malware with which
    we are dealing.

    {% include lab_question.html question='What does Brian Krebs indicate this malware is typically used for?' %}

    **For fun:** Install `mirage` and use it open the png inside your carved-files directory if you're curious what it looks like
    (preface install commands with `sudo` on this system), Inside that subdirectory, use the `file` command to identify the file
    type.

    <div class='alert alert-success'>If you ever have a storage device that corrupts and is reported to be unreadable by your
    operating system,
    it is possible that you can use a tool like <code>foremost</code>
    to carve out files from the media.</div>


# Part 3: Operation Aurora Case

## Preparation: Clear Security Onion History

1.  Double-click the “Setup” icon on the Security Onion desktop, and enter the password “Password1”.
1.  Click "Yes, Continue!" on the first pane.
2.  Click “Yes, skip network configuration!”
3.  Click OK with the default setting of “evaluation mode.”
4.  Click OK with the default setting of “eth1” for the monitoring interface.
5.  Enter “analyst” for the Sguil username.
6.  Enter “analyst” for the Sguil password, and confirm.
7.  Click “Yes, proceed with changes!”
8.  Click OK on the remaining dialog messages.

The logs on Security Onion have been reset, giving you a clean slate for the case below.



## Case Scenario

You will use all the skills you’ve learned in this lab so far to solve the following case based on a real hack called Operation
Aurora. First, watch [this video](https://en.wikipedia.org/wiki/Operation_Aurora) or
read [this Wikipedia article](https://www.youtube.com/watch?v=T2DqLj1nQkc) about Operation Aurora, which was an attack on Google
and other companies. Then, read the following scenario:


> Claire Young is after GumTiger's killer app source code. She’s been trailing the lead developer, Alex Stephens, to figure out how
she can remotely access GumTiger's servers.
One night, while conducting reconnaissance, she sees him log into his laptop <code>10.10.10.70</code> and VPN into GumTiger’s
headquarters.

> Leveraging her connections with international hacking organizations, Claire obtains a [0-day exploit for Internet Explorer](http://www.symantec.com/connect/blogs/trojanhydraq-incident-analysis-aurora-0-day-exploit)
and launches a client-side spear phishing attack against Alex Stephens. Claire carefully crafts an email to Alex containing tips on
how to improve the source code and sends it.
Seeing an opportunity that could get him that Vice President of Product Development title (and corner office) that he’s been
coveting, Alex clicks on the link. Claire is ready to strike…

> You are the forensic investigator. Your mission is to analyze [the packet capture (broken link!)](http://forensicscontest.com/contest06/evidence06.pcap) containing Claire’s exploit, build a timeline, and answer the questions below.

<div class='alert alert-danger'><strong>Intentional lack of specific steps ahead!</strong> Apply skills covered in Part 2 to solve this case.</div>

<div class='alert alert-info'>
    If you are using the class VM, the packet capture evidence file (the <code>.pcap</code> file) is downloaded to your VM and available at
    <code>/data/evidence.pcap</code>
</div>


1.  Find the the full URL of Alex Stephens' original web request, including the port.

    {% include lab_question.html question="What was the full URI of Alex Stephens' original web request? (Please include the port in your URI.)" %}

    <div class='alert alert-info'><p><strong>Hint:</strong> Squert will not help you here -- instead, use Wireshark skills on the
    entire <code>.pcap</code> file. Look for <code>http</code> traffic.</p><p>The reason why the Squert alerts will not help to
    find the original HTTP request will be more clear in Step 4</p></div>

2.  In response, the malicious web server sent back obfuscated JavaScript, which contained a zero-day exploit. Near the beginning
    of this JavaScript code, the attacker
    created a javascript array named “UWnHADOfYHiHDDXj” with 1300 “COMMENT” HTML elements, then set the `data` property of each of
    those elements to a string.
    What was the value of this string? (hint: look for `.data` a few lines down within the loop.

    {% include lab_question.html question="What was the string value of javascript variable “UWnHADOfYHiHDDXj”?" %}

    <div class='alert alert-info'>

        <p>JavaScript is the programming language that makes webpages interactive. With it, code can dynamically create and manipulate HTML elements
        on a webpage. While a web server sends basic html in response to a page request, any javascript is executed on the <em>client's browser</em>, not on the server. That is important --
        any code that can be executed on your own computer can potentially do bad things to your computer! Web browsers such as Internet Explorer are designed to not allow code
        like javascript to do anything outside of the scope of the webpage you are viewing... but this 0-day escapes the jail of the browser.</p>

        <p>The Symantec analysis above reports that:
            <blockquote>This exploit was used to deliver a malicious payload, known by the name of Trojan.Hydraq,
            the main purpose of which was to steal information from the compromised computer and report it back to the attackers.</blockquote>

            <blockquote>The exploit code makes use of known techniques to exploit a vulnerability that exists in the way Internet Explorer handles a deleted object. The final purpose of the exploit itself is to access an object that was previously deleted,
            causing the code to reference a memory location over which the attacker has control and in which the attacker dropped his malicious code.</blockquote>
        </p>

        <p>The payload is created with the javascript <code>var LLVcUmerhpt</code>, and the memory is manipulated by overwriting those earlier <code>.data</code> properties with a value
        which be interpreted as a memory address and which will cause the browser to execute the payload from that attacker-chosen location in memory.</p>
    </div>

3.  The loaded webpage included an [IFRAME](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe) element which caused
    Alex’s computer to make a second HTTP GET request for an object.

    {% include lab_question.html question="What was the filename of the second HTTP object that was requested?" %}

    {% include lab_question.html question="What is the MD5 hash of the second file requested (the second HTTP response object)?" %}

    <div class='alert alert-info'><strong>Hint:</strong>
        <p>You can first filter to <code>http</code> traffic with <code>GET</code> requests, and note the name and properties of the second one. Then, You can use <code>foremost</code> to extract the http response object from a saved copy of the http tcp stream.</p>

        <p>
        Alternatively and equivalently, you can export HTTP response objects in Wireshark by going to the wireshark <code>File</code> menu, and selecting “Export Objects” > HTTP. You should see two "HTTP"-requested objects. The first is the initial
        webpage visited, and the second is a gif, the downloaded of which was triggered by the initial webpage loaded. Note the name of the second file requested. Save the second one to a file. This saved file is the equivalent of what
        <code>foremost</code> would have carved.
        </p>
    </div>


4.  The exploit javascript from the first HTTP object did some over-my-head crazy magic with the second HTTP object that involved
    overwriting its location in memory with a payload.
    The javascript gets the payload to execute, and the payload opened a TCP session on port 4444 between Alex' computer and
    Claire’s machine.

    <div class='alert alert-info'>This is the heart of the trick -- javascript is not supposed to be able to write programs to
    memory and get them to execute, the browser is supposed to be sandboxed from the rest of the system. Yet, the vulnerability
    lets the javascript write a program to memory and get it to run outside of the browser.</div>

    Find the packet for when the TCP session on port 4444 opened, and also find the one when it closed. Use the timestamp
    difference between these two to determine
    how long the port was open. This is significant because it tells us how long the attackers had to perform their attack.

    <div class='alert alert-info'>
        <strong>Hint</strong> Use the Wireshark filter <code>tcp.port == 4444</code>. For the time, see the value in Wireshark’s “Time” column for the first row in the filtered results.
        Right-click the first packet in the filtered results, and choose <code>Set Time Reference</code>.
        Then note the time value for the last row in the filtered results. With the first set
        as the time reference, the last packet will indicate how long this tcp stream was open.
    </div>

    {% include lab_question.html question="How long was the TCP session on port 4444 open?" %}

    <div class='alert alert-info'>The reason why Squert would not show any HTTP request information for this malware download is
    because... this malware was not directly downloaded via an HTTP request! This malware was downloaded by a program written to
    memory and executed by javascript, which javascript was sent in the original web request.</div>


5.  In packet 17, the malicious server began to send a file to the client over the port 4444 TCP session. What type of file was it?

    Hints:
    * Examine the magic number at the beginning of the download data
    * Extract the downloaded file from the tcp stream associated with packet 17, carve out the files, and use the `file` command
      from the terminal.


    {% include lab_question.html question="What type of file was it, according to the magic number and to the <code>file</code> command?" %}
    {% include lab_question.html question="What was the MD5sum of this file?" %}

6.  Search for a hash of the downloaded file on [Virustotal.com](Virustotal.com) and on [hybrid-analysis.com](hybrid-analysis.com).

    {% include lab_question.html question='What type of file is this, according to hybrid-analysis and Virustotal?' %}

8.  You notice that the victim’s computer repeatedly tried to connect back to the malicious server on port 4445, even after the
    original connection on port 4444 was closed.

    Eventually, the malicious server responded and opened a new connection on port 4445.

    Subsequently, the malicious server sent a second executable file to the client on port 4445.

    {% include lab_question.html question='What was the MD5 sum of this second, new executable file downloaded over the port 4445 TCP session?' %}

    <div class='alert alert-info'>
        <p><strong>Hint: </strong>
        Search for traffic with this new port. You will see a lot that are red and black -- these are failed connection attempts. The black is the victim
        sending TCP SYN packets to the attackbox port 4445, and the RST/ACK response is the attack box indicating that the
            <a class='alert-link' href='https://stackoverflow.com/questions/5272026/tcp-server-sends-rst-ack-immediately-after-receiving-syn-from-client'>port is closed</a>.
        </p>

        <p>Eventually, the attackbox responds with SYN/ACK -- port is open and ready for business, establish the TCP session!
        The remainder of the tcp session is spent downloading the executable.
        </p>

        <p>You can be square and just scroll around until the colors change, or you can use the power of wireshark filters. Try this one:
        <div><code>tcp.port == 4445 and tcp.flags.syn == 1 and tcp.flags.ack == 1 </code></div>
        This will give you the start of the TCP stream that downloaded the second file.
        </p>
    </div>

# Sources

* [http://malware-traffic-analysis.net](http://malware-traffic-analysis.net)
* [http://forensicscontest.com/2010/05/21/puzzle-6-anns-aurora](http://forensicscontest.com/2010/05/21/puzzle-6-anns-aurora)
* McManus, Joe. _Using Net Flow Data for Incident Response._ Nov 2014. University of Colorado Boulder
