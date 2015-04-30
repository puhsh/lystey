class AddBuyersAndSellersGuideInfoToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :buyers_guide_page_title, :string
    add_column :themes, :buyers_guide_page_main_copy, :text
    add_column :themes, :sellers_guide_page_title, :string
    add_column :themes, :sellers_guide_page_main_copy, :text
  end
end
