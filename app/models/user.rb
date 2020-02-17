class User < ApplicationRecord
    has_many :adoptions
    has_many :pokepets, through: :adoptions 
    has_secure_password

    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :poke_dollars, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000, message: "You cannot hold more than 1,000,000 %{attribute} in your wallet!"}
    validates :treats, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}
    validates :poke_toys, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}
    validates :poke_dolls, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 20}

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

    def add_toys(num)
        self.poke_toys += num
    end

    def withdraw_funds
        self.poke_dollars += 1000
        if self.save
            "You withdrew 1000 PokeDollars from the bank!"
        else
            "You cannot hold more than 1,000,000 PokeDollars in your wallet!"
        end
    end

    def filter_action(action)
        case action
            when "treat"
                
            when "toy"
                
            when "doll"
                
        end
    end

end
