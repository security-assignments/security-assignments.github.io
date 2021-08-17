# Security-assignments

This is the base repo for https://security-assignments.com. Open-source for non-commercial use (see the [LICENSE](LICENSE.md)).



## Getting started for development


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


## _includes scripts

*   lab-image.html, shorthand for embedding an image
        {% include lab-image.html image='virt-manager-running.PNG' %}
