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
        @adoption.filter_action(params[:adoption][:adopt_action])
        if @adoption.save && @adoption.user.save
            redirect_to user_adoption_path(current_user, @adoption)
        else
            render :show
        end
    end

    def destroy
        Adoption.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end

    private

    def adoption_params
        params.require(:adoption).permit(:user_id, :poke_pet_id, :nickname)
    end

end