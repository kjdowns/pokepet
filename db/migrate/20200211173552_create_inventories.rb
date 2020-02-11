class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :poke_dollars
      t.integer :treats
      t.integer :poke_toys
      t.integer :poke_dolls
      t.integer :user_id
      t.timestamps
    end
  end
end
