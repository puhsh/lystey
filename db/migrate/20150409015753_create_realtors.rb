class CreateRealtors < ActiveRecord::Migration
  def change
    create_table :realtors do |t|
      t.integer :user_id
      t.string :license_type
      t.string :license_number
      t.string :full_name
      t.string :suffix
      t.string :license_status
      t.datetime :original_license_date
      t.datetime :license_expiration_date
      t.string :education_status
      t.string :mce_status
      t.string :designated_supervisor_flag
      t.string :phone_number
      t.string :email
      t.string :related_license_type
      t.string :related_license_number
      t.string :related_license_full_name
      t.string :related_license_suffix
      t.datetime :relationship_start_date
      t.string :agency_identifier
      t.string :key_name
      t.timestamps null: false
    end

    add_index :realtors, :user_id
    add_index :realtors, :license_number, unique: true
  end
end
