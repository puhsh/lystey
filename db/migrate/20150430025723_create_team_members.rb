class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.references :team, index: true, foreign_key: true
      t.string :full_name
      t.text :bio
      t.string :phone_number
      t.string :email
      t.timestamps null: false
    end
  end
end
