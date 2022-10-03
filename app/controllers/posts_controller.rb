class PostsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response #Catches all record invalid errors for the create and update controller
#The Record invalid exception is only raised by active record when any action tries to write to the db with the bang operator at the end.

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
