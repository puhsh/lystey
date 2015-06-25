class UpdateDefaultColorsForThemes < ActiveRecord::Migration
  def change
    change_column :themes, :background_color, :string, default: '#ffffff'
    change_column :themes, :font_color, :string, default: '#000000'
    change_column :themes, :button_color, :string, default: '#930b12'
    change_column :themes, :font, :string, default: :helvetica

  end
end
