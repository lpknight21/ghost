#Description:
#	Calls the destiny api for stats. 
#
#Commands:
#	hubot 

http = require 'http'

module.exports = (robot) ->
	robot.hear /destiny (.*) (.*) (.*)/i, (res) ->
		gamer = res.match[1]
		action = res.match[2]
		console = res.match[3]
		username = res.message.user.name

		if gamer == 'my' || gamer == 'me'
			gamer = ''

		response = http.get {uri:'https://2g.be/twitch/destinyv2.php?action='+action+'&gamertag='+gamer+'&user='+username+'&console='+console+'&defaultconsole=xbox'} (err, r, body) ->
			response = body
			console.log = "Response from destiny api."
		
		res.send response