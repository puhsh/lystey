class AddLatAndLongToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :office_latitude, :float
    add_column :addresses, :office_longitude, :float
  end
end
