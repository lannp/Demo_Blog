class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      flash[:success] = "comment created!"
      redirect_back_or root_url
    else
      redirect_back_or root_url
    end  
  end

  def destroy
    @comment.destroy
    flash[:success] = "comment deleted"
    redirect_to request.referrer || root_url
  end

  private

    def comments_params
      params.require(:comment).permit(:content, :user_id, :entry_id)
    end
  def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
