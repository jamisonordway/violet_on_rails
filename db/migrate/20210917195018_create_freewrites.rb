class CreateFreewrites < ActiveRecord::Migration[5.2]
  def change
    create_table :freewrites do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.text :body

      t.timestamps
    end
  end
end
