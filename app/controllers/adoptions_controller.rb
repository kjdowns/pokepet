class AdoptionsController < ApplicationController
    
    def new_pet
        @poke_pet = PokePet.find(params[:poke_pet_id])
        @adoption = Adoption.new
    end

    def create
        @adoption = Adoption.create(adoption_params)
        redirect_to user_path(current_user)
    end

    private

    def adoption_params
        params.require(:adoption).permit(:user_id, :poke_pet_id, :nickname)
    end

end