class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def show
    @post = Post.find(params[:id])
    @user = current_user
    @resume = Resume.find_by(user_id: @user.id)
  end

  def index
    @posts = Post.all
    @posts = Post.where(nil)
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
    @user = current_user
    filtering_params(params).each do |key, value|
      @posts = @posts.public_send(key, value) if value.present?
    end
    if params[:page].to_i>0
      @pass_item = (params[:page].to_i-1)*10
    else
      @pass_item = (params[:page].to_i)*10
    end
  end

  def new
    @user = current_user
    @post = Post.new
    @post.categories = params[:categories]
    @post.location = params[:location]
    @post.position = params[:position]
    @post.user_id = current_user.id
    @post.logo = current_user.avatar
    @post.about = current_user.about
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
    @post.logo = current_user.avatar
    @post.about = current_user.about
    @user_email= User.where(skill: @post.skill, roles_mask: 1).pluck(:email)
    respond_to do |format|
      if @post.save
        AppMailer.email_name(@post, @user_email).deliver
        format.html { redirect_to [@post], notice: 'New job was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def update
    @user = current_user
    @post = Post.find(params[:id])
    @post.categories = params[:categories]
    @post.location = params[:location]
    @post.position = params[:position]
    @post.user_id = current_user.id
    @post.logo = current_user.avatar
    @post.about = current_user.about

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

  def manager_post
    @user = current_user
    @post = Post.where(user_id: current_user.id)
  end

  def searchuser
    @user_skill=params[:skill]
    @user_location=params[:location]
    @user_find=User.where(skill: @user_skill, location: @user_location )
  end
  
  private

  def post_params
    params.require(:post).permit(:title,:company, :address, :endday, :body, :published, :user_id, :categories, :location, :position, :skill, :phone, :map, :logo, :about, :salary)
  end

  def filtering_params(params)
    params.slice(:title, :salary, :categories, :location, :position)
  end

end