class Api::PostsController < ApplicationController
  def show
    render json: post
  end

  def index
    render json: Post.all
  end

  def create
    post = Post.create(post_params)
    if post.persisted?
      render json: post
    else
      render json: post, status: :not_acceptable
    end
  end

  def update
    if post.update_attributes(post_params)
      render json: post
    else
      render json: post, status: :not_acceptable
    end
  end

  def destroy
    post.destroy
    render json: {}
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.permit(:author, :content)
  end

end
