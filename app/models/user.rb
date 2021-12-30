class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true, inclusion: { in: %w(芸人 スタッフ) }

  has_many :participations, class_name: "Relationship", foreign_key: "participation_id"
  has_many :belongs_unit, through: :participations, source: :solicitations
  

end
