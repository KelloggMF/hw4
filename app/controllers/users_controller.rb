class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"]
    @user["email"] = params["user"]["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    if User.find_by({"email" => params["user"]["email"]}) != nil
      flash["notice"] = "Please use existing log-in."
      redirect_to "/sessions/new"
    else
      @user.save
      redirect_to "/posts"
    end 
  end
end
