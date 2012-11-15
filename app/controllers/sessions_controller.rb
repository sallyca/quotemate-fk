class SessionsController < ApplicationController

  respond_to :html, :js

  before_filter :require_login, :only => :destroy

  def new
  end

  def create
    user_hash = params[:user] || {}
    @user = login(user_hash[:username], user_hash[:password])
    if @user
      redirect_to root_url, :notice => "Logged in!"
    else
      logger.info "not logged"
      redirect_to root_url, :notice => "Not Logged in!"
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end

end
