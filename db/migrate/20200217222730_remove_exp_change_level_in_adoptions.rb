class RemoveExpChangeLevelInAdoptions < ActiveRecord::Migration[6.0]
  def change
    change_column :adoptions, :level, :text
    remove_column :adoptions, :exp
  end
end
