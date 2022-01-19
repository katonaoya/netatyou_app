class Unit < ApplicationRecord
  has_one_attached :image
  scope :performer, ->(live) { find(Comedian.where(live_id: live).map(&:unit_id)) }

  scope :belongs_unit, ->(user) { Unit.find(user.participations.map(&:solicitation_id)) }
  


  validates :name, presence: true
  validates :kana, presence: true
  validates :birthday, presence: true
  validates :belongs, presence: true

  has_many :solicitations, class_name: "Relationship", foreign_key: "solicitation_id"
  has_many :netas
  has_many :comedians
end
