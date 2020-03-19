FROM ruby:2.6

# Work out of project directory
WORKDIR /app

# Update system
RUN apt-get update && apt-get upgrade

# Install the required system dependencies to build and run our project
RUN apt-get install -y nodejs dos2unix &&\
    curl -l https://www.npmjs.com/install.sh | sh &&\
    npm install -g yarn

COPY Gemfile Gemfile.lock ./

RUN bundle install && yarn install

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]