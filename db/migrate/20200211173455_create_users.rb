class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.integer :poke_dollars
      t.integer :treats
      t.integer :poke_toys
      t.integer :poke_dolls
      t.timestamps
    end
  end
end
