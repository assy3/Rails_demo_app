class YoutubeapisController < ApplicationController

  # require 'rubygems'
  # require 'google/apis/youtube_v3'
  require 'google/apis/youtube_v3'
  # require 'trollop'

  API_KEY = "AIzaSyBPVettgbut7W51LeYaoag1Ej45P6hSEfg"
  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 3,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, opt)
  end

  def index
    @youtube_data = find_videos('明日香ちゃんねる')
  end





end
