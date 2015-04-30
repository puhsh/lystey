class AddSlugToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :slug, :string

    add_index :agents, :slug
  end
end
