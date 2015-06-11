class AddLineThreeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :line_3, :string
  end
end
