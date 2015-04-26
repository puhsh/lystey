class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.boolean :registered, default: false
      t.string :first_name
      t.string :last_name
      t.string :suffix
      t.string :license_number
      t.string :license_type
      t.string :license_county
      t.string :phone_number
      t.string :fax_number
      t.string :email
      t.timestamps null: false
    end
  end
end
