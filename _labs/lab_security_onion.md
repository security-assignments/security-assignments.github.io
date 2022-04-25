---
title: "Lab: Network Security Monitoring and Security Onion"
number: 12
vms:
    - SecurityOnion
description: Learn your network before an intruder does
published: true
---

<div class='alert alert-info'>This lab should be completed from the Security Onion virtual machine.</div>

<div class='alert alert-info'>
<p>If, when you try to start the <code>lab-security-onion</code> virtual machine within
<code>virt-manager</code>, you get an error message saying:</p>
<blockquote>"Error starting the domain: Requested operation is not valid: network 'vagrant-libvirt' is not active"</blockquote>
<p>...then run the following command from a kali terminal as root, which will start the network as part of launching the vm.</p>
<p><code>cd /root/vagrant-boxes/lab-security-onion && vagrant up</code></p>
</div>

# Part 1: Analyzing NetFlow information

Although full-content data are powerful, they are less useful for fast querying
and timely incident response. This is where NetFlow records, some of the most
powerful information sources available to incident responders, become very
useful. These records are brief summaries of network traffic which can be
maintained indefinitely due to their small file size. They provide a running
history of network connections at the time of an incident.  Read the below
article and use Google to answer the following questions:

[https://en.wikipedia.org/wiki/NetFlow](https://en.wikipedia.org/wiki/NetFlow)


{% include lab_question.html question='What types of information do NetFlow records contain?' %}

{% include lab_question.html question='What are at least three benefits of NetFlow over full PCAP files?' %}



Now that you have basic understandings of NetFlow, we will use YAF and SiLK
(open-source incident response tools for Linux) to analyze NetFlow data.
Further documentation can be found at <https://tools.netsa.cert.org/silk/>.

We will analyze sample data hosted
[here](https://tools.netsa.cert.org/silk/referencedata.html) (already downloaded
to the security-onion virtual machine). The data source page says the following
about the data source:

{: style="font-size:16px"}
> This sample data is derived from anonymized enterprise packet header traces obtained from Lawrence Berkeley National Laboratory and ICSI,
and is used here with their permission. This data covers selected hours on selected dates in late 2004 and early 2005.

<div class='alert alert-danger'><strong>Heads up!</strong> Do all of the following steps on your securityonion virtual machine. The SiLK toolsuite is not installed on Kali.</div>

1.  On your securityonion virtual machine, open a terminal. One way to do this is to right-click the desktop and choose `Open Terminal`.

3.  First, you should run the following commands in your terminal for the start and end dates to filter on:

    ```bash
    export sd="--start-date=2004/10/04:20"
    export sd="$sd --end-date=2005/01/08:05"
    ```

    These commands just set a convenience variable called `$sd` that let you not have to type out the `--start-date` and `--end-date` flags for each of the following commands. You can view it by running `echo $sd`.


    <div class='alert alert-danger'>
    These <code>export</code> commands will only persist for the current terminal session. If you open a new terminal and use any of the commands in this section
    that rely on the <code>$sd</code> variable, you will get an error.
    </div>

    We can now start querying the sample data to find some interesting and important information about the sample network.

    All commands that start with `rw` are part of the SiLK Tool Suite. `rwfilter` first selects records from netflow files, and
    `rwstats` summarises those records.


4.  Query the top “talkers” (those host-pairs that send and receive the most traffic)
    <span class='label label-info'>by bytes</span>.

    Run all of the following, as one command.

    ```bash
    rwfilter --data-rootdir=/data/SiLK-LBNL-05 --protocol=0- \
        --type=all $sd --pass=stdout \
        | rwstats --percentage=1 --fields=sip,dip --bytes
    ```

    <div class='alert alert-info'>The backslash "<code>\</code>" character lets a single command span multiple lines.</div>



    Note:
    * This command uses `rwfilter` to parse the source data, and then calculates statistics on that data using `rwstats`.
    * The `-` at the end of `--protocol=0-` indicates that all protocols from `0` and above
      will be included. It is equivalent to `--protocol=0-255`. See [the wikipedia page on IP protocols](https://en.wikipedia.org/wiki/List_of_IP_protocol_numbers) for a list of IP protocols and their numbers.
    * The `sip` and `dip` fields stand for source and destination IP respectively.

      All network traffic records have "sources" and "destinations." To understand "source" and "destination" terminology, consider the client-server architecture pattern. For example, when the `ssh` command is run to connect to an `sshd` service listening on another computer, the connecting computer is the "source," and the connection target is the "destination."
    * The `--percentage=1` flag specifies that we only want to retain a `sip,dip` pair if total bytes exchanged between the
      two comprised at least 1% of total network byte traffic. The `--fields` conceptually performs
      a "group-by" on the incoming `rwfilter` data for, in this case, unique `sip,dip` pairs. Then the `--percentage` flag filters
      based on ranked group aggregate values for, in this case, `--bytes`.

    {% include lab_question.html question='Looking at the output, take note of the top 5 talkers source and destination IPs, ranked
    by the % of bytes the pair generated.' %}


8.  Query "top talkers" (those host-pairs that send and receive the most traffic) <span class='label label-info'>by the number of
    netflow records they generated</span>:

    ```bash
    rwfilter --data-rootdir=/data/SiLK-LBNL-05 \
      --proto=0- --type=all $sd \
      --pass=stdout | rwstats --count=25 \
      --fields=sip,dip
    ```

    **Note:** The `--count=25` flag specifies that we only want to retain a `sip,dip` pair if the number of netflow records
    associated with traffic exchanged
    between that pair  was in the top 25 of all netflow-record pair-counts.

    {% include lab_question.html question='Take note of the source and desination IPs of the top three talker-pairs, ranked by
    number of flow records.' %}

    <div class='alert alert-info'><strong>Consider:</strong> Conceptually, why do you think it’s important information to know the
    top talkers on the network?</div>


9.  Query top SSH flows. This is typically done using a destination port (`dport`) filter for port 22, as follows:

    ```bash
    rwfilter --data-rootdir=/data/SiLK-LBNL-05 \
      --proto=0- --type=all $sd \
      --dport=22 --pass=stdout | rwstats --count=10 \
      --fields=sip,dip
    ```

    {% include lab_question.html question="Take note of the host IP address that has the greatest number of flow records associated
    with ssh'ing to another specific host." %}

    <div class='alert alert-info'><strong>Consider:</strong> will the <code>sIP</code> or <code>dIP</code> represent the ssh-
    connection initiator, if the
    destination SSH port is 22?</div>


10. Starting from the query in the previous step, do a follow-up analysis on a particular SSH-connection-starter.

    <div class='alert alert-info'>
        <strong>Take heed!</strong> This question <em>intentionaly</em> offers minimal guidance.
    </div>

    *   Write a query using a `rwfilter` flag to select only records associated with a single ip address. Filter to only SSH    
        connections initiated by `128.3.161.229`.

        To learn how to do this, either use `rwfilter --help` and browse through the "partitioning switches" section,
        or [read those same help docs hosted online here](https://tools.netsa.cert.org/silk/rwfilter.html#Partitioning-Switches) (**recommended**).
    *   Pipe the output of `rwfilter` to `rwstats`.
    *   Use `rwstats` to group by unique source ip and destination ip addresses, and examine the pairs with the 10 highest
        total number of ssh flow records.

    {% include lab_question.html question='What are the top SSH destination IPs for <code>128.3.161.229</code>? In other words,
    what hosts is this box SSH\'ing to the most often?' %}


11. Query for long-standing SSH traffic:

    ```bash
    rwfilter --data-rootdir=/data/SiLK-LBNL-05 \
      --proto=0- --type=all \
      --dport=22 --duration=1700- \
      $sd --pass=stdout | rwsort --fields=duration | rwcut --fields=sip,dip,duration
    ```

    Note:
    * `rwcut` converts the binary output of `rwfilter` into human-readable text. Per [the `rwcut` manpage](https://
      tools.netsa.cert.org/silk/rwcut.html), "rwcut reads binary SiLK Flow records and prints the user-selected record attributes (or fields) to the terminal in a textual, bar-delimited (`|`) format."
    * In this example, `--duration=1700-` and `--dport=22` filters to only records with an ssh connection time of at least
      1700 seconds (almost 30 minutes).
    * `rwsort` sorts the records by the "duration" field.
    * The `--fields` argument to `rwcut` filters which columns are shown. Try running the command without this argument.

    {% include lab_question.html question='What is the IP address of the source that had an an ongoing SSH session of <em>at least 30 minutes</em>?' %}

    <div class='alert alert-info'><strong>Reflect:</strong> Conceptually, why should we look for long standing SSH connections?</div>

There are many other filters that we can use to analyze network traffic, especially for incident response purposes.

To learn more about YAF and SILK, you can find additional material on <https://tools.netsa.cert.org/>


# Part 2: Examining PCAP Files

In this section, you’ll examine the network traffic for a Windows VM that
browsed to a compromised website that in turn referred the Windows VM to a
server that delivered malware to the Windows VM. You’ll use Squert and Wireshark
to investigate these events.

From SquertProject.org:

> “Squert is a web application that is used to query and view event data stored
in a Sguil database (typically IDS alert data).  Squert is a visual tool that
attempts to provide additional context to events through the use of metadata,
time series representations and weighted and logically grouped result sets. The
hope is that these views will prompt questions that otherwise may not have been
asked.”

(IDS stands for Intrusion Detection System.)


1.  Ensure that IDS signature rule 2000419 is enabled.

    The following steps in this lab rely on a snort rule being enabled in securityonion that will detect a windows EXE being
    downloaded over a non-standard HTTP port.

    The signature rule we want to enable is
    [2000419](https://doc.emergingthreats.net/bin/view/Main/2000419). Follow the
    link and examine the rule. Note that when this rule is triggered, it will
    write "ET POLICY PE EXE or DLL Windows file download" or "ET POLICY PE EXE
    or DLL Windows file download Non-HTTP", depending on the rule version in
    use.

    This signature is in a list of rules downloaded by PulledPork, which
    securityonion uses to manage IDS rules. By default, it is disabled. Ensure
    that it is enabled by adding id 2000419 to a pulledpork config file (If asked, the password is `Password1`):

    ```bash
    grep -qxF '1:2000419' /etc/nsm/pulledpork/enablesid.conf || echo '1:2000419' | sudo tee -a /etc/nsm/pulledpork/enablesid.conf
    sudo rule-update
    ```



1.  Navigate to the `/data` directory, and download `case.pcap` using the following
    command:

    ```console
    /data$ sudo wget -O case.pcap https://github.com/deargle/lab-security-onion/raw/master/case.pcap
    ```

    Then, run the following command to replay network traffic stored in the `case.pcap` file onto
    security onion's network card, as if the network activity were happening
    again, live.

    ```console
    /data$ sudo tcpreplay -i eth1 -M 10.0 case.pcap
    ```

    You should see the following at the end of your output (ignore the error
    messages for the 20 failed packets):

    ```
    Statistics for network device: eth1
            Attempted packets:         4682
            Successful packets:        4662
            Failed packets:            20
            Retried packets (ENOBUFS): 0
            Retried packets (EAGAIN):  0
    ```

2.  Log in to Squert using the icon on the Security Onion desktop using
    `analyst:analyst` for the username:password. (Bypass the SSL warning by
    clicking "Advanced" then "Proceed to site.")

    <div class='alert alert-info'>If you get a blank screen while trying to use
    Squert, then copy-paste the squert web address into an "incognito" window
    within security onion's web browser.</div>

    If a popup asks you to to "Choose password for new keyring," you can safely
    dismiss/cancel this popup twice to dismiss it.

3.  Each row in Squert lists an IDS event. Click on the `QUEUE “2”` button on
    the row with `ET POLICY PE EXE or DLL Windows file download` to see the
    detail of this alert.

    {% include lab-image.html image='lab_12_1.png' width="70%" %}

    When you click this number, more details will appear below the accordion
    expansion, including the source and destination IP of the associated IDS
    event.

    **Note:** This particular record is a response to a HTTP web browser request
    which downloaded a malicious executable payload. Because it is a response,
    the source IP represents the attack machine, and the destination IP
    represents the victim machine. This convention will not always hold for this
    case analysis -- it depends on whether a query or a response is being
    examined.

    {% include lab_question.html question='What is the IP address of the Windows VM to where the malware payload was sent (the
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




4.  You can pivot from Squert to other network forensics tools for follow-up
    analyses. From the Events view, drill-down one level deeper by clicking on
    the second `QUEUE “2”` button that appeared after clicking on the first. You
    should now see two events. Click on one of these "event ids." Doing so will
    pivot you to another tool called `CapME.` If required, log in with
    username:password `analyst:analyst`.

    {% include lab-image.html image='pivot-squert-to-capme.png' %}

    After a moment, you will see a representation of the HTTP web request which
    fetched and downloaded the malware payload. In <span class='label
    label-danger'>red text</span> is the HTTP request that the browser made for
    the download, and in <span class='label label-info'>blue text</span> is the
    malicious server's response in which the payload was actually downloaded.

    In the RED text, you should see a `HOST` header, as well as a `GET` header.

    * The `HOST` header shows the domain name and port that the browser
      requested. This is the malicious web domain.
    * The `GET` header shows the specific URL that was requested that delivered
      the malware payload.

    {% include lab_question.html question='What is the domain name that served the malicious payload?' %}

    <div class='alert alert-info'><strong>Feeling saucy?</strong> If the host
    were still serving the malware, you could theoretically combine the HOST and
    the GET values and paste them into your browser, and download the malware
    anew! But there is no need to do this if it is the malware you seek. You
    already can extract it because you have a record of the entire malware
    download network activity. This is the power of NSM -- to know all, see all,
    recreate all, for anything going to or sent from anyone on your network
    (assuming it's not encrypted).</div>

    For enrichment:

    * Examine the url of the capME! page. Note the url parameters' similarities to
      the SiLK commands run in Part 1 of this lab.

      ```
      https://localhost/capme/?sip=37.143.15.180&dip=172.16.165.132&spt=51439&dpt=49398&stime=1637611877&etime=1637619077&filename=squert
      ```

    * Scroll to the bottom and note that sql was used by CapME to query for the transmission:

      ```sql
      QUERY: SELECT event.timestamp AS start_time, s2.sid, s2.hostname FROM event
      LEFT JOIN sensor ON event.sid = sensor.sid LEFT JOIN sensor AS s2 ON
      sensor.net_name = s2.net_name WHERE timestamp BETWEEN '2021-11-22 20:11:17'
      AND '2021-11-22 22:11:17' AND ((src_ip = INET_ATON('37.143.15.180') AND
      src_port = 51439 AND dst_ip = INET_ATON('172.16.165.132') AND dst_port =
      49398 ) OR (src_ip = INET_ATON('172.16.165.132') AND src_port = 49398 AND
      dst_ip = INET_ATON('37.143.15.180') AND dst_port = 51439 )) AND
      s2.agent_type = 'pcap' LIMIT 1
      ```

5.  At the top and on the bottom of the CAPme report, you will see links to
    download a `.pcap` file. Do so, then open the download from the browser.

    {% include lab-image.html image='capme-to-pcap-pivot.png' %}

    This will pivot to WireShark, another network forensics tool, with a
    different view of the same event. Unlike the previous tools, WireShark
    displays _one row per packet_.

    * Note: `wireshark` can alternatively be opened either by running the
      `wireshark` command from a terminal, or by searching for it from the
      desktop:

      {% include lab-image.html image='search-open-wireshark.png' %}

    * The filename at the top of Wireshark indicates the currently opened pcap.

      {% include lab-image.html image='wireshark-filename.png' %}

    The very first row in the wireshark view shows the packet that the victim
    sent to the attack machine to begin the request to download the malware
    payload. <span class="badge badge-danger">Heads up!</span>
    **This means that in this case, the "source" is the victim, and the "destination"
    is the attack machine.**

    We are interested in knowing the MAC address of the victim machine so that
    we can do follow-up analysis. Examine this first packet. Expand the "Ethernet
    II" frame in the packet view, and note the 6-octet-long address delineated
    by `:`.

    {% include lab_question.html question='What is the MAC address of the victim VM?' %}


5.  But what was this host doing that led to them downloading malware? What sent
    them to that malicious domain? Let's investigate!

    In Wireshark’s File menu, choose “Open,” navigate to `/data/case.pcap` file,
    click “Open.” This will load the **entire** traffic file -- not just the traffic
    directly associated with the malware download.

    {% include lab-image.html image='wireshark-open-casefile.png' %}

    {% include lab-image.html image='wireshark-open-casefile-2.png' %}

    <div class='alert alert-info'><strong>Pay attention!</strong>If you forget
    use the entire case.pcap file for the following steps, you will have a bad
    time.</div>

    Note the source IP address for packet number 1 in case.pcap. This is the
    Windows VM that gets infected. This entire network trace only pertains to
    web-based traffic associated with our victim for a certain time window.

    Right-click the first packet, and choose `Follow` Then `TCP Stream`. This
    will bundle together all of the network packets associated with this single
    HTTP web request, as did `CAPme` for the single HTTP event that resulted in
    the malware download.

    {% include lab_question.html question='What HOST did the victim machine make a request to in the initial TCP session?' %}

6.  We know from earlier that the malicious HTTP download request included a
    request for a page located at `/cars.php?honda=1185...`. Let's find that
    event, and its corresponding stream, by filtering for it with filter `http contains "cars.php"`:

    {% include lab-image.html image='wireshark-filters.png' %}

    This should return one result -- the one web request associated with
    fetching a route called "cars.php". For this record, note again the IP
    address of the malicious host -- in this case, the destination ip address.

7.  Let's find all HTTP traffic packets with that destination ip address, to try
    to find what originally led the victim to that malicious host.

    For the single record from the previous step, right-click the **destination field value (the ip
    address)**, then choose `Apply as Filter` >
    `Selected`. This will filter the entire tracefile to only activity with a
    destination ip matching this field. Confirm this by verifying that the
    filter field now shows the following:

        ip.dst == 37.143.15.180

    Let's filter even further to only select the records with `HTTP` protocol.
    This can be done by appending "<code>&nbsp;and http</code>" after your "<code>ip.dst ==</code>" filter
    expression:

        ip.dst == 37.143.15.180 and http

    You should now see three HTTP requests to this malicious IP. We recognize
    the second one -- the `GET /cars.php` one. It is the one that delivered the
    malware.

    Let's look at the first one -- right-click `Follow > TCP Stream` it. You
    will notice that this HTTP request as a `REFERER` header. In HTTP, "referer"
    means the site that redirected the browser to the current one. Note the
    value for the `REFERER`. There is a good chance that the referer is a
    compromised website.

    {% include lab_question.html question='What is the domain name of the “referer” website that referred the Windows VM to the IP that delivered the malware?' %}

7.  We are also interested in knowing the IP address of this referer website --
    the host at that IP may be hosting other compromised sites, so the network
    administrators may want to blacklist the address. One way that you can find
    that IP address is by applying the following wireshark filter:

    ```
    http contains "Host: name.of.the.referer"
    ```

    Note: this query is case-sensitive. Also, do not include the protocol
    (e.g., `http://` ) or any trailing slashes. By definition, neither of those
    things are part of the HTTP "Host" field.

    {% include lab_question.html question='What was the IP address of this referer website?' %}


    <div class='alert alert-info'><strong>What could you do with this information?</strong>
        <ul>
            <li>You could be proactive and contact the website to alert them to their likely compromise.</li>
            <li>You could just block this domain from being accessed within your organization.</li>
            <li>
              <p>You could report the compromise to Google, who can put a rule into the Chrome browser to block requests to this domain from being fulfilled. You may have seen a message along these lines in Chrome before:</p>

              <blockquote>"The site that you are trying to visit is currently serving malware. Try again later. <em>If you are the domain administrator and are viewing this message, contact us *here* for more information on what we found.</em></blockquote>

              <p>At which point your employees may unfortunately switch to Internet Explorer and visit the site anyway.</p>
            </li>
        </ul>
    </div>


6.  What exactly was downloaded? Let's carve it out and search online for a report on what it does.

    Return again to the tcp.stream related for the http request fetching
    `cars.php` (review above if you have forgotten how). From the popup window,
    opt to view as "Raw", choose "Save As", and save the stream somewhere.

    {% include lab-image.html image='wireshark-tcp-stream-saveas-raw.png' %}

    <div class='alert alert-info'>If you do not switch to save the stream as "Raw," then it will be saved by default as ASCII,
    from which files cannot be carved!</div>

    Note the “MZ” string at the top of the blue response stream. This string is
    a magic number that identifies the file type that is being downloaded in
    this request (see <https://asecuritysite.com/forensics/magic>).
    Note also the `This program…` message. This is another indicator that this file is a windows executable.

7.  Next, open a terminal and navigate to the directory where you saved the
    stream, and use a forensics file carving tool called Foremost.

    First, install `foremost`:

        sudo apt update && sudo apt install foremost

    Then, use it:

        cat <yourfile> | foremost -o OUTPUT_DIRECTORY

    With this command, `foremost` will read your file from stdin, and create a
    directory named `OUTPUT_DIRECTORY` containing all of the files that
    `foremost` carved out of the network stream.

    Inside your carved files directory, you will find a subdirectory for each
    file type recovered. For this analysis, you should see two subdirectories --
    one for extracted `png` files, and another for extracted `exe` files. The
    `.exe` in the `exe` directory is the malware payload.

    Use a hashing algo such as `sha256sum` to hash the extracted `.exe` file.

    {% include lab_question.html question='What is the <code>sha256</code> hash of the exe payload?' %}

    Browse to a website such as <https://virustotal.com> or
    <https://hybrid-analysis.com> and search the site using
    the payload's hash. This can tell you more about what you're dealing with in
    your network and potentially how to clean it up.

    {% include lab_question.html question='As shown on virustotal.com, what does Kaspersky antivirus report the exe to likely be?' %}

    [Read about](https://krebsonsecurity.com/2014/01/feds-to-charge-alleged-spyeye-trojan-author/)
    the arrest of, charges against, and plea to conspiracy from Aleksander
    Panin, the author of the variant of malware with which we are dealing.

    {% include lab_question.html question='What does Brian Krebs indicate this malware is typically used for?' %}

    **For fun:** Install `mirage` and use it to open the png inside your
    carved-files directory:

    ```bash
    sudo apt update && sudo apt install mirage
    ```

    <div class='alert alert-success'>If you ever have a storage device that
    corrupts and is reported to be unreadable by your operating system, it is
    possible that you can use a tool like <code>foremost</code> to carve out
    files from the media.</div>


# Part 3: Operation Aurora Case


## Case preparation

Begin by resetting Security Onion's history. Note -- this resetting process can take a few minutes to complete.

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
>
> Leveraging her connections with international hacking organizations, Claire obtains a [0-day exploit for Internet Explorer](http://www.symantec.com/connect/blogs/trojanhydraq-incident-analysis-aurora-0-day-exploit)
and launches a client-side spear phishing attack against Alex Stephens. Claire carefully crafts an email to Alex containing tips on
how to improve the source code and sends it.
Seeing an opportunity that could get him that Vice President of Product Development title (and corner office) that he’s been
coveting, Alex clicks on the link. Claire is ready to strike…
>
> You are the forensic investigator. Your mission is to analyze [the packet capture ](https://web.archive.org/web/20190524083328/http://forensicscontest.com/contest06/evidence06.pcap) containing Claire’s exploit, build a timeline, and answer the questions below.

<div class='alert alert-danger'><strong>Intentional lack of specific steps ahead!</strong> Apply skills covered in Part 2 to solve this case.</div>

1.  Download the packet capture evidence file, `evidence.pcap`, into the `/data` folder:

    ```console
    /data$ sudo wget -O evidence.pcap https://github.com/deargle/lab-security-onion/raw/master/evidence.pcap
    ```

    You can use `evidence.pcap` file as you did `case.pcap`, including tcp-replaying it and opening it in Wireshark.

1.  Find the full URL of Alex Stephens' original web request, including the port.

    {% include lab_question.html question="What was the full URI of Alex Stephens' original web request? (Please include the port in your URI.)" %}

    **Hint:** Squert will not help you in this part of the case -- instead, load
    the `evidence.pcap` file into Wireshark and look for `http` traffic.

    The reason why the Squert alerts will not help to find the original HTTP
    request will be more clear in Step 4.

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


    Hint:
    * You can first filter to <code>http</code> traffic with <code>GET</code> requests, and note the name and properties of the
      second one. Then, You can use <code>foremost</code> to extract the http response object from a saved copy of the http tcp stream.
    * Alternatively and equivalently, you can export HTTP response objects in Wireshark by going to the wireshark <code>File</code>
      menu, and selecting “Export Objects” > HTTP. You should see two "HTTP"-requested objects. The first is the initial
      webpage visited, and the second is a gif, the downloaded of which was triggered by the initial webpage loaded. Note the name of the second file requested. Save the second one to a file. This saved file is the equivalent of what
      <code>foremost</code> would have carved.

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


    Hint:
    * Use the Wireshark filter <code>tcp.port == 4444</code>. For the time, see the value in Wireshark’s “Time” column for the first
      row in the filtered results.
    * Right-click the first packet in the filtered results, and choose <code>Set Time Reference</code>.
      Then note the time value for the last row in the filtered results. With the first set
      as the time reference, the last packet will indicate how long this tcp stream was open.

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

6.  Search for a hash of the downloaded file on <https://www.virustotal.com/> and on <https://www.hybrid-analysis.com/>.

    {% include lab_question.html question='What type of file is this, according to hybrid-analysis and Virustotal?' %}

8.  You notice that the victim’s computer repeatedly tried to connect back to the malicious server on port 4445, even after the
    original connection on port 4444 was closed.

    Eventually, the malicious server responded and opened a new connection on port 4445.

    Subsequently, the malicious server sent a second executable file to the client on port 4445.

    {% include lab_question.html question='What was the MD5 sum of this second, new executable file downloaded over the port 4445 TCP session?' %}


    Hints:
    * Search for traffic with this new port. You will see a lot that are red and
      black -- these are failed connection attempts. The   black is the victim
      sending TCP SYN packets to the attackbox port 4445, and the RST/ACK
      response is the attack box indicating that the [port is
      closed](https://stackoverflow.com/questions/5272026/tcp-server-sends-rst-ack-immediately-after-receiving-syn-from-client).
    * Eventually, the attackbox responds with SYN/ACK -- port is open and ready
      for business, establish the TCP session!  The remainder of the tcp session
      is spent downloading the executable.
    * You can be square and just scroll around until the colors change,
      indicating a successful connection, or you can be cool and use the power
      of wireshark filters. Try this one, which will give you the start of the TCP stream that downloaded the second file:

      ```
      tcp.port == 4445 and tcp.flags.syn == 1 and tcp.flags.ack == 1
      ```

# Sources

* [http://malware-traffic-analysis.net](http://malware-traffic-analysis.net)
* [http://forensicscontest.com/2010/05/21/puzzle-6-anns-aurora (wayback link)](https://web.archive.org/web/20160308053023/http://forensicscontest.com/2010/05/21/puzzle-6-anns-aurora)
* McManus, Joe. _Using Net Flow Data for Incident Response._ Nov 2014. University of Colorado Boulder
