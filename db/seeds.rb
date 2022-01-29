# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name:       "松本人志",
  email:      "matumoto@mail.com",
  password:   "1",
  role:       "芸人",
  birthday:   "1-1-1",
  activated: true,
  activated_at: Time.zone.now
  )

User.create!(
  name:       "浜田雅功",
  email:      "hamada@mail.com",
  password:   "1",
  role:       "芸人",
  birthday:   "1-1-1",
  activated: true,
  activated_at: Time.zone.now
  )

User.create!(
  name:       "国崎 和也",
  email:      "kunisaki@mail.com",
  password:   "1",
  role:       "芸人",
  birthday:   "1-1-1",
  activated: true,
  activated_at: Time.zone.now
  )

User.create!(
  name:       "川北茂澄",
  email:      "kawakita@mail.com",
  password:   "1",
  role:       "芸人",
  birthday:   "1-1-1",
  activated: true,
  activated_at: Time.zone.now
  )

Unit.create!(
  name: "ダウンタウン",
  kana: "ダウンタウン",
  birthday: "1-1-1",
  belongs: "よしもとクリエイティブ・エージェンシー"
)

Unit.create!(
  name: "ランジャタイ",
  kana: "ランジャタイ",
  birthday: "1-1-1",
  belongs: "よしもとクリエイティブ・エージェンシー"
)

Unit.create!(
  name: "真空ジェシカ",
  kana: "シンクウジェシカ",
  birthday: "1-1-1",
  belongs: "よしもとクリエイティブ・エージェンシー"
)

Relationship.create!(
  solicitation_id: 1,
  participation_id: 1
)

Relationship.create!(
  solicitation_id: 2,
  participation_id: 3
)

Relationship.create!(
  solicitation_id: 3,
  participation_id: 4
)

Neta.create!(
  title: "ダウンタウン",
  dialogue: "ああああ",
  item: "椅子・机",
  minute: 3,
  second: 40,
  unit_id: 1
)

Neta.create!(
  title: "ランジャタイ",
  dialogue: "ああああ",
  item: "椅子・机",
  minute: 3,
  second: 40,
  unit_id: 2
)

Neta.create!(
  title: "真空ジェシカ",
  dialogue: "ああああ",
  item: "椅子・机",
  minute: 3,
  second: 40,
  unit_id: 3
)

