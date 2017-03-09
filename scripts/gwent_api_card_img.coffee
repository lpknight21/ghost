#Description:
#	Calls the gwent api for card stats.
#
#Commands:
#	!img <cardName>

https = require 'https'

module.exports = (robot) ->
	robot.respond /!img (.*)/i, (msg) ->
		cardName = msg.match[1]

		url = "https://vast-fortress-18504.herokuapp.com/card/name/#{cardName}/image"

		msg.http(url)
			.get() (err, res, body) ->
				try
					msg.send body
				catch error
					msg.send "Trouble fetching card image."