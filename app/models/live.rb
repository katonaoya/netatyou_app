class Live < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true
  validates :theater, presence: true
  validates :date, presence: true
end
