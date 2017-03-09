#Description:
#	Calls the gwent api for card stats.
#
#Commands:
#	!info <cardName>

https = require 'https'

module.exports = (robot) ->
	robot.respond /(.*)/i, (msg) ->
		gamer = msg.match[1]
		action = msg.match[2]
		username = msg.message.user.name

		if gamer == 'my' || gamer == 'me'
			gamer = ''

		url = "https://vast-fortress-18504.herokuapp.com/card/name/#{{cardName}}/info"

		msg.http(url)
			.get() (err, res, body) ->
				try
					msg.send body
				catch error
					msg.send "Trouble fetching card info."