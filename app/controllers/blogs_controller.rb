class BlogsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_blog, only: [:show, :edit, :update, :destroy, :upvote, :unvote]

  def index
    @blogs = policy_scope(Blog).order(created_at: :desc)
  end

  def show
  end

  def new
    @blog = current_user.blogs.new
    authorize @blog
  end

  def edit
  end


  def create
    @blog = current_user.blogs.new(blog_params)
    authorize @blog
    if @blog.save
      redirect_to @blog, notice: "L'article a bien été créé."
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "L'article a bien été modifié."
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: "L'article a bien été supprimé."
  end

  def upvote
    @blog.liked_by current_user
    redirect_to action: "index"
  end  

  def unvote
    @blog.unliked_by current_user
    redirect_to action: "index"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
    authorize @blog
  end

  # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:name, :description, :descriptionindex, :image)
  end
end
