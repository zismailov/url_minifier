class ErrorService
  def initialize(url)
    @url = url
  end

  def call
    errors = []
    errors << "Can't find this link." if @url.id.nil?
    errors << "This link is not active already" if @url.life_term && @url.created_at + @url.life_term < Time.zone.now
    errors << "This link is not active yet" if @url.delay_time && @url.created_at + @url.delay_time > Time.zone.now
    errors
  end
end
