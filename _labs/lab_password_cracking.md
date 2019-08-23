---

title: "Lab: Password Cracking"
number: 5
vms:
    - Kali
description: hydra, hashcat, rockyou, hashcat rules, cewl wordlists
---

# Part 0: Introduction to Linux Tutorial

1.  Complete the ["Intro to Linux" tutorial]( {{'/intro-to-linux' | relative_url }}). There is a deliverable associated with this tutorial which counts towards your participation grade.



# Part 1: Test Password Security

1.	Visit the following URL:

    [https://lowe.github.io/tryzxcvbn/](https://lowe.github.io/tryzxcvbn/)

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

Visit [https://twofactorauth.org](https://twofactorauth.org) and browse through the categories to find an online service that you regularly use 
(e.g., Gmail, Snapchat, Instagram, Facebook, etc.). Click the box-arrow icon in the “Docs” column to learn how to set two factor authentication for that service. 
Sign up for 2FA for at least one account.


{% include lab_question.html question='Which service did you enable 2FA for?' %}
    
# Part 4. Install and Set up a Password Manager

If you're not already using one, set up a password manager. I recommend creating an account with [LastPass](https://www.lastpass.com/) (free, or premium version $24 per year), or my favorite, [1Password](https://1password.com) (first six months free for students using this [link](https://www.studentappcentre.com/discounts/1password), $36 per year). See [here](https://thewirecutter.com/reviews/best-password-managers/) for a comparison of leading password managers. 
 
Next, install the browser extension for your password manager (see [here](https://lastpass.com/misc_download2.php) for LastPass; see [here](https://1password.com/downloads/mac/) for 1Password). With the browser extension installed, log into a website for which you have an account. Your password manager will ask to save the password after each login. Do this for three sites.

## Deliverable:

Take a screenshot of your password manager showing **saved entries for at least three sites** you visited. Also, make sure the screenshot **shows your username** in the top left- or right-hand corner. Submit your screenshot on Canvas.

**LastPass.com example screenshot:**

![img]( {{ "/assets/images/LastPass.png" | relative_url }}){: width="600px" }
    
**1Password app example screenshot:**

![img]( {{ "/assets/images/1Password-app.png" | relative_url }}){: width="550px" }

**1Password.com example screenshot:**

![img]( {{ "/assets/images/1Password-web.png" | relative_url }}){: width="500px" }

# Part 5: Online Password Attack

**Note:** This section uses the [Kali VM](/security-assignments/labs/virtual-machines#kali). 

This attack uses `/usr/share/wordlists/rockyou.txt.gz`, which comprises all unique passwords from the [32 million RockYou password breach](https://www.nytimes.com/2010/01/21/technology/21password.html).

1.  First, if the file `/usr/share/wordlists/rockyou.txt` is not present, unzip the password list.
        
        gunzip /usr/share/wordlists/rockyou.txt.gz

2.	We will use the rockyou password list to launch an online password attack using `THC-Hydra`. 

    Visit [https://is.theorizeit.org](https://is.theorizeit.org) in a browser. Let's say that you wanted to crack the password for this site.
    
    Open a terminal in your Kali VM. Type the following (all on one line):

        hydra -V -l istheory -P /usr/share/wordlists/rockyou.txt https-get://is.theorizeit.org/auth/

    **Note:** The trailing slash (‘/’) is needed.

    Where:
    
    * `hydra` is the password cracking tool to execute.
    * `-V` means verbose, and will show you the username and password combination being attempted.
    * `-l istheory` sets “istheory” as the login name. **Note:** that’s a lowercase ‘L.’
    * `-P /usr/share/wordlists/rockyou.txt` is the password dictionary file to use. 
    * `https-get` means a [GET request](https://www.w3schools.com/tags/ref_httpmethods.asp) over HTTPS. Note that Hydra supports many protocols (e.g., ftp, ssh).
    * `is.theorizeit.org/auth/` is the password-protected URL to be accessed.

    
    **Note:** you can also use THC-Hydra with web forms: [http://insidetrust.blogspot.com/2011/08/using-hydra-to-dictionary-attack-web.html](http://insidetrust.blogspot.com/2011/08/using-hydra-to-dictionary-attack-web.html)
    
    In Greek and Roman mythology, [Hyrda](https://en.wikipedia.org/wiki/Lernaean_Hydra) is a mythical sea monster with many heads. When a head is cut off, it is replaced by another. `THC Hydra`, the tool you are using,
    likewise launches multiple "heads" (tasks), each of which makes a battery of attacks (password guesses) before dying off and being replaced by another head (task). By default, Hyrda runs with 16 concurrent heads.
    
    The Hyrda output will tell you at what time it started, how many passwords it has tried so far, and at what time it stopped.
    
    {% include lab_question.html question='What was the password (Scan the results to find the line beginning with <code>[443][http-get]</code>)?' %}
    
    **Question:** Approximately how many passwords a second were you able to try? **Hint:** You may need to calculate this from the start and end time along with number of guesses made.
    
    {% include lab_question.html question='For the lab submission, you will be asked to look at sample output from a `hydra` run, and determine how many passwords were tried per second in the sample output.' %}
    
    
    
    
    
# Part 6: Offline Attack Using Hashcat

Cracking in Hashcat:

<div class='alert alert-info'>
<p>If you're feeling adventurous, you can install Hashcat on your host computer, where you'll get massive speed improvements compared to running it in your Kali VM. Hashcast needs to be able to directly interface with
the CPU/GPU in order to crack fast—it can't so as well in a virtualized environment.</p>
<p>For Windows or Linux, download Hashcat <a href='https://hashcat.net/hashcat'>here</a>. For Mac, I recommend that you first install Homebrew (follow instructions at <a href='https://brew.sh'>https://brew.sh</a>), 
then run the command, <code>brew install hashcat</code>.</p>
</div>

1.  On your Kali machine, open up a terminal and navigate to your home directory (`/root/`).
2.  Hashcat uses a command-line interface. To see available options and syntax, type: 

		hashcat --help
	
4.  First, a dictionary attack will be performed against a password-protected Word document. The following command uses a Python script to obtain the hash of the Word document password:

		python office2john.py hashcat.doc
		
	Note: 
	* office2john.py can be obtained [here](https://raw.githubusercontent.com/magnumripper/JohnTheRipper/bleeding-jumbo/run/office2john.py). To obtain it in Kali, run:
    
            wget https://raw.githubusercontent.com/magnumripper/JohnTheRipper/bleeding-jumbo/run/office2john.py
            
	* hashcat.doc is available [here](https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/hashcat.doc). To obtain it, run:
		
			wget https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/hashcat.doc
	

5.  In the output you’ll see the name of the file followed by the type. The type is shown with a $ at the beginning and end of it. You’ll need to copy the type and everything until “:::”. For example, the hash looks like the following, all on one line:

		$oldoffice$1*04477077758555626246182730342136*b1b72ff351e41a7c68f6b45c4e938bd6*0d95331895e99f73ef8b6fbc4a78ac1a 

	Save the hash into a file in your home directory. 
    
	**Note:** make sure the entire hash is on one line within the text file. **Don't add extra spaces at the end.** 
	If you get a "line-length exception" in the next step, make sure there's not a typo in the beginning of the hash.
    
    <div class='alert alert-info'>If you want, you can use text redirection (e.g., <code>></code>) to put the output of office2john.py into a file for you. Then you would just have to open up the file and remove the extra stuff.</div>
    <div class='alert alert-warning'>Also, if you want, you might attempt to <code>echo -n "thehash" > afile.txt</code> the hash into a file. But beware! The hash contains <code>$</code> signs, which in bash indicate
    a variable when couched in double-quotes. Long story short, if you want to echo the hash into a file, use single quotes, and you won't be bitten by bash variable expansion. Just <code>cat</code> the contents of your hashfile after you made it to make sure it looks right.</div>


6.  While still in your home directory, run the following command (all on one line). Reference the hash file you just created, and choose an arbitrary name for an output file. Once the password is cracked,
    you will read your output file to see the cracked password. It will be appended to the end of the hash following a colon (`:`) symbol.
    
    <div class='alert alert-info'><strong>Note: </strong>In the commands below, the <code>< ></code> notation means to replace that text -- <strong>including replacing the <code>< ></code> symbols! </strong> -- with the names of the actual files you are using.</div>

		hashcat --force -a 0 -m 9700  -o <outputFileName.txt> <HashInputFileName.txt> /usr/share/wordlists/rockyou.txt

	Or alternatively, if you prefer to do it without making an input file, put the hash string right in the terminal, surrounded by single quotes (not double-quotes! and type the quotes in yourself, do not copy-paste them, Macs can break them):  

		hashcat --force -a 0 -m 9700  -o <outputFileName.txt> '<hash string>' /usr/share/wordlists/rockyou.txt
	
	Where the switches correspond to:

	{: .table .table-condensed } 
	| `--force` | This is necssary to get hashcat to run in a VM environment (it doesn't normally like to). | 
	| `-a 0` | Straight dictionary attack against the hash |
	| `-m <Office_Flag>` | The corresponding flag for the version of Office in use (see table in `hashcat --help`) |
	| `--status` | Provides an update of the status of the process without giving a prompt |
	| `-o <Output_File>` | The location where the cracked hashes will be saved. <br>The results will also be saved on the .pot file, unless otherwise specified. In our case, we disabled it. |
	| `<Hash>` | The saved password hash. |
	| `<Dictionary>` | The list of words that will be used to try and crack the password. |

	<br/>

    {% include lab_question.html question='What is the password for <code>hashcat.doc</code>?' %}
    
    
    Do the same for the file `john.doc` (available [here](https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/john.doc), use `wget` as above to obtain it from url `https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/john.doc`). 

    {% include lab_question.html question='What is the password for <code>john.doc</code>?' %}
    
    
    Examine [the hashcat cracking benchmarks](https://gist.github.com/epixoip/a83d38f412b4737e99bbef804a270c40) for a [Brutalis](https://sagitta.pw/hardware/gpu-compute-nodes/brutalis/). The Brutals has 8 graphics cards, each of which 
    can simultaneously work on cracking hashes. The measured speed for each card is shown, along with a cumulative speed at the bottom (`Speed.Dev.#*`). Use the cumulative speed for all Brutalis-related calculations in this lab.
    
    Cracking speeds are in the following format:

        H/s	Hashes per second
        KH/s 	Kilohashes per second (Thousands of hashes per second)
        MH/s	Megahashes per second (Millions of hashes per second)
        GH/s	Gigahashes per second (Billions of hashes per second)
        TH/s	Terahashes per second (Trillions of hashes per second)
        PH/s	Petahashes per second (Quadrillions of hashes per second)    
    
    {% include lab_question.html question='How many passwords per second can Hashcat running on a Brutalis try on a <code>.doc</code> file (i.e., hashtype "MS Office <= 2003 MD5 + RC4, oldoffice$0, oldoffice$1")?' %}
        
    {% include lab_question.html question='How much faster is Hashcat in cracking .doc MS Office documents (option 9700, "Hashtype: MS Office <= 2003 MD5 + RC4, oldoffice$0, oldoffice$1") compared to Office 2013 documents (option 9600, "Hashtype: Office 2013")?' %}
   
        
    **Optional:** Install `hashcat` on your own machine (not the VM). See how your benchmarks compare against a Brutalis. Note that running benchmarks on the VM will break once it reaches `scrypt` before complete results are reported.

		hashcat -b --force
        
   
    {% include lab_question.html question='How does an offline password attack compare with the online hydra attack you attempted earlier?' %}


    
    
# Part 7. Cracking Linkedin Hashes Using Hashcat

In this section, you’ll see how many hashes you can recover from the 2016 LinkedIn password breach. This breach of 177,500,189 unsalted SHA1 password hashes represents the data of all 
LinkedIn users as of 2012. Among these passwords, only 61,829,207 are unique.

However, in interest of your time, this section will require you to crack only 500,000 of these passwords. After you complete this lab, you’re welcome to crack all of the LinkedIn 
hashes. Ask me for a copy.

1.  Navigate to your home directory, where you will find a copy of the file `LinkedIn_HalfMillionHashes.txt` (also available [here](https://raw.githubusercontent.com/deargle/security-assignments/master/labs/files/LinkedIn_HalfMillionHashes.txt). 
    Right-click this link, select "copy link" , then paste it into Kali after `wget`).

2.  Open a terminal. To get your feet wet, perform a "straight" dictionary attack using the `rockyou.txt` wordlist again, as follows (one line):

		hashcat --force -m 100 --remove --outfile=LinkedIn_cracked.txt LinkedIn_HalfMillionHashes.txt /usr/share/wordlists/rockyou.txt

	Note: This command may take 5–10 minutes to run. To see the status of a running job in Hashcat, press the “s” key (it might take up to 15 seconds for Hashcat to report its status).
    
    Hashcat will report how many passwords it "recovered" when it finishes.
    
    <div class='alert alert-warning'>These commands use the <code>--remove</code> flag. This will remove cracked hashes from the input file. So, if you run these commands more than once without changing anything, it won't crack anything after the first time.</div>
    <div class='alert alert-danger'>
        <p>If you accidentally delete your cracked outfile, you will need to delete your hashcat "potfile" too before you try to recreate the outfile. You have to do this because otherwise, hashcat won't write any already-cracked hashes found in the potfile to the outfile.</p>
        <p>To do this, <code>rm ~/.hashcat/hashcat.potfile</code>.</p>
        <p>Don't forget to also start with a fresh 500k hashlist.</p>
    </div>
    

    You can always count the number of lines in your outfile (`LinkedIn_cracked.txt`) to see how many you've cracked so far, total:
           
        wc -l LinkedIn_cracked.txt
    
    Or count the number of passwords left (it started with half a million):
        
        wc -l LinkedIn_HalfMillionHashes.txt

    To see hashes cracked in real time, in another terminal shell, type the command: `tail -f LinkedIn_cracked.txt`. Type `control+c` to exit the `tail` command.


    {% include lab_question.html question='How many passwords were you able to recover using the Hashcat command above?' %}


    
    
6.  Run another attack that uses a rules-based method (one line):

		hashcat --force -m 100  --remove --outfile=LinkedIn_cracked.txt LinkedIn_HalfMillionHashes.txt -r /usr/share/hashcat/rules/best64.rule /usr/share/wordlists/rockyou.txt

	Rules apply common patterns to password dictionaries to crack even more hashes. You can read about rules in Hashcat here: [https://hashcat.net/wiki/doku.php?id=rule_based_attack](https://hashcat.net/wiki/doku.php?id=rule_based_attack). 

	The “best64.rule” is one of the most effective sets of Hashcat rules. It is continually refined using input and testing from the password cracking community. You can view the contents of the best64.rule here:

	[https://github.com/hashcat/hashcat/blob/master/rules/best64.rule](https://hashcat.net/wiki/doku.php?id=rule_based_attack])

	You can read an explanation of these set of rules here:
	
	[http://kaoticcreations.blogspot.com/2011/09/explanation-of-hashcat-rules.html](http://kaoticcreations.blogspot.com/2011/09/explanation-of-hashcat-rules.html)

    {% include lab_question.html question='How many total passwords were you able to recover after using this rules based attack in combination with the earlier straight attack?' %}
    
	
	

    
    
	
7.  Run another attack that uses a hybrid method that uses a dictionary attack combined with a “mask,” which is a pattern that is appended to each password in the password dictionary:

        hashcat --force -m 100  --remove --outfile=LinkedIn_cracked.txt LinkedIn_HalfMillionHashes.txt -i -a 6 /usr/share/wordlists/rockyou.txt ?d?d

	The `?d?d` at the end means to append two digits between 0–9 each at the end of each password in the rockyou.txt password dictionary.

    {% include lab_question.html question='How many total passwords were you able to recover after using this hybrid attack combination with the earlier straight and rules-based attacks?' %}
    

    
    
8.  If you would like to try using a different character set for your mask, you can use the following masks below. Note that each mask below is for one character. If you wanted to test four digits at the end of each password, the mask would be: ?d?d?d?d.

		?l = abcdefghijklmnopqrstuvwxyz
		?u = ABCDEFGHIJKLMNOPQRSTUVWXYZ
		?d = 0123456789
		?s =  !"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~
		?a = ?l?u?d?s
		?b = 0x00 - 0xff

    **Optional:** Experiment with other rules found in `/usr/share/hashcast/rules`.
        
	**Optional:** Another common password pattern is to prepend digits at the beginning of passwords. If you would like try this mask, run the following command:

        hashcat --force -m 100  --remove --outfile=LinkedIn_cracked.txt LinkedIn_HalfMillionHashes.txt -i -a 7 ?d?d /usr/share/wordlists/rockyou.txt


		
<div class='alert alert-info'>Want even more practice? You can download the massive Troy Hunt haveibeenpwned SHA1 password hash list 
on the bottom of <a href='https://haveibeenpwned.com/Passwords'>this page</a>.</div>

<div class='alert alert-info'>Also, see <a href='https://github.com/danielmiessler/SecLists/tree/master/Passwords'>Daniel Miessler's wordlist collection</a> for more wordlists besides RockYou to try.</div>
    
    
    
    
# Part 8. Secure Password Hashing

Refer again to the [benchmark output for a Brutalis](https://gist.github.com/epixoip/a83d38f412b4737e99bbef804a270c40).

{% include lab_question.html question='How much slower is Hashcat in cracking Bcrypt hashes compared to SHA1 hashes?' %}

Read about the Bcrypt algorithm [here](https://en.wikipedia.org/wiki/Bcrypt#Algorithm), and also [here](https://stackoverflow.com/questions/6832445/how-can-bcrypt-have-built-in-salts)

{% include lab_question.html question='Imagine that Bcrypt is set to a work factor of 12. How many hashing rounds will Bcrypt go through to compute the final hash?' %}

{% include lab_question.html question='An attacker knows that a user generated their password using 8 random lowercase letters exclusively (so character space of 26, length of 8). On average, an attacker needs to try only half of all possible passwords in order to brute force the password. The attacker has access to a Brutalis. How long would it take to crack the password hash if SHA1 had been used? Bcrypt with the benchmarks shown for a Brutalis?' %}




# Part 9. Create a Targeted Wordlist Using CeWL

CeWL (Custom Word List Generator) is a command-line tool that creates custom wordlists from a target website. This can be useful for cracking a password of an organization or individual that also has a website or social media profile. Because people often use information about themselves or their organization when creating passwords, custom wordlists can be very effective.

Imagine that you exfiltrated the following MD5 hash from a database on neurosecurity.byu.edu:

    cf4aff530715824c055892438a1ab6b2

You want to create a custom dictionary using the words on neurosecurity.byu.edu to see if you can crack the hash.

1.	Create a custom dictionary using CeWL for the website neurosecurity.byu.edu:

        cewl -v -d 2 -m 5 -w custom_dict.txt https://neurosecurity.byu.edu

    Where:
    
    * 	`-v` runs CeWL in verbose mode.
    * 	`-d` is the depth to “spider” or crawl the website
    * 	`-m` is the minimum word length
    * 	`-w custom_dict.txt` is the name of your new custom wordlist or dictionary.

    Give the command a minute or two to complete.

2.	Check how many entries are in the `custom_dict.txt` file:

        wc -l custom_dict.txt

3.	Look at the words in `custom_dict.txt`:

        less custom_dict.txt
        
4.	Permute the words in the `custom_dict.txt` wordlist using the “best64” rule, and append the output to `custom_dict.txt` (all one line):

        hashcat custom_dict.txt -r /usr/share/hashcat/rules/best64.rule --stdout >> custom_dict.txt

5.	Check how many entries are in the custom_dict.txt file now:

        wc -l custom_dict.txt

6.	Run Hashcat using custom_dict against the MD5 hash (all one line):

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