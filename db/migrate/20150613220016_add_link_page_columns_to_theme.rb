class AddLinkPageColumnsToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :link_page_title, :string
    add_column :themes, :link_page_main_copy, :text
  end
end
