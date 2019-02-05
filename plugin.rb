# name: Discourse Aparat Onebox
# about: Adds support for embedding aparat.com videos within Discourse.
# version: 0.1
# authors: M H
# url: https://github.com/mhosseinab/discourse-aparat-onebox

class Onebox::Engine::AparatOnebox
	include Onebox::Engine

	REGEX = /^https?:\/\/www.aparat.com\/v\/(\w+)/
	matches_regexp REGEX

	def id
		@url.match(REGEX)[1]
	end
	
	def to_html
		%{
		  <aside class="onebox aparatvideo">
		    <header class="source">
		      <a href="https://www.aparat.com/v/#{id}" target="_blank" rel="nofollow noopener">aparat.com</a>
		    </header>
		    <article class="onebox-body">
		      <iframe class="embed-responsive-item" data-src="https://www.aparat.com/video/video/embed/videohash/#{id}/vt/frame" height="360" width="640" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true" src="https://www.aparat.com/video/video/embed/videohash/#{id}/vt/frame"></iframe>
		    </article>
		    <div class="onebox-metadata">
		    </div>
		    <div style="clear: both"></div>
		  </aside>
		}
	end
end 
