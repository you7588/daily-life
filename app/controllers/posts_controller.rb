class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @orid = Orid.find(params[:orid_id])
    @post = Post.new
  end

  def create
    @orid = Orid.find(params[:orid_id])
    @post = Post.new(post_params)
    @post.orid = @orid
    @post.user = current_user

    if @post.save
      redirect_to orid_path(@orid)
    else
      render :new
    end
  end

  def edit
    @orid = Orid.find(params[:orid_id])
    @post = Post.find(params[:id])
  end

  def update
    @orid = Orid.find(params[:orid_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to account_posts_path
    else
      render :edit
    end

  end

  def destroy
    @orid = Orid.find(params[:orid_id])
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:alert] = "删除成功"
      redirect_to account_posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
