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

