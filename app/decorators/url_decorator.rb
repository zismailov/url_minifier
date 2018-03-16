class UrlDecorator < Draper::Decorator
  delegate_all

  def full_url
    "http://#{h.request.host_with_port}/#{object.short_url}"
  end

  def created_ago
    "#{h.time_ago_in_words(object.created_at)} ago"
  end
end
