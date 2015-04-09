class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :realtor_id
      t.string :address_type
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :city
      t.string :state_code
      t.string :zip_code
      t.string :county_code
      t.timestamps null: false
    end

    add_index :addresses, :realtor_id
    add_index :addresses, :address_type
  end
end
