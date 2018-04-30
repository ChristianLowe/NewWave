require 'discordrb'
require 'tts'

abort 'Please set enviromental variables DISCORD_TOKEN and DISCORD_CLIENTID' unless (!ENV['DISCORD_TOKEN'].nil? and !ENV['DISCORD_CLIENTID'].nil?)

bot = Discordrb::Commands::CommandBot.new token: ENV["DISCORD_TOKEN"], client_id: ENV["DISCORD_CLIENTID"], prefix: '!'

puts "Invite url: #{bot.invite_url}"

file_count = 0

bot.command(:tts, min_args: 1) do |event|
  file_count += 1
  file_name = "audio#{file_count}.mp3"

  channel = event.user.voice_channel

  next "You're not in any voice channel!" unless channel

  voice_bot = bot.voice_connect(channel)

  print event.text
  text = event.text.split[1..-1].join(' ').tr('^A-Za-z0-9!@#$?\s',' ') # Remove '!tts' from the text
  puts ': ' + text

  if text.length > 0
    text.to_file 'en', file_name
    voice_bot.play_file file_name
    #bot.send_message(event.channel, 'Audio done')
  end

  File.delete file_name
  nil
end

bot.command(:restart) do |event|
  bot.send_message(event.channel.id, 'OK')
  exit
end

bot.run
