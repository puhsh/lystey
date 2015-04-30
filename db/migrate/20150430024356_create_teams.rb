class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :agent, index: true, foreign_key: true
      t.string :title
      t.text :about
      t.boolean :primary_agent, default: true
      t.boolean :hiring, default: false
      t.string :hiring_title
      t.text :hiring_details
      t.timestamps null: false
    end
  end
end
