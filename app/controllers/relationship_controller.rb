class RelationshipController < ApplicationController

  def create
    # @user = User.find_by(id: params[:id])
    # following = @current_user.follow(@user)
    # if following.save
    #   redirect_to("/user/#{params[:id]}/show")
    # else
    # end

    @relationship = Relationship.new(
      user_id: @current_user.id,
      follow_id: params[:id]
    )
    @relationship.save
    redirect_to("/user/#{params[:id]}/show")
  end

  def destroy
    # @user = User.find_by(id: params[:id])
    # following = @current_user.unfollow(@user)
    # if following.destroy
    #   redirect_to("/user/#{params[:id]}/show")
    # else
    # end

    @relationship = Relationship.find_by(
      user_id: @current_user.id,
      follow_id: params[:id]
    )
    @relationship.destroy
    redirect_to("/user/#{params[:id]}/show")
  end

end
