class PostsController < ApplicationController
    #before_action :load_post, only: [:show, :destroy, :update, :edit]
    before_action :authenticate_user!, only: [:new, :edit]

    def index
      @posts=Post.all
    end

    def bulletin
      @posts=Post.all
    end
  
    def new
      @post=Post.new
    end
  
    def create
      post=Post.create(post_params)
      post.hit+=1
      redirect_to posts_path
      
    end
  
    def show
      @post = Post.find_by(id: params[:id])
      @post.hit+=1
      @post.save
    end
  
    def destroy
      post = Post.find_by(id: params[:id])
      post.destroy
      redirect_to posts_path
    end
  
    def update
      post = Post.find_by(id: params[:id])
      post.update(post_params)
      redirect_to posts_path
    end
  
    def edit
      @post = Post.find_by(id: params[:id])
    end

    private 
    def post_params
      params.require(:post).permit(:title, :body, :user_id, :hit)
    end

    private
    def load_post
        @post = Post.find_by(id: params[:id])
    end 
  end
  
  
  