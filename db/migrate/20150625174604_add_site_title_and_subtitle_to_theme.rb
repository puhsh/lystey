class AddSiteTitleAndSubtitleToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :site_title, :string
    add_column :themes, :site_subtitle, :string
  end
end
