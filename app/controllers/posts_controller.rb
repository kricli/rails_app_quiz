class PostsController < ApplicationController
  def index
    @posts = Post.all # retrieve all the Post data, and store them in the variable @posts
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: { message: "401 Bad Request"}, status: 400
    end
  end

  def post_params
  params.require(:post).permit(:title, :content, :category)
end
end
