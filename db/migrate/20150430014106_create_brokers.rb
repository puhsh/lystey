class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
      t.references :agent, index: true, foreing_key: true
      t.string :name
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone_number
      t.string :fax_number
      t.string :email
      t.timestamps null: false
    end
  end
end
