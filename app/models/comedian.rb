class Comedian < ApplicationRecord
  belongs_to :live
  belongs_to :neta, optional: true
  belongs_to :unit
end
