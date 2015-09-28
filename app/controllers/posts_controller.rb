class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def show
    @post = Post.find(params[:id])
    @user = current_user
  end

  def index
    @posts = Post.all.order("id DESC")
    @posts = Post.where(nil)
    @user = current_user
    filtering_params(params).each do |key, value|
      @posts = @posts.public_send(key, value) if value.present?
    end
  end

  def new
    @user = current_user
    @post = Post.new
    @post.categories = params[:categories]
    @post.location = params[:location]
    @post.position = params[:position]
    @post.user_id = current_user.id
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])

  end
  
  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.categories = params[:categories]
    @post.location = params[:location]
    @post.position = params[:position]
    @post.user_id = current_user.id

    if @post.save
      redirect_to [@post]
    else
      render :new
    end
  end
  
  def update
    @user = current_user
    @post = Post.find(params[:id])
    @post.categories = params[:categories]
    @post.location = params[:location]
    @post.position = params[:position]
    @post.user_id = current_user.id

    if @post.update(post_params)
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :show
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    title = @post.title

    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @post
    else
      flash[:error] = "There was an error deleting the post."
      render :index
    end
  end

  def apply
  end

  def manager_post
    @user = current_user
    @post = Post.where(user_id: current_user.id)
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :body, :published, :user_id, :categories, :location, :position, :skill, :salary)
  end

  def filtering_params(params)
    params.slice(:title, :salary, :categories, :location, :position)
  end

end