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
    @posts = Post.all.order("id DESC")
    @posts = Post.where(nil)
    filtering_params(params).each do |key, value|
      @posts = @posts.public_send(key, value) if value.present?
    end
  end

  def new
    @post = Post.new
    @post.categories = params[:categories]
    @post.location = params[:location]
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.categories = params[:categories]
    @post.location = params[:location]
    @post.user_id = @user.id

    if @post.save
      redirect_to [@post]
    else
      render :new
    end
  end
  
  def update
    @post = Post.find(params[:id])
    @post.categories = params[:categories]
    @post.location = params[:location]

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
    params.require(:post).permit(:title, :body, :published, :salary, :user_id, :categories, :location, :position, :joblevel)
  end

  def filtering_params(params)
    params.slice(:title, :salary, :categories, :location)
  end

end