class RemoveRealtors < ActiveRecord::Migration
  def change
    drop_table :realtors
  end
end
