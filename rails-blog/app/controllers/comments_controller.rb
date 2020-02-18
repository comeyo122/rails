class CommentsController < ApplicationController

  def index
  end

  def create
    @comment = Comment.create comment_params
    render "create.js", locals: {comment: @comment}
  end

  def new
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    render "edit.js", locals: {comment: @comment}
  end
  
  def show
  end
  
  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.comment = params[:comment][:comment]
    @comment.save
    render "update.js", locals: {comment: @comment}
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    render "destroy.js", locals: {comment: @comment}
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end

  def update_params
    params.require(:comment).permit(:comment_id, :comment, :user_id, :post_id)
  end
  private
  def load_post
    @post = Post.find_by(id: params[:id])
  end

 

end
