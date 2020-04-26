class CommentsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  before_action :set_blog, only: [:new, :create, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end


  def new
    @comment = @blog.comments.new
    @comment.user = current_user
    authorize @comment
  end

  def edit
    @blog = Blog.friendly.find(params[:blog_id])
    @comment = @blog.comments.friendly.find(params[:id])
    authorize @comment
  end

  def create
    @comment = @blog.comments.new(comment_params)
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to blog_path(@blog), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    @comment = @blog.comments.new(comment_params)
    @comment.user = current_user
    authorize @comment
    if @comment.update(comment_params)
      redirect_to blog_path(@blog), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.friendly.find(params[:blog_id])
    @comment = @blog.comments.friendly.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to blog_path(@blog), notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:blog_id])
    end

    def set_comment
      @blog = Blog.friendly.find(params[:blog_id])
      @comment = @blog.comments.friendly.find(params[:id])
      authorize @comment
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
