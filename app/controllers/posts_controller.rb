class PostsController < ApplicationController
  def new 
    @post = Post.new
  end
  
  def index
  end
end
