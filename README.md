# Configuring to your instructional style branding and university-specific data

Set values for `instructorcollab_username` and `instructorcollab_domain` in `_config.yml`. E.g., I set:

```
instructorcollab_username: deargle
instructorcollab_domain: colorado.edu
```

Then, you can use flow control to conditionally set variable values. E.g., if Dave said something wild and inappropriate that Tony does not want to say,
Tony could set Dave's content to only render for Dave, referencing the `_config.yml` variables via `site.<variable>`:


        {% if site.instructorcollab_username == 'deargle' %}
        Something wild, inappropriate, and inflammatory!
        {% endif %}


At other times, a uni-specific email address domain can be referenced:

        Students should use their `firstname.lastname@{{ site.instructorcollab_domain }}}` email address.


To avoid unnecessarily repeating `if-then-else` statements, single-page-scope variables can be set at the top of a file:

        {% if site.instructorcollab_domain == 'colorado.edu' %}
            {% assign user_id_label == 'identikey' %}
        {% elsif site.instructorcollab_domain = 'temple.edu' %}
            {% assign user_id_label == 'TUid' %}
        {% endif %}

... and then later...

        Echo out your {{ user_id_label }} for the deliverable.



# Getting started for development


* If you fork, go go to your repo on github.com > settings > "Github Page" > set your site to be built from the master branch.

* Make sure you have both Ruby and Bundler installed.

* `git clone` the repo, then `bundle install --path vendor/bundle`.

* tweak `_config.yml` to your liking, and also `_config_local.yml` to the hostname for where you'd like to access
it locally.

* run `./script/server` on the cloned repo to spin up a server quickly.

* make changes. The [kramdown markdown flavor](https://kramdown.gettalong.org/quickref.html) is used.
    
* commit, and push. Github will build the site from the `master` branch.

* If there was a build error, you will get an email from github about it. Do not commit the `_site` folder
to github -- it will be ignored if you are allowing github to build for you.

* Github needs `_config.yml` to be committed to the repo in order for it to build the jekyll site. But this borks with the _config.yml of anyone else who forks the repo. For convenience,
  whenever you want to merge with someone else's fork, use `script/merge-with-remote REMOTE_NAME`, which will make a local copy of your _config.yml and restore it after the merge.
