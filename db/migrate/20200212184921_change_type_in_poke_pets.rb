class ChangeTypeInPokePets < ActiveRecord::Migration[6.0]
  def change
    rename_column :poke_pets, :type, :element
  end
end
