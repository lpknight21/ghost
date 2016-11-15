#Description:
#	Calls the destiny api for stats.
#
#Commands:
#	hubot destiny <gamertag|my|me> <action>

https = require 'https'

module.exports = (robot) ->
	robot.respond /destiny (.*) (.*)/i, (msg) ->
		gamer = msg.match[1]
		action = msg.match[2]
		username = msg.message.user.name

		if gamer == 'my' || gamer == 'me'
			gamer = ''

		url = "https://2g.be/twitch/destinyv2.php?action=#{action}&gamertag=#{gamer}&user=#{username}&defaultconsole=xbox"

		msg.http(url)
			.get() (err, res, body) ->
				try
					response = '```' + body + '```'
					msg.send response
				catch error
					msg.send "Trouble fetching destiny info."