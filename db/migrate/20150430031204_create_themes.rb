class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.references :agent, index: true, foreign_key: true
      t.string :tagline
      t.string :background_color
      t.string :font_color
      t.string :button_color
      t.string :font
      t.string :testimonial_page_title
      t.text :testimonial_page_main_copy
      t.timestamps null: false
    end
  end
end
