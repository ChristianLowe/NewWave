require 'discordrb'
require 'tts'

abort 'Please set enviromental variables DISCORD_TOKEN and DISCORD_CLIENTID' unless (!ENV['DISCORD_TOKEN'].nil? and !ENV['DISCORD_CLIENTID'].nil?)

bot = Discordrb::Commands::CommandBot.new token: ENV["DISCORD_TOKEN"], client_id: ENV["DISCORD_CLIENTID"], prefix: '!'

puts "Invite url: #{bot.invite_url}"

bot.command(:tts, min_args: 1) do |event|
  File.delete 'audio.mp3' if File.exist? 'audio.mp3'

  channel = event.user.voice_channel

  next "You're not in any voice channel!" unless channel

  bot.voice_connect(channel)

  text = event.text.split[1..-1].join(' ') # Remove '!tts' from the text
  text.to_file 'en', 'audio.mp3'

  voice_bot = event.voice
  voice_bot.play_file 'audio.mp3'
end

bot.run
