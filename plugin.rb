#!/bin/env ruby
# encoding: utf-8
# name: Discourse Aparat Onebox
# about: Adds support for embedding Aparat.com media within Discourse.
# version: 0.2.1
# authors: M H
# url: https://github.com/mhosseinab/discourse-aparat-onebox

Onebox = Onebox

  class Onebox::Engine::AparatOnebox
  include Onebox::Engine
  
  def self.priority
    0
  end
  
  REGEX = /^https?\:\/\/www\.aparat\.com\/v\/(\w*)/
  matches_regexp REGEX

  def id
    @url.match(REGEX)[1]
  end
  
  def to_html
    return %{
        <aside class="onebox video-onebox aparat-onebox">
          <header class="source">
            <a href="https://www.aparat.com/v/#{id}" target="_blank" rel="noopener">https://www.aparat.com/v/#{id}</a>
          </header>
          <article class="onebox-body">
            <div class="embed-responsive embed-responsive-#{id}">
              <iframe class="embed-responsive-item" data-src="https://www.aparat.com/video/video/embed/videohash/#{id}/vt/frame" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true" src="https://www.aparat.com/video/video/embed/videohash/#{id}/vt/frame" width="640" height="360"></iframe>
            </div>
          </article>
          <div class="onebox-metadata">
          </div>
          <div style="clear: both"></div>
        </aside>
      }
  end
end 
