class CreateJobOpenings < ActiveRecord::Migration
  def change
    create_table :job_openings do |t|
      t.references :team, index: true, foreign_key: true
      t.string :job_title
      t.text :job_description
      t.timestamps null: false
    end
  end
end
