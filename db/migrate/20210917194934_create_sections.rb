class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.references :song, foreign_key: true
      t.integer :label
      t.string :section_type
      t.text :lyrics

      t.timestamps
    end
  end
end
