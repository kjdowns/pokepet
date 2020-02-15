class User < ApplicationRecord
    has_many :adoptions
    has_many :pokepets, through: :adoptions 
    has_secure_password
    validates :user_name, presence: true
    validates :user_name, uniqueness: true

    def sub_pokedollars(num)
        self.poke_dollars -= num
    end

    def add_pokedollars(num)
        self.poke_dollars += num
    end
    
    def sub_treats(num)
        self.treats -= num
    end

    def add_treats(num)
        self.treats += num
    end
    
    def sub_toys(num)
        self.poke_toys -= num
    end

    def add_treats(num)
        self.poke_toys += num
    end

end
