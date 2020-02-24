class TownsController < ApplicationController
    before_action :require_login
    
    def grove
        @adoptions = current_user.adoptions.max_level
    end

    def bank_action
        message = current_user.withdraw_funds
        redirect_to bank_path, notice: message
    end

    def shop_action
        message = current_user.filter_action(params[:shop_action])
        redirect_to shop_path, notice: message
    end

    def training_action
        @adoption = Adoption.find(params[:user][:adoption_id])
        message = @adoption.train 
        @adoption.update_level
        redirect_to training_path, notice: message
    end
    
end