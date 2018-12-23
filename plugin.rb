# name: Discourse Aparat Onebox
# about: Adds support for embedding aparat.com videos within Discourse.
# version: 0.1
# authors: M H
# url: https://github.com/mhosseinab/discourse-aparat-onebox

class Onebox::Engine::PlaysTVOnebox
	include Onebox::Engine

	REGEX = /^https?:\/\/www.aparat.com\/v\/(\w+)/
	matches_regexp REGEX

	def id
		@url.match(REGEX)[1]
	end
	
	def to_html
		"<div id=\"aprt#{id}\"><script type=\"text/JavaScript\" src=\"https://www.aparat.com/embed/#{id}?data[rnddiv]=aprt#{id}&data[responsive]=yes\"></script></div>"
	end
end
