class Adoption < ApplicationRecord
    belongs_to :user
    belongs_to :poke_pet
end
