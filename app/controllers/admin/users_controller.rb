class Admin::UsersController < ApplicationController
  before_action :admin_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user)
      flash[:notice] = "#{@user.username}を登録しました。"
    else
      render :new
    end

  end

  def edit
  end

  def show
  end

  def index
    @user = User.where.not(id: current_user.id)
  end

  private

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
