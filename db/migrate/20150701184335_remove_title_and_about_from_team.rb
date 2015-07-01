class RemoveTitleAndAboutFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :title
    remove_column :teams, :about
  end
end
