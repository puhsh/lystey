class RenameListPageMainCopyColumn < ActiveRecord::Migration
  def change
    rename_column :themes, :list_page_main_copy, :listing_page_main_copy
  end
end
