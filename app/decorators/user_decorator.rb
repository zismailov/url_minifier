class UserDecorator < Draper::Decorator
  delegate_all

  def greeting
    "Hi, #{email_info}"
  end

  def email_info
    object.email
  end
end
