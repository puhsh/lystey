class AddSameAddressToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :same_as_office, :boolean, default: false
  end
end
