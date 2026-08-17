# Ruby 2.7 + Bundler dev-server image for this site. The repo pins Ruby
# 2.7.1 via .ruby-version/Gemfile (github-pages gem constraint), but a
# system Ruby that new won't always be available, so this lets you run the
# dev server without installing a matching local Ruby.
#
# Build:
#   docker build -t security-assignments-jekyll:dev .
#
# Run (bind-mount the repo, publish 4000, restart unless stopped):
#   docker run -d --name security-assignments-jekyll --restart unless-stopped \
#     -v "$PWD":/site -p 4000:4000 security-assignments-jekyll:dev
#
# The site's own Gemfile also supports pointing `security-assignments-theme`
# at a local sibling checkout instead of fetching it from GitHub, for fast
# theme iteration -- see security-assignments-theme's script/serve-docker
# and script/watch-docker for previewing the theme entirely on its own,
# without needing this image or this repo at all.
FROM ruby:2.7

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential zlib1g-dev git \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 2.1.4
RUN git config --global --add safe.directory /site

WORKDIR /site
EXPOSE 4000

CMD ["sh", "-c", "bundle check || bundle install && exec bundle exec jekyll serve --host 0.0.0.0 --port 4000 --watch --force_polling --config _config.yml,_config_local.yml --incremental"]
