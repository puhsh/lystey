class CreateBiographies < ActiveRecord::Migration
  def change
    create_table :biographies do |t|
      t.references :agent, index: true, foreing_key: true
      t.string :title
      t.string :short_bio
      t.text :long_bio
      t.timestamps null: false
    end
  end
end
