class Neta < ApplicationRecord
  validates :title, presence: true
  validates :dialogue, presence: true
  belongs_to :unit
  has_many :comedians

  scope :performance, ->(unit) { find(Comedian.find_by(unit_id: unit.id).neta_id).title }
end
