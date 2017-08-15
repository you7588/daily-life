class FeedbacksController < ApplicationController
 before_action :authenticate_user!, :only => [:create, :destroy]

  def index
    @feedbacks = Feedback.order("id DESC").all
  end

   def create
     @feedback = Feedback.new(feedback_params)
     @feedback.user = current_user
     @feedback.save

   end

   def destroy
     @feedback = current_user.feedbacks.find(params[:id]) # 只能删除自己的贴文
     @feedback.destroy

   end

  def like
    @feedback = Feedback.find(params[:id])
    unless @feedback.find_like(current_user)  # 如果已经按讚过了，就略过不再新增
      Like.create( :user => current_user, :feedback => @feedback)
    end

    redirect_to feedbacks_path
  end

  def unlike
    @feedback = Feedback.find(params[:id])
    like = @feedback.find_like(current_user)
    like.destroy

    redirect_to feedbacks_path
  end

   protected

   def feedback_params
     params.require(:feedback).permit(:content)
    end

end
