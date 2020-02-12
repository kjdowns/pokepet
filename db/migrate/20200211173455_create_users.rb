class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.integer :poke_dollars, :default => 1000
      t.integer :treats, :default => 10
      t.integer :poke_toys, :default => 10
      t.integer :poke_dolls, :default => 5
      t.timestamps
    end
  end
end
