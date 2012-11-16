class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to :root, notice => "Ready"
    end
  end

  def show
    @user = User.find_by_username(params[:id])
  end

end
