class UsersController < ApplicationController
    before_action :authenticate_user! 

    def show
      @user = current_user.id
    end

    # def index
    #   @user = User.find(params[:id])
    # end

    def edit
      @user = current_user.id
    end

    def update
    end

end
