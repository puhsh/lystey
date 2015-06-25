class AddButtonTextColorToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :button_text_color, :string, default: '#ffffff'
  end
end
