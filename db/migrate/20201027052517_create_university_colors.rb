class CreateUniversityColors < ActiveRecord::Migration[6.0]
  def change
    create_table :university_colors do |t|
      t.references :university, null: false, foreign_key: true
      t.string :color_code

      t.timestamps
    end
  end
end
