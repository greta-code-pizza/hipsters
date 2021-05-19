class Advertisement < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :tag, presence: true

  def self.find_random_advert
    Advertisement.all.sample
  end
end
