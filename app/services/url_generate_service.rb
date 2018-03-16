class UrlGenerateService
  def initialize(url)
    @url = url
  end

  def call
    return unless @url.short_url.empty?
    @url.short_url = generate_code
    @url.save
  end

  private

  def generate_code
    hashids = Hashids.new(ENV["HASHIDS_KEY"])
    hashids.encode(@url.id, @url.user.id)
  end
end
