class User < ApplicationRecord
    has_many :adoptions
    has_many :pokepets, through: :adoptions 
    has_secure_password
    validates :user_name, presence: true
    validates :user_name, uniqueness: true
end
