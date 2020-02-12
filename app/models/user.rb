class User < ApplicationRecord
    has_many :adoptions
    has_many :pokepets, through: :adoptions 
    has_secure_password
end
