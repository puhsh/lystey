class AddDescriptionToSocialLinks < ActiveRecord::Migration
  def change
    add_column :social_links, :description, :string
  end
end
