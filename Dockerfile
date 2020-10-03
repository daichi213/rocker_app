FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

# RUN apt-get update -qq && apt-get install -y nodejs lsb-release\
#     && apt remove -y libmariadb-dev-compat libmariadb-dev

# RUN wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-common_8.0.18-1debian10_amd64.deb \
#     https://dev.mysql.com/get/Downloads/MySQL-8.0/libmysqlclient21_8.0.18-1debian10_amd64.deb \
#     https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-community-client-core_8.0.18-1debian10_amd64.deb \
#     https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-community-client_8.0.18-1debian10_amd64.deb \
#     https://dev.mysql.com/get/Downloads/MySQL-8.0/libmysqlclient-dev_8.0.18-1debian10_amd64.deb

# RUN dpkg -i mysql-common_8.0.18-1debian10_amd64.deb \
#     libmysqlclient21_8.0.18-1debian10_amd64.deb \
#     mysql-community-client-core_8.0.18-1debian10_amd64.deb \
#     mysql-community-client_8.0.18-1debian10_amd64.deb \
#     libmysqlclient-dev_8.0.18-1debian10_amd64.deb

RUN mkdir /locker_app
WORKDIR /locker_app
COPY Gemfile /locker_app/Gemfile
COPY Gemfile.lock /locker_app/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /locker_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
