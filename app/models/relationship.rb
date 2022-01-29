class Relationship < ApplicationRecord
  belongs_to :solicitation , class_name: "Unit"
  # 自分のsolicitation_idをforeign_keyとし、Unitクラスのunit_idを結びつける。
  belongs_to :participation, class_name: "User"
end
