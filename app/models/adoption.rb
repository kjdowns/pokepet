class Adoption < ApplicationRecord
    belongs_to :user
    belongs_to :poke_pet

    validates :hunger, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
    validates :thirst, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
    validates :happiness, numericality: {greater_than_or_equal_to: 0}

    def filter_action(action)
        case action
            when "feed"
                self.feed
            when "water"
                self.water
            when "play"
                self.play
        end
    end

    def feed
        self.hunger -= 1
        self.happiness += 1
        if self.save
            self.user.sub_treats(1)
            if self.user.save
                "You clicked feed!"
            end
        end
    end

    def water
        self.thirst = 0
        self.happiness += 1
        if self.save
            "You clicked water!"
        end
    end

    def play
        self.happiness += 1
        self.hunger += 1
        self.thirst += 1
        if self.save
            self.user.sub_toys(1)
            if self.user.save
                "You clicked play!"
            end
        end
    end

end
