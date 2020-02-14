class Adoption < ApplicationRecord
    belongs_to :user
    belongs_to :poke_pet

    def self.filter_action(action)
        case action
            when "feed"
                "You clicked feed!"
            when "water"
                "You clicked water!"
            when "play"
                "You clicked play!"
        end
    end
    
end
