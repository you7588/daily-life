class OridsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @orids = Orid.all
  end

  def show
    @orid = Orid.find(params[:id])
  end

  def new
    @orid = Orid.new
  end

  def create
    @orid = Orid.new(orid_params)
    if @orid.save
      redirect_to orids_path
    else
      render :new
    end
  end

  def edit
    @orid = Orid.find(params[:id])
  end

  def update
    @orid = Orid.find(params[:id])
    if @orid.update(orid_params)
      redirect_to orids_path
    else
      render :edit
    end
  end

  def destroy
    @orid = Orid.find(params[:id])
    @orid.destroy
    redirect_to orids_path
  end

  private

  def orid_params
    params.require(:orid).permit(:title, :date, :objective, :reflective, :interpretive, :decisional, :status)
  end
end
