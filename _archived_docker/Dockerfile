FROM ruby:latest
ENV DEBIAN_FRONTEND noninteractive

Label MAINTAINER Amir Pourmand

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    locales \
    imagemagick \
    build-essential \
    zlib1g-dev \
    jupyter-nbconvert \
    inotify-tools \
    procps \
    python3 \
    python3-venv \
    python3-pip &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*


RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen


ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    JEKYLL_ENV=production

RUN mkdir /srv/jekyll

ADD Gemfile.lock /srv/jekyll
ADD Gemfile /srv/jekyll

WORKDIR /srv/jekyll

# install jekyll and dependencies
RUN gem install jekyll bundler
RUN bundle install --no-cache
# && rm -rf /var/lib/gems/3.1.0/cache

WORKDIR /srv/backend
# Create a virtual environment and install dependencies
RUN python3 -m venv venv
COPY backend/ /srv/backend/
RUN . venv/bin/activate && \
    pip install --no-cache-dir flask 
    # List other required packages directly here
    # Example: pip install flask flask-cors

WORKDIR /srv/jekyll

EXPOSE 8080
EXPOSE 5000

COPY bin/entry_point.sh /tmp/entry_point.sh
CMD ["/tmp/entry_point.sh"]