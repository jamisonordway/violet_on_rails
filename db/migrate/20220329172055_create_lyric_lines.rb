class CreateLyricLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lyric_lines do |t|
      t.string :content
      t.integer :stability
      t.references :section

      t.timestamps
    end
  end
end
