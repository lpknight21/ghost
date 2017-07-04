#Description:
#	Calls the gwent api for card stats.
#
#Commands:
#	hubot card img for <cardName>

https = require 'https'

module.exports = (robot) ->
	robot.respond /card img for (.*)/i, (msg) ->
		cardName = msg.match[1]

		url = "https://cardlife-api.herokuapp.com/card/name/#{cardName}/image"

		msg.http(url)
			.get() (err, res, body) ->
				try
					msg.send body
				catch error
					msg.send "Trouble fetching card image."