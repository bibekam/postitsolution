class PostsController < ApplicationController
  before_action :set_action, only:[:show, :edit, :update]

  def index
      @posts = Post.all
  end

  def show
 end

  def new
      @post = Post.new
  end

  def create

    @post =Post.new(post_params)
    @post.creator = User.first

    if @post.save
       flash[:notice] = "Your Post created"
       redirect_to posts_path
    else
         render :new
    end
  end

  def edit

  end

  def update
      if @post.update(post_params)
         flash[:notice] = "Your Post Updated"
         redirect_to post_path(@post)
      else
         render :edit
      end
  end

  def post_params

    params.require(:post).permit(:title, :url, :description)
  end

  def set_action
    @post =Post.find(params[:id])
  end

end
