class Advertisement < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :tag, presence: true
end
