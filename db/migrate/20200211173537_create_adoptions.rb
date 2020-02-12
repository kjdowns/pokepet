class CreateAdoptions < ActiveRecord::Migration[6.0]
  def change
    create_table :adoptions do |t|
      t.integer :user_id
      t.integer :poke_pet_id
      t.string :nickname
      t.integer :hunger, :default => 2
      t.integer :thirst, :default => 2
      t.integer :happiness, :default => 0
      t.integer :exp, :default => 0
      t.integer :level, :default => 1
      t.timestamps
    end
  end
end
