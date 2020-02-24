class PokePetsController < ApplicationController
    before_action :require_login

    def index
        @pokepets = PokePet.all
    end
    
    private

    def poke_pet_params
        params.require(:poke_pet).permit(:name, :type, :image, :max_level)
    end

end