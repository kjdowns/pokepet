class Adoption < ApplicationRecord
    belongs_to :user
    belongs_to :poke_pet

    validates :hunger, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
    validates :thirst, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
    validates :happiness, numericality: {greater_than_or_equal_to: 0}

    scope :max_level, -> {where('level = "MAX"')}

    def filter_action(action)
        case action
            when "feed"
                self.feed
            when "water"
                self.water
            when "play"
                self.play
            when "doll"
                self.doll
        end
    end

    def feed
        self.hunger -= 1
        self.happiness += 1
        if self.valid?
            self.user.sub_treats(1)
            if self.user.save
                self.save
                "You fed your PokePet with a PokeTreat. It is feeling less hungry now!"
            else
                "Oh, no! You don't seem to have enough PokeTreats!"
            end
        else
            "Your PokePet is not hungry right now"
        end
    end

    def water
        self.thirst = 0
        self.happiness += 1
        self.save
        "You put out some water for your PokePet. It seems to be much less thirsty now!"
    end

    def play
        self.happiness += 1
        self.hunger += 1
        self.thirst += 1
        if self.valid? 
            self.user.sub_toys(1)
            if self.user.save
                self.save
                "You used a PokeToy to play with your PokePet!"
            else
                "Oh, no! You don't seem to have enough PokeToys to play with!"
            end
        else
            "Your PokePet is famished! Try feeding or giving them water before playing again."
        end
    end

    def doll
        if self.user.poke_dolls > 0
            self.user.sub_dolls(1)
            self.user.save 
            self.happiness += 10
            self.save
            "Your PokePet loved the PokeDoll you gave them so much their level increased by 1!"
        else
            "Oh, no! You dont seem to have any PokeDolls!"
        end
    end

    def update_level
        self.level = (self.happiness / 10) + 1
        if self.level.to_i >= self.poke_pet.max_level
            self.level = "MAX"
        end
        self.save
    end

    def train
        if self.level != "MAX"
            if self.hunger < 5 && self.thirst < 5
                self.happiness += 10
                self.hunger = 5
                self.thirst = 5
                self.save
                "#{self.nickname} trained hard enough to gain a level!"
            else
                "#{self.nickname} looks a little famished. Try giving them some treats and water before training again."
            end
        else
            "#{self.nickname} is MAX level, it seems that training won't do them much good!"
        end
    end

end
