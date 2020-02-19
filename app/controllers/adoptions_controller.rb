class AdoptionsController < ApplicationController
    
    def new
        @poke_pet = PokePet.find(params[:poke_pet_id])
        @adoption = Adoption.new
    end

    def create
        @adoption = Adoption.create(adoption_params)
        redirect_to user_path(current_user)
    end

    def show
        @adoption = Adoption.find_by(id: params[:id])
    end

    def update
        @adoption = Adoption.find(params[:id])
        message = @adoption.filter_action(params[:adoption][:adopt_action])
        @adoption.update_level
        redirect_to user_adoption_path(current_user, @adoption), notice: message
    end

    def destroy
        @adoption = Adoption.find(params[:id])
        message = "#{@adoption.nickname} was released to the wild!"
        @adoption.destroy
        redirect_to user_path(current_user), notice: message
    end

    private

    def adoption_params
        params.require(:adoption).permit(:user_id, :poke_pet_id, :nickname)
    end

end