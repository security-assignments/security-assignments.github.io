---
title: Introduction to Linux - Cowsay Mini-adventure
published: true
number: 2
---

<h1>{{page.title}}</h1>

Attempt this miniadventure after going through the content of the "intro to linux" main tutorial.

```
< Introduction To Linux >
 ------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

_This tutorial adopted from one written by Brianna Huynh, Class of 2019, in January 2019_



Welcome to Linux!  The Kali terminal is powerful and can be used for many things, including making the cow above.  But before any of that happens,
we need to learn some basic commands that’ll help us move around the terminal.  

1.  Log in to Kali
2.  Open up a terminal window

    {% include lab-image.html image='cowsay-kali-terminal-button.jpg' %}

3.  For this tutorial, get a shell running as user `root` by running this within your terminal:

        sudo -s

    This launches a shell (`-s`) as root via the `sudo` command.

3.  Let’s see where we are right now.  Enter the following command to show our current directory
    `pwd`: print working directory

    We see that we are in the `root` directory. This is the "home directory" for the `root` user. There also exists a `root` user on linux systems. `root` is the root
    admin for an operating system. In other words, it has the highest clearance in the system and is able to perform all commands.  
    Other users may not have permissions to run certain actions, but `root` can do _all_.


4.	Now that we know which directory we’re working in, what kind of files do we have in here?  Type in the following command to list directory contents.

        ls

5. Sometimes, files can be hidden from the `ls` command.  Like ninjas.  We get around this by adding a flag to the command which tells it to do something specific.

        ls -a

   `-a`: display all, including hidden files

6.  Many commands have useful flags that tailor it to do exactly what you need it to do.  Where do we find out all the options of the command?  We can use `man`!

    Well, specifically the `man` command.  Use `man <name of the command you want to check>` to see all the documentation available.

    Let’s try `man ls`

8.	There are a variety of different applications that can be installed into Linux.  For example, the cow at the top of the lab can be made in the terminal and is,
    arguably, the most important function that can be performed in Linux.  

        Sudo apt install cowsay

    `sudo`: allows the user to run commands as root

    `apt install`: installs an application using kali's `aptitude` package manage.r

    `cowsay`: the best application

9.  After the installation is complete, try the command out.

        cowsay <something you want the cow to say>

10. Oh dear, that didn’t work. When applications are installed via `apt`, they often install themselves into a location that makes them discover-able and therefore
    run-able via just their standalone names. But this doesn't work when using user `root` (it does work for non-root users). We'll have to do it ourselves.

    First, find where the `cowsay` application was installed on the filesystem.

        find / -name 'cowsay'

11. Show off your navigational prowess by changing directories to where `cowsay` said it was located.

    You could do:

        cd /usr/games

    Or you could do:

        cd ..
        cd usr
        cd games

    Run `pwd` to see that where you are located matches the handy prompt info:

        pwd

    See what is in your current directory. Do you see `cowsay`?

        ls -a

12. We’ve found cowsay! To run an application, you either (1) specify its full path (e.g., `/usr/games/cowsay`), or you put it on your $PATH environment variable, so that you do not have
    to specify its path.

    Verify that you can run `cowsay` via its full path:

        /usr/games/cowsay <thing to say>

    <div class='alert alert-warning'><strong>Warning: </strong>If you run <code>cowsay</code> without any arguments, it will sit and wait, listening for standard input, for you to type what you want
    it to say. Finish your message with <code>ctrl+d</code>, or kill the process with <code>ctrl+c</code>.</div>

    But let's update our PATH env variable to include `/usr/games/` on it.

    First, look at your current path:

        echo $PATH

    Do you see `/usr/games` there? You do not. Update your `PATH`:

        PATH="$PATH:/usr/games/"

    This will set `PATH` to be the current (expanded) value of PATH, plus the `/usr/games/` directory. (The `:` delimits path for the $PATH variable.)

    Now check your `PATH` again:

        echo $PATH

    Check that we can now run `cowsay` without specifying the full path:

        `cowsay <thing to say>`

    This is nice, but we would have to run this every time we opened a new shell. Let's make our updated `PATH` permanent. We can do that for our shell (terminal) by entering commands
    that will be run on each launch, in the `.bashrc` file located in our home directory.

    Move back to the home folder

        cd

    *  Recall that `cd` without any arguments will shortcut-navigate you to your home directory. You could also have run:

            cd ~

    Your `.bashrc` file is located here. Verify that this is so:

        ls -a

    Open up a text editor with the .bashrc

        nano .bashrc

    Add this line to the bottom of the file:

        export PATH="$PATH:/usr/games"

    ... where `export` will make the variable stick outside of the process that is reading the `.bashrc` file (otherwise, the update would only persist within the scope of the shell initialization process).

    Save the file

        ctrl+o
        <enter>

    Exit the file

        ctrl+x

    {% include lab-image.html image='cowsay-path-edit.png' %}

    1.  Tell your shell to `read` `.bashrc` so that the path for your current shell gets read.

            source ~/.bashrc

        alternatively,

            . ~/.bashrc

        alternatively, close this terminal and open a new one.

    1.  Let's try `cowsay` again:

            cowsay <something you want to say>

        Did it work? If so, yay!


# Proof of cowsay mastery

*   Submit a screenshot of a _dead-appearing cow_ _thinking_ your full name and username.    

    {% include lab-image.html image='cowsay-dead-think.png' %}

    (Hint: read the `man`page for `cowsay`)

*   Figure out how how you can make budweiser frogs say something instead of a cow. Submit a screenshot of the bud-frogs saything your full name and username.

    {% include lab-image.html image='cowsay-bud-frogs.png' %}

    (Hint: read about the `cowfile` option in the cowsay manpage)
