class PokePet < ApplicationRecord
    has_many :adoptions
    has_many :users, through: :adoptions
end
