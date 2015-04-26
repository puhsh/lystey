class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :agent_id
      t.string :address_type
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.timestamps null: false
    end

    add_index :addresses, :agent_id
    add_index :addresses, :address_type
  end
end
