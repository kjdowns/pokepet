class CreateAdoptions < ActiveRecord::Migration[6.0]
  def change
    create_table :adoptions do |t|
      t.integer :user_id
      t.integer :pokepet_id
      t.string :nickname
      t.integer :hunger
      t.integer :thirst
      t.integer :happiness
      t.integer :exp
      t.integer :level
      t.timestamps
    end
  end
end
