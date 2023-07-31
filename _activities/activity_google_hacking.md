---
title: "Activity: Google Hacking"
description: A hands-on activity exploring Google hacking
published: true
include_toc: true
slug: google-hacking
---

[Google hacking](https://en.wikipedia.org/wiki/Google_hacking) is a technique to find sensitive information that has been indexed by Google. A searchable database of Google hacks is available at: <https://www.exploit-db.com/google-hacking-database>.

These hacks use Google search operator terms that take the following form:

```
operator:search_term 
```

In a penetration test engagement, testers can focus queries on the target organization with the `site:` search operator.

Try the following Google searches to see what interesting information you can find.


## Database passwords

```
db_password filetype:env
```

## Email lists

```
filetype:xls inurl:"email.xls"
```

## SSH keys

```
inurl:.ssh intitle:index.of authorized_keys
```

## Log files

```
inurl:/files/_log/ filetype:log
```

```
intitle:"index of" "logs"
```

```
"index of" error_logs
```

## Live web cam controls

```
inurl:/live.htm intext:"M-JPEG"|"System Log"|"Camera-1"|"View Control"
```

```
intitle:"NetCamSC*" | intitle:"NetCamXL*" inurl:index.html
```

## Public FTP servers

```
intitle:"index of" inurl:ftp
```

## PHP configuration pages

```
ext:php intitle:phpinfo "published by the PHP Group"
```

---

Search for more Google hacks here:

* Google Dork search: <https://www.dorksearch.com>
* Google Hacking Database: <https://www.exploit-db.com/google-hacking-database>