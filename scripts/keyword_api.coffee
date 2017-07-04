#Description:
#	Calls the gwent api for card stats.
#
#Commands:
#	hubot keyword <keywordName>

https = require 'https'

module.exports = (robot) ->
	robot.respond /keyword (.*)/i, (msg) ->
		keywordName = msg.match[1]

		url = "https://cardlife-api.herokuapp.com/keyword/name/#{keywordName}/text"

		msg.http(url)
			.get() (err, res, body) ->
				try
					msg.send body
				catch error
					msg.send "Trouble fetching keyword info."