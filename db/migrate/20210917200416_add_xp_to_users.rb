class AddXpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :xp, :integer
  end
end
