class UrlService
  def initialize(url, user_agent)
    @user_agent = user_agent
    @url = url
  end

  def call
    Redis.current.lpush(@url.short_url, [Time.zone.now.to_datetime.to_s(:db), @user_agent].to_json)
  end
end
