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
  end

  def new
  end

  def edit
  end
end
