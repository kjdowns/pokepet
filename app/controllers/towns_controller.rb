class TownsController < ApplicationController

    def bank_action
        redirect_to bank_path, notice: "You withdrew 1000 PokeDollars from the bank!"
    end

    def shop_action
        redirect_to shop_path
    end

    def training_action
        redirect_to training_path
    end
    
end