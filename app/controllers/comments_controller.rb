class CommentsController < ApplicationController
  def create
    @comment = Comment.new(
      content: params[:content],
      user_id: @current_user.id,
      post_id: params[:id]
    )
    if @comment.save
      redirect_to("/post/index")
      flash[:notice] = "コメントしました"
    else
      redirect_to("/post/index")
      flash[:notice] = "コメントに失敗しました"
    end
  end

  def new
    @post = Post.find_by(id: params[:id])
  end

  def reply
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.new(
      content: params[:content],
      user_id: @current_user.id,
      reply_id: params[:id]
    )
    if @comment.save
      redirect_to("/post/index")
      flash[:notice] = "返信しました"
    else
      redirect_to("/post/index")
      flash[:notice] = "返信に失敗しました"
    end
  end
end
