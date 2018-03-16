class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :url

  def greeting
    "Hi, #{email_info}"
  end

  def email_info
    object.email
  end

  def full_url
    "http://#{h.request.host_with_port}/#{object.urls.last.short_url}"
  end

  def count_link
    "[#{object.urls.count}]"
  end
end
