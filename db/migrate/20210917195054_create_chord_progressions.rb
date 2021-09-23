class CreateChordProgressions < ActiveRecord::Migration[5.2]
  def change
    create_table :chord_progressions do |t|
      t.references :section, foreign_key: true
      t.text :description
      t.text :content

      t.timestamps
    end
  end
end
