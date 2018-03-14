FactoryBot.define do
  factory :user do
    email { generate(:user_email) }
    password "123456"
    password_confirmation { password }
  end
end
