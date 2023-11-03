class CommentsController < ApplicationController
  def new
    @commment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    current_user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = post
    if @comment.save
      flash[:notice] = 'Comment has been created successfully'
      redirect_to user_post_path(current_user, post)
    else
      flash.now[:error] = "Error: Couldn't create comment"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end