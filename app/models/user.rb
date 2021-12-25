class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true, inclusion: { in: %w(芸人 スタッフ) }
end
