class Unit < ApplicationRecord
  include UnitUser
  has_one_attached :image

  validates :name, presence: true
  validates :kana, presence: true
  validates :birthday, presence: true
  validates :belongs, presence: true

  has_many :solicitations, class_name: "Relationship", foreign_key: "solicitation_id"

  has_many :cola, through: :solicitations, source: :participation_id
 
end
