class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.references :agent, foreign_key: true, index: true
      t.string :certification_type, null: false
      t.timestamps null: false
    end

    add_index :certifications, :certification_type
  end
end
