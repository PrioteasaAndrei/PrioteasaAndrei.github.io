FROM ruby:3.2
ENV DEBIAN_FRONTEND noninteractive

Label MAINTAINER Amir Pourmand

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    locales \
    imagemagick \
    build-essential \
    zlib1g-dev \
    jupyter-nbconvert \
    python3 \
    python3-pip \
    python3-venv \
    inotify-tools procps && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*


RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen


ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    JEKYLL_ENV=production

RUN python3 -m venv venv
RUN . venv/bin/activate && \
    pip install --no-cache-dir flask requests

RUN mkdir /srv/jekyll

WORKDIR /srv/jekyll

# Copy Gemfile first for better caching
COPY Gemfile* ./

# Install dependencies
RUN bundle install

# Copy the rest of the application
COPY . .

EXPOSE 4000 35729

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]