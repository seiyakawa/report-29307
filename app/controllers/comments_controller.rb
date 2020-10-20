class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/reports/#{comment.report.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, report_id: params[:report_id])
  end
  
end
