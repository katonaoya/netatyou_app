# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_130_075_053) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.integer 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'comedians', force: :cascade do |t|
    t.integer 'live_id', null: false
    t.integer 'unit_id', null: false
    t.integer 'neta_id'
    t.integer 'turn'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[live_id neta_id], name: 'index_comedians_on_live_id_and_neta_id'
    t.index %w[live_id unit_id], name: 'index_comedians_on_live_id_and_unit_id'
    t.index ['live_id'], name: 'index_comedians_on_live_id'
    t.index ['neta_id'], name: 'index_comedians_on_neta_id'
    t.index %w[unit_id neta_id], name: 'index_comedians_on_unit_id_and_neta_id'
    t.index ['unit_id'], name: 'index_comedians_on_unit_id'
  end

  create_table 'lives', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'theater'
    t.date 'date'
    t.string 'item'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'neta', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'dialogue', null: false
    t.string 'item'
    t.integer 'minute'
    t.integer 'second'
    t.integer 'unit_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'relationships', force: :cascade do |t|
    t.integer 'solicitation_id'
    t.integer 'participation_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['participation_id'], name: 'index_relationships_on_participation_id'
    t.index %w[solicitation_id participation_id],
            name: 'index_relationships_on_solicitation_id_and_participation_id', unique: true
    t.index ['solicitation_id'], name: 'index_relationships_on_solicitation_id'
  end

  create_table 'staffs', force: :cascade do |t|
    t.string 'position'
    t.integer 'user_id', null: false
    t.integer 'live_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[live_id user_id], name: 'index_staffs_on_live_id_and_user_id'
    t.index ['live_id'], name: 'index_staffs_on_live_id'
    t.index ['user_id'], name: 'index_staffs_on_user_id'
  end

  create_table 'units', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'kana', null: false
    t.date 'birthday', null: false
    t.string 'belongs', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['kana'], name: 'index_units_on_kana'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', null: false
    t.string 'password_digest', null: false
    t.string 'role', null: false
    t.string 'skill'
    t.date 'birthday'
    t.text 'profile'
    t.integer 'main_unit_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'activation_digest'
    t.boolean 'activated', default: false
    t.datetime 'activated_at'
    t.boolean 'admin', default: false, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
end
