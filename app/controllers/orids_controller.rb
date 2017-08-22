class OridsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_orid_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @orids = Orid.only_public.all
  end

  def show
    @orid = Orid.find(params[:id])
    @posts = @orid.posts.recent
    @orid.increment
  end

  def new
    @orid = Orid.new
  end

  def create
    @orid = Orid.new(orid_params)
    @orid.user = current_user

    if @orid.save
      redirect_to orids_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @orid.update(orid_params)
      redirect_to orids_path
    else
      render :edit
    end
  end

  def destroy
    @orid.destroy
    redirect_to orids_path
  end

  private

  def orid_params
    params.require(:orid).permit(:title, :date, :objective, :reflective, :interpretive, :decisional, :status, :keyword)
  end

  def find_orid_and_check_permission
    @orid = Orid.find(params[:id])

    if current_user != @orid.user
      redirect_to root_path, alert: "亲，这不是你的地盘~"
    end
  end
end
