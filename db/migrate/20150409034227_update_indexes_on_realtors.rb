class UpdateIndexesOnRealtors < ActiveRecord::Migration
  def change
    remove_index :realtors, :license_number
    add_index :realtors, :license_number
  end
end
