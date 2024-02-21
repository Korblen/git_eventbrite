class UsersController < ApplicationController
    def show
        @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        @user = User.find(params[:id])
      
        if @user.update(user_params)
          redirect_to @user, notice: 'Les informations de l\'utilisateur ont été mises à jour avec succès.'
        else
          render :edit
        end
    end

    private

    def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description)
    end
end