class PostsController < ApplicationController
  # GET /posts or /posts.json
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    current_user = User.find(params[:user_id])
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:notice] = 'Post has been created successfully'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = "Error: Couldn't create post"
      render :new, status: :unprocessable_entity
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by!(id: params[:id], author_id: params[:user_id])
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
