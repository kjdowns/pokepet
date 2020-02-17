class TownsController < ApplicationController

    def bank_action
        message = current_user.withdraw_funds
        redirect_to bank_path, notice: message
    end

    def shop_action
        redirect_to shop_path
    end

    def training_action
        redirect_to training_path
    end
    
end