class PostController < ApplicationController
  before_action :not_login_user
 
  def index
    # @post = Post.all.order(created_at: "DESC")

    @user = User.find_by(id: @current_user.id)
    @relationship = Relationship.where(user_id: @user.id)
    # @post = Post.where(user_id: @relationship.follow_id)

    # @users = @current_user.followings
  end

  def new

  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
      )
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/post/index")
    else
      flash[:notice] = "投稿に失敗しました"
      render("post/new")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/post/index")
    if @current_user.id != @post.user.id
      flash[:notice] = "権限がありません"
      redirect_to("/post/index")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user.id
      flash[:notice] = "権限がありません"
      redirect_to("/post/index")
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "編集しました"
      redirect_to("/post/index")
    else
      flash[:notice] = "編集に失敗しました"
      render("post/edit")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @comment = Comment.where(post_id: @post.id)
  end
end
