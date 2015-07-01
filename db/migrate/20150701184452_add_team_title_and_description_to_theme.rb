class AddTeamTitleAndDescriptionToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :team_page_title, :string
    add_column :themes, :team_page_description, :text
  end
end
