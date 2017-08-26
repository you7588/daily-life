class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user

  def edit
    @user.create_profile unless @user.profile
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "修改成功！~"
      redirect_to edit_user_path
    else
      render "edit"
    end
  end

  def show
  end

  protected

  def user_params
    params.require(:user).permit(:email, :name, :profile_attributes => [:id, :nickname, :birthday, :location, :motto, :bio, :wechat])
  end

  def find_user
    @user = current_user
    @user.create_profile unless @user.profile
  end
end
