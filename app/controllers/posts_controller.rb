class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    post = Post.find(params[:id])    
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)  #must indicate the exclamation mark(bang) inprder for it to raise the active record exception.Otherwise would just return the invalid object.
    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors},status: :unprocessable_entity
  end

end
