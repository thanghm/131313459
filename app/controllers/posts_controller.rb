class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = Post.find(params[:id])
  end

  def users
    @users = User.all
  end

  def posts
    @posts = Post.all
  end

  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post.user_id = User.find(id)
    @post = Post.new(post_params)

    if @post.save
      redirect_to [@post]
    else
      render :new
    end
  end
  
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    title = @post.title

    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @post
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :body, :published, :salary, :user_id , :categories, :location, :position, :joblevel)
  end
end