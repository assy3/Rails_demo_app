class YoutubesController < ApplicationController
  API_KEY = "AIzaSyBPVettgbut7W51LeYaoag1Ej45P6hSEfg"
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def index
    youtube = get_service
    @youtube = youtube.list_searches("id, snippet", type: "channel", q: "エガちゃんねる", max_results: 5)
    @you = youtube.list_channels("id, snippet, statistics", id: "UCZf__ehlCEBPop-_sldpBUQ")
    # type playlist video
  end

# クエリからチャンネル情報取得
  def get_service
      youtube = Google::Apis::YoutubeV3::YouTubeService.new
      youtube.key = API_KEY
      return youtube
  end

# クエリから動画情報取得
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

  def video
    @youtube_data = find_videos('明日香ちゃんねる')
  end


  def review
    recieved_youtube = get_service
    @you = recieved_youtube.list_channels("id, snippet, statistics", id: "UCL6JY2DXJNDOIqCP1CRADng")
  end

  def sample
  end

end
