class AdoptionsController < ApplicationController
    
    def new_pet
        @poke_pet = PokePet.find(params[:poke_pet_id])
        @adoption = Adoption.new
    end

    def create
    end

    private

    def adoption_params
        params.require(:adoption).permit(:user_id, :poke_pet_id, :nickname)
    end

end