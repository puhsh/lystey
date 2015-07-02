class CreateTeamOpenings < ActiveRecord::Migration
  def change
    create_table :team_openings do |t|
      t.integer :team_id
      t.string :position_title
      t.text :position_description
      t.timestamps null: false
    end

    add_index :team_openings, :team_id
  end
end
