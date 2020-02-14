class Adoption < ApplicationRecord
    belongs_to :user
    belongs_to :poke_pet

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
        if self.save
            "You clicked feed!"
        end
    end

    def water
        self.thirst = 0
        if self.save
            "You clicked water!"
        end
    end

    def play
        self.happiness += 1
        if self.save
            "You clicked play!"
        end
    end

end
