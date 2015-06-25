class AddDomainNameAndForwardUrlFlagToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :domain_name, :string
    add_column :themes, :forward_url, :boolean, default: false
  end
end
