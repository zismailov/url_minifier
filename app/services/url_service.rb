class UrlService
  def initialize(url)
    @url = url
  end

  def call
    Redis.current.lpush(@url.long_url, @url.short_url)
  end
end
