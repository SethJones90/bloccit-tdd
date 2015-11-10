class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each do |post| #vs each_with_index do |post, index| .... index % 5 == 0
      if post.id % 5 == 0
        post.title = "SPAM"
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save

      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving your post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post saved successfully."
      redirect_to @post
    else
      flash[:error] = "There was an error while saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to posts_path
    else
      flash[:error] = "There was an error deleting the post. Please try again."
      render :show
    end
  end
end
