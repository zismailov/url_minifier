FactoryBot.define do
  factory :url do
    long_url { FFaker::Internet.http_url }
    short_url { FFaker::Internet.http_url }
    life_term "1"
    delay_time "2"
    user
  end

  trait :empty_short_url do
    short_url ""
  end
end
