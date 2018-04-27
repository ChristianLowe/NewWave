# New Wave
New Wave is a Discord bot which provides text-to-speech functionality for your voice channels.

## Installing
New Wave is designed to run on a Raspberry Pi. To install: 
1. Uncomment lines 5 & 6 in the Dockerfile.
2. Set the ENV values to your Discord bot token and clientid (aquired here: https://discordapp.com/developers/applications/me/)
3. Install docker for your Raspberry Pi (instructions here: https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/)
4. Run the following two commands:
```bash
sudo docker build -t new-wave .
sudo docker run -d new-wave
```
This will run New Wave in the background. If you want to run it in the foreground, run:
```bash
sudo docker run new-wave
```

## Usage
New Wave will output an invite url when it is run. Click on it to bring your bot onto your server.

Once it is on, join a voice channel and send a message to a channel in your server:
`!tts hello, world!`
