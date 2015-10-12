class ResumesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = current_user
    @resumes = Resume.where(user_id: current_user.id)
  end

  def show
    @user = current_user
  end

  def new
    @user = current_user
    @resume = Resume.new    
    @resume.user_id = current_user.id
  end

  def apply
    @user = current_user
    @resume = Resume.new    
    @resume.user_id = current_user.id
    @post = Post.find(params[:post_id])
    @resumes = Resume.last
  end

  def edit
    @user = current_user
    @resume = Resume.find(params[:id])
  end

  def create
    @user = current_user
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id

    respond_to do |format|
      if @resume.save
        format.html { redirect_to [@resume], notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def applyto
    @user = current_user
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id

    @post = Post.find(params[:post_id]) 
    @resume.post_id = @post.id
    @user_post = User.find_by(:id => @post.user_id)

    @send_post = Post.where(skill: @post.skill)

    respond_to do |format|
      if @resume.save
        AppMailer.apply_job(@post, @user_post, @user, @resume, @send_post).deliver
        format.html { redirect_to [@resume], notice: 'Apply for job successfully!.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user
    @resume = Resume.find(params[:id])
    @resume.user_id = current_user.id
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to @resume, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_resume
      @resume = Resume.find(params[:id])
    end

    def resume_params
      params.require(:resume).permit(:attachment, :letter, :user_id, :post_id)
    end
end
