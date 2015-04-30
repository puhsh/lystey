class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.references :agent, index: true, foreign_key: true
      t.string :client_name
      t.text :text
      t.string :client_facebook_link
      t.timestamps null: false
    end
  end
end
