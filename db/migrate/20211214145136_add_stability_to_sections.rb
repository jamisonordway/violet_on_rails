class AddStabilityToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :stability, :integer
  end
end
