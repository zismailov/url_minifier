class UrlDecorator < Draper::Decorator
  delegate_all

  def full_url
    "http://#{object.long_url}"
  end
end
