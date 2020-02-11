class User < ApplicationRecord
    has_many :adoptions
    has_many :pokepets, through: :adoptions 
end
