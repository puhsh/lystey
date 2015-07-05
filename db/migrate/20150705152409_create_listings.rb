class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :agent_id
      t.string :mls_number
      t.string :url
      t.timestamps null: false
    end

    add_index :listings, :agent_id
    add_index :listings, :mls_number
  end
end
