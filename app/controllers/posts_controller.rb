class PostsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def show
    @post = Post.find(params[:id])
    authorize! :read, @post
  end

  def index
    @posts = Post.all.order("id DESC")
    @posts = Post.where(nil)
    filtering_params(params).each do |key, value|
      @posts = @posts.public_send(key, value) if value.present?
    authorize! :read, @post
    end
  end

  def new
    @post = Post.new
    @post.categories = params[:categories]
    @post.location = params[:location]
    @post.position = params[:position]
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.categories = params[:categories]
    @post.location = params[:location]
    @post.position = params[:position]
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
    @post.position = params[:position]

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
    params.require(:post).permit(:title, :body, :published, :user_id, :categories, :location, :position, :skill, :salary)
  end

  def filtering_params(params)
    params.slice(:title, :salary, :categories, :location, :position)
  end

end