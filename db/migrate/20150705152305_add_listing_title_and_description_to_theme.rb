class AddListingTitleAndDescriptionToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :listing_page_title, :string
    add_column :themes, :list_page_main_copy, :text
  end
end
