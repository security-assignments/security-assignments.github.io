---

title: "Lab: Password Cracking"
number: 5
vms:
    - Kali
description: hydra, hashcat, rockyou, hashcat rules, cewl wordlists
published: true
is_pentest_prep: true
---

# Part 1: Test Password Security

1.	Visit the following URL:

    [https://lowe.github.io/tryzxcvbn/](https://lowe.github.io/tryzxcvbn/)

    This website estimates the strength of passwords you enter. Passwords never
    leave your browser -- if you are so inclined, you can confirm as much by
    perusing the [source code](https://github.com/dropbox/zxcvbn) and/or by
    opening your browser developer tools and observing the (java)script that runs
    when you enter passwords.

2.	Try out different passwords to see how strong they are.

    **Optional:** If you want to learn more about password strength estimation, see [this video and paper](https://www.usenix.org/conference/usenixsecurity16/technical-sessions/presentation/wheeler).

# Part 2: Check an Account for a Prior Data Breach

1.  Check to see if one of your online accounts has already been breached.

    Visit: [https://haveibeenpwned.com](https://haveibeenpwned.com). Type in one of your email accounts or usernames to see if it has already been compromised in a data breach.

1.  Next visit: [https://haveibeenpwned.com/Passwords](https://haveibeenpwned.com/Passwords)

    Try out some passwords to see if they have already been compromised in a data breach.

1.  Finally, visit: [https://haveibeenpwned.com/NotifyMe](https://haveibeenpwned.com/NotifyMe)

    Sign up to be notified when one of your accounts is breached in the future.

{% include lab_question.html question='Was one of your accounts breached? If so, which one(s)?' %}

# Part 3. Sign-up for Two Factor Authentication

Visit <https://2fa.directory/> and browse through the categories to find an online service that you regularly use
(e.g., Gmail, Snapchat, Instagram, Facebook, online bank accounts, etc.). Sign up for 2FA for at least one account.

Also, visit [dongleauth.info](https://www.dongleauth.info/) to find an online service that allows you to use [WebAuthn](https://en.wikipedia.org/wiki/WebAuthn) or [Universal Second Factor (U2F)](https://en.wikipedia.org/wiki/Universal_2nd_Factor).

{% include lab_question.html question='Which service did you enable 2FA for?' %}

# Part 4. Install and Set up a Password Manager

If you're not already using one, set up a password manager. I recommend creating an account with [LastPass](https://www.lastpass.com/), or my favorite, [1Password](https://1password.com) ([student discount link](https://www.studentappcentre.com/discounts/1password)). See [here](https://thewirecutter.com/reviews/best-password-managers/) for a comparison of leading password managers.

Next, install the browser extension for your password manager (see [here](https://lastpass.com/misc_download2.php) for LastPass; see [here](https://1password.com/downloads/) for 1Password). With the browser extension installed, log into a website for which you have an account. Your password manager will ask to save the password after each login. Do this for three sites.

## Deliverable:

Take a screenshot of your password manager showing **saved entries for at least three sites** you visited. Also, make sure the screenshot **shows your username** in the top left- or right-hand corner. Submit your screenshot on Canvas.

**LastPass.com example screenshot:**

{% include lab-image.html image='LastPass.png' width="600px" %}

**1Password app example screenshot:**

{% include lab-image.html image='1Password-app.png' width="550px" %}

**1Password.com example screenshot:**

{% include lab-image.html image='1Password-web.png' width="500px" %}




# Part 5: Online Password Attack

In this section, you will launch attacks over the network against login services,
in an attempt to brute-force a username/password.

**Note:** This section uses the [Kali VM]({{ site.baseurl }}{% link labs/virtual-machines.md %}#kali).

<div class='alert alert-info'><strong>Heads up!</strong> Pay careful attention to each step
in this section.</div>

This attack uses `/usr/share/wordlists/rockyou.txt.gz`, which comprises all unique passwords from the [32 million RockYou password breach](https://www.nytimes.com/2010/01/21/technology/21password.html).

1.  Open a terminal and elevate to a root shell (or, alternatively, run all commands below with `sudo`):

        sudo -s

    <div class='alert alert-info'><p><strong>Access denied?</strong>GCP is <em>supposed</em>
    to set you up with the ability to run <code>sudo</code> without a password. If that's
    not working and you get prompted for a password (there isn't one for your google login),
    then instead, elevate to a root shell by logging in as root with password <code>toor</code> (root backwards), as follows:</p>
    <p><code>su root</code></p></div>



1.  First, if the file `/usr/share/wordlists/rockyou.txt` is not present, unzip the password list.

        gunzip /usr/share/wordlists/rockyou.txt.gz

2.	We will use the 'rockyou' password list to launch an online password attack using
    [`THC-Hydra`](https://github.com/vanhauser-thc/thc-hydra). The attack will be
    launched against a website that is managed by Dr. Eargle, who authorizes you
    to launch the attack only as specified in the instructions below.

    Visit [https://is.theorizeit.org](https://is.theorizeit.org) in a browser,
    and note that it is an installation of mediawiki. Now browse to subdirectory
    <https://is.theorizeit.org/auth/>. It requires a login. Let's say that you
    wanted to crack the password for this route. Imagine that you knew, or guessed,
    that one of the usernames was `istheory`.

    First, install a missing package that `hydra` needs:

    ```bash
    apt update && apt install -y libmongocrypt-dev
    ```

    Then, type the following, all on one line (remember that you can
    use tab-completion for the rockyou path). Run the command after you read the
    explanatory text below the command on this page.

    ```bash
    hydra -V -l istheory -P /usr/share/wordlists/rockyou.txt https-get://is.theorizeit.org/auth/
    ```

    **Note:** The trailing slash (`/`) in the final argument is needed.

    Where:

    * `hydra` is the password cracking tool to execute.
    * `-V` means verbose, and will show you the username and password combination being attempted.
    * `-l istheory` sets “istheory” as the login name. **Note:** that’s a lowercase ‘L.’
    * `-P /usr/share/wordlists/rockyou.txt` is the password dictionary file to use.
      * the password is case-sensitive!
    * `https-get` means a [GET request](https://www.w3schools.com/tags/ref_httpmethods.asp) over HTTPS. Note that Hydra supports many protocols (e.g., ftp, ssh).
    * `is.theorizeit.org/auth/` is the password-protected URL to be accessed.

    <div class='alert alert-info'><strong>Tip</strong> This is a good opportunity
    to look at a command's built-in help documentation. Run <code>hydra -h</code>
    and peruse the output to find each of the above arguments, and read what they
    do. What would a lowercase <code>-p</code> have signified, instead of the
    uppercase <code>-P</code> used? What would an uppercase <code>-L</code>
    have signified? Argument casing matters for this program!</div>


    **Note:** you can also use THC-Hydra with web forms: [http://insidetrust.blogspot.com/2011/08/using-hydra-to-dictionary-attack-web.html](http://insidetrust.blogspot.com/2011/08/using-hydra-to-dictionary-attack-web.html)

    In Greek and Roman mythology, [Hyrda](https://en.wikipedia.org/wiki/Lernaean_Hydra) is a mythical sea monster with many heads. When a head is cut off, it is replaced by another. `THC Hydra`, the tool you are using,
    likewise launches multiple "heads" (tasks), each of which makes a battery of attacks (password guesses) before dying off and being replaced by another head (task). By default, Hyrda runs with 16 concurrent heads.

    The Hyrda output will tell you at what time it started, how many passwords it has tried so far, and at what time it stopped.

    {% include lab_question.html question='Scan the results to find the line beginning with <code>[443][http-get]</code>. What was the password?' %}

    **Question:** Approximately how many passwords a second were you able to try? **Hint:** You may need to calculate this from the start and end time along with number of guesses made.

    {% include lab_question.html question='For the lab submission, you will be asked to look at sample output from a `hydra` run, and determine how many passwords were tried per second in the sample output.' %}





# Part 6: Offline Attack Using Hashcat

While in the previous section attacks were launched over the network, in this
section, you will start with a _password hash_ stored on your computer, and
you will launch attacks against it locally. No authentication service such
as a webserver sits in front of your attempts, potentially throttling
the speed at which you can make guesses. Instead, you can make guesses as fast
as your computer and the particular hash algorithm will allow.


<div class='alert alert-info'>
<p>If you're feeling adventurous, you can install Hashcat on your host computer, where you'll get massive speed improvements compared to running it in your Kali VM. Hashcast needs to be able to directly interface with
the CPU/GPU in order to crack fast—it can't so as well in a virtualized environment.</p>
<p>For Windows or Linux, download Hashcat <a class='alert-link' href='https://hashcat.net/hashcat'>here</a>. For Mac, I recommend that you first install Homebrew (follow instructions at <a class='alert-link' href='https://brew.sh'>https://brew.sh</a>),
then run the command, <code>brew install hashcat</code>.</p>
</div>

1.  On your Kali machine, open up a terminal and navigate to your home directory (`/root/`).
2.  Hashcat uses a command-line interface. To see available options and syntax, type:

		hashcat --help

4.  First, a dictionary attack will be performed against a password-protected
    Word document. The following command uses a Python script to obtain the hash of
    the Word document password called `hashcat.doc`. This document has been prepared
    specifically for this lab. The word document has been password-protected. The
    hash of the password is stored within the metadata of the document file itself.
    You can use the python script called `office2john.py` to extract the hash.
    `john` in that script name refers to [JtR, John the Ripper](https://github.com/openwall/john),
    and the python script prints the hash in a format that `john` can accept.
    We will edit the output to prepare for its use with `hashcat`.

    First, obtain the necessary files:

    * office2john.py can be obtained [here][jtr]. To obtain it in Kali, run:

          wget https://raw.githubusercontent.com/magnumripper/JohnTheRipper/bleeding-jumbo/run/office2john.py

      [jtr]: https://raw.githubusercontent.com/magnumripper/JohnTheRipper/bleeding-jumbo/run/office2john.py

    * hashcat.doc is available [here][hashcat.doc]. To obtain it, run:

          wget https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/hashcat.doc

      [hashcat.doc]: https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/hashcat.doc

    Then, run the following command from the directory to where you downloaded `office2john.py`
    and `hashcat.doc`:

        python office2john.py hashcat.doc

5.  In the output, you'll see the name of the file, followed by the type. The type
    is shown with a `$` at the beginning and end of it. You need to convert the output
    to a format that `hashcat` can recognize. To do so, copy
    everything from the first `$` up to, but not including, `:::`.

    For example, if the script output was the following:

        hashcat.doc:$oldoffice$1*04477077758555626246182730342136*b1b72ff351e41a7c68f6b45c4e938bd6*0d95331895e99f73ef8b6fbc4a78ac1a:::::hashcat.doc

    You would copy just the following to your clipboard:

        $oldoffice$1*04477077758555626246182730342136*b1b72ff351e41a7c68f6b45c4e938bd6*0d95331895e99f73ef8b6fbc4a78ac1a

6.  While still in your home directory, run the following command (all on one
    line). Paste the hash string into the command, surrounded by single quotes
    (**not double-quotes!**).

        hashcat --force -a 0 -m 9700  -o <your-output-filename> '<your-hash-string>' /usr/share/wordlists/rockyou.txt

    For example, using the example hash from earlier, if I wanted my output to go to a file called `yay-output.txt`:

        hashcat --force -a 0 -m 9700  -o yay-output.txt '$oldoffice$1*04477077758555626246182730342136*b1b72ff351e41a7c68f6b45c4e938bd6*0d95331895e99f73ef8b6fbc4a78ac1a' /usr/share/wordlists/rockyou.txt

    <div class='alert alert-info'><strong>Why not double-quotes?</strong> The hash includes <code>$</code> characters, which, in <code>bash</code>, when surrounded by double-quotes, are used to reference variables. This is unwanted here. Single-quotes prevents this.</div>

    Once the password is cracked, read the contents of your output file
    to see the cracked password. It will be appended to the end of the hash
    following a colon (`:`) symbol.

    {% include lab_question.html question='What is the password for <code>hashcat.doc</code>?' %}

    ---

    Peruse `man hashcat` to get an idea of what the arguments do. In the above command,
    the switches correspond to the following:

    {: .table .table-condensed }
    | `--force` | This is necssary to get hashcat to run in a VM environment (it doesn't normally like to do so). |
    | `-a 0` | Straight dictionary attack against the hash |
    | `-m <Office_Flag>` | The corresponding flag for the version of Office in use (see table in `hashcat --help`) |
    | `--status` | Provides an update of the status of the process without giving a prompt |
    | `-o <Output_File>` | The location where the cracked hashes will be saved. <br>The results will also be saved on the .pot file, unles  otherwise specified. In our case, we disabled it. |
    | `<Hash>` | The saved password hash. |
    | `<Dictionary>` | The list of words that will be used to try and crack the password. |



7.  Follow the same process as above, but this time for word doc file `john.doc` (available [here](https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/john.doc):

        wget https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/john.doc

    {% include lab_question.html question='What is the password for <code>john.doc</code>?' %}

8.  Examine [the hashcat cracking
    benchmarks](https://gist.github.com/epixoip/a83d38f412b4737e99bbef804a270c40)
    for a [Sagitta Brutalis](https://web.archive.org/web/20190312022836/https://sagitta.pw/hardware/gpu-compute-nodes/brutalis/).
    The Brutals has 8 graphics cards, each of which can simultaneously work on
    cracking hashes. The measured speed for each card is shown, along with a
    cumulative speed at the bottom (`Speed.Dev.#*`). Use the cumulative speed
    for all Brutalis-related calculations in this lab.

    Cracking speeds are in the following format:

        H/s	Hashes per second
        KH/s 	Kilohashes per second (Thousands of hashes per second)
        MH/s	Megahashes per second (Millions of hashes per second)
        GH/s	Gigahashes per second (Billions of hashes per second)
        TH/s	Terahashes per second (Trillions of hashes per second)
        PH/s	Petahashes per second (Quadrillions of hashes per second)    

    Hint: For the next two questions, use `ctrl+f` in your browser on the benchmark report to find answers (e.g., search `9600`).

    {% include lab_question.html question='How many passwords per second can Hashcat running on a Brutalis try on a <code>.doc</code> file (i.e., hashtype "MS Office <= 2003 MD5 + RC4, oldoffice$0, oldoffice$1")?' %}

    {% include lab_question.html question='How much faster is Hashcat in cracking .doc MS Office documents (option 9700, "Hashtype: MS Office <= 2003 MD5 + RC4, oldoffice$0, oldoffice$1") compared to Office 2013 documents (option 9600, "Hashtype: Office 2013")?' %}


    {% include lab_question.html question='How does an offline password attack compare with the online hydra attack you attempted earlier?' %}

    **Optional:** Install `hashcat` on your own machine (not the VM). See how your benchmarks compare against a Brutalis. Note that running benchmarks on the VM will break once it reaches `scrypt` before complete results are reported.

		    hashcat -b --force



# Part 7. Cracking LinkedIn Hashes Using Hashcat

In this section, you’ll see how many hashes you can recover from the 2016 LinkedIn password breach.
The LinkedIn hacker, a Russian, [was](https://www.rferl.org/a/30865604.html)
[sentenced](https://www.courthousenews.com/russian-hacker-sentenced-for-2012-data-theft-of-linkedin-dropbox-users/)
in US court to seven years in jail on September 29, 2020. This breach of 177,500,189
unsalted SHA1 password hashes represents the data of all
LinkedIn users as of 2012. Among these passwords, only 61,829,207 are unique.

However, in interest of your time, this section will require you to crack only
500,000 of these passwords. After you complete this lab, you're welcome to crack
all of the LinkedIn hashes. Ask me for a copy.

1.  Download a copy of the file `LinkedIn_HalfMillionHashes.txt` from [here](https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/LinkedIn_HalfMillionHashes.txt):

        wget https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/LinkedIn_HalfMillionHashes.txt

2.  To get your feet wet, perform a "straight" dictionary attack using the
    `rockyou.txt` wordlist again. This attack will try each entry in the rockyou
    dataset with no permutations.

    Before you run the following command, read the `man` page to make sure you
    understand what each argument/switch does. Once you have done so, run the command.

        hashcat --force -m 100 --remove --outfile=LinkedIn_cracked.txt LinkedIn_HalfMillionHashes.txt /usr/share/wordlists/rockyou.txt

    **Note:** The above command may take 5–10 minutes to run. To see the status
    of a running job in Hashcat, press the `s` key (it might take up to 15 seconds
    for Hashcat to report its status).

    `hashcat` will report how many passwords it "recovered" when it finishes.

    <div class='alert alert-warning'>These commands use the <code>--remove</code> flag. This will remove cracked hashes from the input
    file. So, if you run these commands more than once without changing anything, it won't crack anything after the first time.</div>

    <div class='alert alert-danger'>

      <p>If you accidentally delete your cracked outfile, you will need to delete your hashcat "potfile" too before you try to recreate the outfile. You have to do this because otherwise, hashcat won't write any already-cracked hashes found in the potfile to the outfile. The <code>hashcat.potfile</code> is stored in a hidden direction in the home directory of
          whomever you run the command as.</p>

      <p>To do this, <code>rm ~/.local/share/hashcat/hashcat.potfile</code>.</p>

      <p>Don't forget to also start with a fresh 500k hashlist, because the
      <code>--remove</code> flag would have removed rows from that file as the
      hashes were cracked and inserted into the potfile.</p>

      <p>To do this, first <code>rm LinkedIn_HalfMillionHashes.txt</code>, and
      then rerun the earlier <code>wget</code> command to fetch the hashlist
      again.</p>

    </div>

    You can always **open another terminal session** and count the number of lines
    in your outfile (`LinkedIn_cracked.txt`) to see how many you've cracked so far,
    in total:

        wc -l LinkedIn_cracked.txt

    Or count the number of passwords left (it started with half a million):

        wc -l LinkedIn_HalfMillionHashes.txt

    To see hashes cracked in real time, in another terminal shell, type the command: `tail -f LinkedIn_cracked.txt`. Type `control+c` to exit the `tail` command.


    {% include lab_question.html question='How many passwords were you able to recover using the Hashcat command above?' %}


6.  Run another attack that uses a rules-based method.

    Rules apply common patterns to password dictionaries to crack even more hashes. You can read about rules in Hashcat here: [https://hashcat.net/wiki/doku.php?id=rule_based_attack](https://hashcat.net/wiki/doku.php?id=rule_based_attack).

    The “best64.rule” is one of the most effective sets of Hashcat rules. It is continually refined using input and testing from the password cracking community. You can view the contents of the best64.rule [here](https://hashcat.net/wiki/doku.php?id=rule_based_attack), and an explanation of the rules [here](http://kaoticcreations.blogspot.com/2011/09/explanation-of-hashcat-rules.html).

    Run the following command once you understand what the `-r` flag does.

        hashcat --force -m 100  --remove --outfile=LinkedIn_cracked.txt LinkedIn_HalfMillionHashes.txt -r /usr/share/hashcat/rules/best64.rule /usr/share/wordlists/rockyou.txt

    {% include lab_question.html question='How many total passwords were you able to recover after using this rules based attack in combination with the earlier straight attack?' %}




7.  Run another attack that uses a hybrid method that uses a dictionary attack combined with a “mask,” which is a pattern that is appended to each password in the password dictionary:

        hashcat --force -m 100  --remove --outfile=LinkedIn_cracked.txt LinkedIn_HalfMillionHashes.txt -i -a 6 /usr/share/wordlists/rockyou.txt ?d?d

    The `?d?d` at the end means to append two digits between 0–9 each at the end of each password in the rockyou.txt password dictionary.

    {% include lab_question.html question='How many total passwords were you able to recover after using this hybrid attack in combination with the earlier straight and rules-based attacks?' %}




8.  If you would like to try using a different character set for your mask, you
    can use the following masks below. Note that each mask below is for one
    character. If you wanted to test four digits at the end of each password,
    the mask would be: `?d?d?d?d`.

    ```
?l = abcdefghijklmnopqrstuvwxyz
?u = ABCDEFGHIJKLMNOPQRSTUVWXYZ
?d = 0123456789
?s =  !"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~
?a = ?l?u?d?s
?b = 0x00 - 0xff
    ```

    **Optional:** Experiment with other rules found in `/usr/share/hashcast/rules`.

    **Optional:** Another common password pattern is to prepend digits at the beginning of passwords. If you would like try this mask, run the following command:

          hashcat --force -m 100  --remove --outfile=LinkedIn_cracked.txt LinkedIn_HalfMillionHashes.txt -i -a 7 ?d?d /usr/share/wordlists/rockyou.txt


<div class='alert alert-info'>Want even more practice? You can download the massive Troy Hunt haveibeenpwned SHA1 password hash list
on the bottom of <a class='alert-link' href='https://haveibeenpwned.com/Passwords'>this page</a>.</div>

<div class='alert alert-info'>Also, see <a class='alert-link' href='https://github.com/danielmiessler/SecLists/tree/master/Passwords'>Daniel Miessler's wordlist collection</a> for more wordlists besides RockYou to try.</div>




# Part 8. Secure Password Hashing

Refer again to the [benchmark output for a Brutalis](https://gist.github.com/epixoip/a83d38f412b4737e99bbef804a270c40).

{% include lab_question.html question='How much slower is Hashcat in cracking Bcrypt hashes compared to SHA1 hashes?' %}

Hint: sites like WolframAlpha will do conversions for you. For example, [see this example query for `70000 million / 150 thousand`](https://www.wolframalpha.com/input/?i=70000+million%2F150+thousand).

Read about the Bcrypt algorithm [here](https://en.wikipedia.org/wiki/Bcrypt#Algorithm), and also [here](https://stackoverflow.com/questions/6832445/how-can-bcrypt-have-built-in-salts)

{% include lab_question.html question='Imagine that Bcrypt is set to a work cost factor of 12. How many hashing rounds will Bcrypt go through to compute the final hash?' %}

{% include lab_question.html question='An attacker knows that a user generated their password using 8 random lowercase letters exclusively (so character space of 26, length of 8). On average, an attacker needs to try only half of all possible passwords in order to brute force the password. The attacker has access to a Brutalis. How long would it take to crack the password hash if SHA1 had been used? How long with bcrypt using the benchmarks shown for a Brutalis?' %}




# Part 9. Create a Targeted Wordlist Using CeWL

CeWL (Custom Word List Generator) is a command-line tool that creates custom
wordlists from a target website. This can be useful for cracking a password of
an organization or individual that also has a website or social media profile.
Because people often use information about themselves or their organization when
creating passwords, custom wordlists can be very effective.

Imagine that you exfiltrated the following MD5 hash from a database on <neurosecurity.byu.edu>:

    cf4aff530715824c055892438a1ab6b2

You want to create a custom dictionary using the words on `neurosecurity.byu.edu` to see if you can crack the hash.

1.  Create a custom dictionary using CeWL for the website neurosecurity.byu.edu:

        cewl -v -d 2 -m 5 -w custom_dict.txt https://neurosecurity.byu.edu

    Where:

    * `-v` runs CeWL in verbose mode.
    * `-d` is the depth to “spider” or crawl the website
    * `-m` is the minimum word length
    * `-w custom_dict.txt` is the name of your new custom wordlist or dictionary.

    Give the command a minute or two to complete.

2.  Check how many entries are in the `custom_dict.txt` file:

        wc -l custom_dict.txt

3.  Look at the words in `custom_dict.txt`:

        less custom_dict.txt

4.  Permute the words in the `custom_dict.txt` wordlist using the “best64” rule, and append the output to `custom_dict.txt` (all one line):

        hashcat custom_dict.txt -r /usr/share/hashcat/rules/best64.rule --stdout >> custom_dict.txt

5.  Check how many entries are in the custom_dict.txt file now:

        wc -l custom_dict.txt

6.  Run Hashcat using custom_dict against the MD5 hash (all one line):

        hashcat --force -a 0 -m 0 cf4aff530715824c055892438a1ab6b2 custom_dict.txt

    Where `-m 0` signifies `md5` mode, and `-a` specifies "straight attack mode" (do not permutate the wordlist, because we already did)

    The password will be reported towards the top of the output in the format: `hash:password`. If you miss the output, you can view it in your potfile once you have cracked it by running

        hashcat --show cf4aff530715824c055892438a1ab6b2

7.  Confirm that you found the correct password:

        echo -n "<the plaintext password>" | md5sum

    We include the `-n` flag because otherwise, the `echo` command will append a newline character, which will throw off the hash.

{% include lab_question.html question='What is the plaintext of the hash?' %}




# Learn more:

* Podcast: Story behind the game-changing RockYou password breach: [https://darknetdiaries.com/episode/33/](https://darknetdiaries.com/episode/33/)
* ["Hash Crack: Password Cracking Manual (v3)"](https://www.amazon.com/dp/1793458618/ref=cm_sw_em_r_mt_dp_U_SmFDCb0ZVQ098) by [@Netmux](https://twitter.com/netmux), one of the foremost password crackers.
* [https://arstechnica.com/security/2013/03/how-i-became-a-password-cracker/](https://arstechnica.com/security/2013/03/how-i-became-a-password-cracker/)
* Official Hashcat documentation: [https://hashcat.net/wiki/](https://hashcat.net/wiki/)
