class Staff < ApplicationRecord
  has_many :users
  has_many :lives
end
