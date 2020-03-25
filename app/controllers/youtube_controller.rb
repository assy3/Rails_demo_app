class YoutubeController < ApplicationController
  require 'rubygems'
  require 'google/apis/youtube_v3'
  # require 'trollop'

  API_KEY = "AIzaSyBPVettgbut7W51LeYaoag1Ej45P6hSEfg"
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def get_service
      youtube = Google::Apis::YoutubeV3::YouTubeService.new
      youtube.key = API_KEY
      return youtube
  end

  def index
    youtube = get_service
    @youtube = youtube.list_searches("id,snippet", type: "channel", q: "ヒカキン", max_results: 5)

  end
end
