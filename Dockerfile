ARG RUBY_PATH=/usr/local/
ARG RUBY_VERSION=2.6.3

# Create inermediate image to install Ruby
FROM ubuntu:16.04 AS rubybuild
RUN apt-get update && \
    apt-get install -y git build-essential libssl-dev libreadline-dev zlib1g-dev curl wget
ARG RUBY_PATH
ARG RUBY_VERSION
RUN git clone git://github.com/rbenv/ruby-build.git $RUBY_PATH/ruby-build && \
    $RUBY_PATH/ruby-build/install.sh
RUN ruby-build $RUBY_VERSION $RUBY_PATH

# Create an image with ruby from previous one and install packeges needed to run Rails
FROM ubuntu:16.04
ARG RUBY_PATH
ENV PATH $RUBY_PATH/bin:$PATH
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        gcc \
        make \
        libssl-dev \
        zlib1g-dev \
        libmysqlclient-dev \
        redis-server \
        libsqlite3-dev \
        nodejs
COPY --from=rubybuild $RUBY_PATH $RUBY_PATH
COPY counter /counter
WORKDIR counter/links_counter/
RUN gem install bundler:2.0.2 && bundle install
EXPOSE 3000
