class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build( comment_params )
    @comment.user = current_user

    if @comment.save
      redirect_to topic_path(@topic)
    else
      render "/topics/show"
    end
  end

  def destroy
    @topic = Topic.find( params[:topic_id] )
    @comment = @topic.comments.find( params[:id] )

    if comment.can_delete_by?(current_user)
      @comment.destroy
    end

    redirect_to :back
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

end
