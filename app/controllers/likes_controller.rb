class LikesController < ApplicationController
  
  before_filter :require_login

  def like
    quote = Quote.find(params[:quote][:id])
    current_user.vote_for(quote) if quote
    render :partial => '/likes/like', :locals => {:quote => quote, :options => JSON.parse(params[:options]).symbolize_keys}
  end

end
