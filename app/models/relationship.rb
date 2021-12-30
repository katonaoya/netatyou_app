class Relationship < ApplicationRecord
  belongs_to :solicitation , class_name: "Unit"
  belongs_to :participation, class_name: "User"
end
