class LikeController < ApplicationController

  def create
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:id]
    )
    @like.save
    redirect_to("/post/#{params[:id]}/show")
  end

  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      post_id: params[:id]
    )
    @like.destroy
    redirect_to("/post/#{params[:id]}/show")
  end
end