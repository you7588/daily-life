class OridsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_orid_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @orids = Orid.only_public.all
  end

  def show
    @orid = Orid.find(params[:id])
    @posts = @orid.posts.recent
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

  # def bulk_update
  #   total = 0
  #   Array(params[:ids]).each do |orid_id|
  #     orid = Orid.find(orid_id)
  #
  #     if params[:commit] == I18n.t(:bulk_update)
  #       orid.status = params[:orid_status]
  #       if orid.save
  #         total += 1
  #       end
  #     elsif params[:commit] == I18n.t(:bulk_delete)
  #       orid.destroy
  #       total += 1
  #     end
  #   end
  #
  #   flash[:alert] = "成功而完成 #{total} 笔"
  #   redirect_to orids_path
  # end

  private

  def orid_params
    params.require(:orid).permit(:title, :date, :objective, :reflective, :interpretive, :decisional, :status)
  end

  def find_orid_and_check_permission
    @orid = Orid.find(params[:id])

    if current_user != @orid.user
      redirect_to root_path, alert: "亲，这不是你的地盘~"
    end
  end
end
