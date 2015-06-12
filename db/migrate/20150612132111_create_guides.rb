class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.integer :agent_id
      t.string :guide_type
      t.string :guide_title
      t.text :content
      t.timestamps null: false
    end

    add_index :guides, :agent_id
  end
end
