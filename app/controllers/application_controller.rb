class ApplicationController < ActionController::Base
before_action :current_user

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def not_login_user
    if @current_user == nil
      redirect_to("/user/login")
      flash[:notice] = "ログインしてください"
    end
  end

  def login_user
    if @current_user != nil
      redirect_to("/post/index")
      flash[:notice] = "ログインしています"
    end
  end

  # def only_follow_user
    
  # end

end
