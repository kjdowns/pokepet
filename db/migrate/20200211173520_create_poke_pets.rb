class CreatePokePets < ActiveRecord::Migration[6.0]
  def change
    create_table :poke_pets do |t|
      t.string :name
      t.string :type
      t.string :image
      t.integer :max_level
      t.timestamps
    end
  end
end
