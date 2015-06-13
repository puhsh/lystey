class RemoveUnusedColumnsFromThemes < ActiveRecord::Migration
  def change
    remove_column :themes, :buyers_guide_page_title
    remove_column :themes, :buyers_guide_page_main_copy
    remove_column :themes, :sellers_guide_page_title
    remove_column :themes, :sellers_guide_page_main_copy

  end
end
