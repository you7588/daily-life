class FeedbacksController < ApplicationController
 before_action :authenticate_user!, :only => [:create, :destroy]

  def index
    @feedbacks = Feedback.order("id DESC").all
  end

   def create
     @feedback = Feedback.new(feedback_params)
     @feedback.user = current_user
     @feedback.save

     redirect_to feedbacks_path
   end

   def destroy
     @feedback = current_user.feedbacks.find(params[:id]) # 只能删除自己的贴文
     @feedback.destroy

   end

   protected

   def feedback_params
     params.require(:feedback).permit(:content)
    end

end
