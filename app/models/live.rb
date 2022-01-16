class Live < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comedians
  has_many :staffs

# appearance = 出演する
  scope :appearance, ->(unit) { find(Comedian.where(unit_id: unit.id).map(&:live_id)) }
  scope :line_up , ->(live_id) { Unit.find(find(live_id).comedians.order(turn: :asc).ids)}

  validates :title, presence: true
  validates :theater, presence: true
  validates :date, presence: true
end
