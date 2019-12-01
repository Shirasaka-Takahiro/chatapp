class UsersController < ApplicationController
    before_action :authenticate_user! 

    def show
      @user = User.find(params[:id])
    end

    def index
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
      redirect_to admin_users_url
      flash[:notice] = "ユーザー#{@user.username}を削除しました。"    
      end
    end

end
