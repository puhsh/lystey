class AddLogoToTheme < ActiveRecord::Migration
  def change
    add_attachment :themes, :logo
  end
end
