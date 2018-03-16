class Url < ApplicationRecord
  belongs_to :user

  validates :long_url, presence: true
  validates :short_url, uniqueness: true
  validates :life_term, :delay_time, numericality: { only_integer: true }, allow_blank: true

  after_create :set_short_url

  private

  def set_short_url
    return unless short_url.empty?
    self.short_url = generate_code
    save
  end

  def generate_code
    hashids = Hashids.new(ENV["HASHIDS_KEY"])
    hashids.encode(id, user_id)
  end
end
