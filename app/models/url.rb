class Url < ApplicationRecord
  belongs_to :user

  validates :long_url, presence: true
  validates :short_url, uniqueness: true
  validates :life_term, :delay_time, numericality: { only_integer: true }, allow_blank: true
end