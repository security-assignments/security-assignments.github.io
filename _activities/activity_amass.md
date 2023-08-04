---
title: "Activity: Amass passive reconnaissance activity"
description: A hands-on activity exploring passive domain reconnaissance with Amass
published: true
include_toc: true
minilab: true
slug: amass
---

From the command line in Kali Linux, run the `amass` command to do reconnaissance against a target. 

# Intel module — Collect intelligence

1.  Look for organizations with “uber” in their name:

    ```shell
    amass intel -org uber
    ```

2.  Look up domains for a given IP range:

    ```shell
    amass intel -ip -src -cidr 128.187.0.0/16
    ```

3.  Reverse whois:

    > This method is invoked using the `-whois` flag. Essentially it takes the details from the specified domain’s whois records, and then tries to find other domains with similar whois records.
    > 
    > This is a great method for discovering root domains that may be owned by an organisation. ([source](https://hakluke.medium.com/haklukes-guide-to-amass-how-to-use-amass-more-effectively-for-bug-bounties-7c37570b83f7))  

    ```shell
    amass intel -whois -d byu.edu
    ```

4.  ASN search

    ```shell
    amass intel -asn 63086
    ```

# Enum module — Enumerate and map targets

5.  Determine how many subdomains exist for a given domain:

    ```shell
    amass enum -ip -d nmims.edu
    ```

# Find more options

Look at the Amass Users’ Guide for more options:

<https://github.com/OWASP/Amass/blob/master/doc/user_guide.md>