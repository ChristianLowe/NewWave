FROM resin/raspberry-pi-alpine:latest

#  Uncomment these statements and set the values only if you do not plan to share this file.
#  Otherwise, pass the environmental variables into docker through the command line.
# ENV DISCORD_TOKEN=yourtokenhere
# ENV DISCORD_CLIENTID=yourclientidhere

RUN apk update
RUN apk add --no-cache \
  build-base ruby ruby-bundler ruby-rdoc ruby-dev opus-dev libsodium-dev ffmpeg

COPY Gemfile ./
RUN bundle install

COPY . .

CMD ["ruby", "bot.rb"]

