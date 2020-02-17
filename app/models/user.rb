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

    def sub_dolls(num)
        self.poke_dolls -= num
    end

    def add_dolls(num)
        self.poke_dolls += num
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
                self.sub_pokedollars(100)
                if self.valid?
                    self.add_treats(1)
                    if self.save 
                        "You bought a PokeTreat!"
                    else
                        "You can only hold 50 PokeTreats! Try again when you have less in your Inventory."
                    end
                else
                    "You need at least 100 PokeDollars to buy a PokeTreat!"
                end
            when "toy"
                self.sub_pokedollars(200)
                if self.valid?
                    self.add_toys(1)
                    if self.save 
                        "You bought a PokeToy!"
                    else
                        "You can only hold 50 PokeToys! Try again when you have less in your Inventory."
                    end
                else
                    "You need at least 200 PokeDollars to buy a PokeToy!"
                end
            when "doll"
                self.sub_pokedollars(500)
                if self.valid?
                    self.add_dolls(1)
                    if self.save 
                        "You bought a PokeDoll!"
                    else
                        "You can only hold 20 PokeDolls! Try again when you have less in your Inventory."
                    end
                else
                    "You need at least 500 PokeDollars to buy a PokeDoll!"
                end
        end
    end

end
