class Unit < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :kana, presence: true
  validates :birthday, presence: true
  validates :belongs, presence: true

  has_and_belongs_to_many :users
end
