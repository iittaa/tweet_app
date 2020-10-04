class UserController < ApplicationController
  before_action :not_login_user, {only:[:edit,:index,:show]}
  before_action :login_user, {only:[:login,:new]}
  

  def index
    @user = User.all
  end

  def login
  end

  def new
    
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "デフォルトユーザー.jpg"
    )
    if @user.save
      flash[:notice] = "ユーザーを作成しました"
      redirect_to("/user/#{@user.id}/show")
      session[:user_id] = @user.id
    else
      flash[:notice] = "ユーザー作成に失敗しました"
      render("user/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @current_user.id != @user.id
      flash[:notice] = "権限がありません"
      redirect_to("/post/index")
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/user/#{@user.id}/show")
    else
      flash[:notice] = "ユーザー情報の編集に失敗しました"
      render("user/edit")
    end
  end  

  def login_form
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    if @user
      flash[:notice] = "ログインしました"
      redirect_to("/post/index")
      session[:user_id] = @user.id
    else
      @email = params[:email]
      @password = params[:password]
      flash[:notice] = "ログインに失敗しました"
      render("user/login")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/user/login")
  end

  def like
    @user = User.find_by(id: params[:id])
    @like = Like.where(user_id: params[:id])
  end

  def following
    @user = User.find_by(id: params[:id])
    @relationship = Relationship.where(user_id: params[:id])
  end

  def followers
    @user = User.find_by(id: params[:id])
    @relationship = Relationship.where(follow_id: params[:id])
  end

end
