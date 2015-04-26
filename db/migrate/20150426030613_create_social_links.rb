class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.integer :agent_id
      t.string :site
      t.string :url
      t.timestamps null: false
    end

    add_index :social_links, :agent_id
  end
end
