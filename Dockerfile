# Create an docker image with rails counter needed for travis test 
FROM berchev/ruby:2.6.3 
ENV PATH /usr/local/bin:$PATH
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
COPY counter /counter
WORKDIR counter/links_counter/
RUN gem install bundler:2.0.2 && bundle install
EXPOSE 3000
CMD rails server -b '0.0.0.0'
