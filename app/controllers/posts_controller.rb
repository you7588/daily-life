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



  private

  def post_params
    params.require(:post).permit(:content)
  end

end
