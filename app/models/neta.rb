class Neta < ApplicationRecord
  validates :title, presence: true
  validates :dialogue, presence: true
  belongs_to :unit
  has_many :comedians
end
