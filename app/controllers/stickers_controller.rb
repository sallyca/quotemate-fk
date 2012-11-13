class StickersController < InheritedResources::Base

  respond_to :json, :html
  
  def random_quotes
    @sticker = Sticker.new
    @quotes = Quote.limit(10) 
  end

  def index
    @sticker = Sticker.new
    @stickers = Sticker.all
    @stickers = @stickers.reject { |sticker| sticker.user!=current_user  }
    respond_with(@stickers)
  end

  def create
    @sticker = Sticker.new(params[:sticker])
    @sticker.user = current_user

    respond_to do |format|
      if @sticker.save
        format.html { redirect_to :stickers, notice: 'sticker was successfully created.' }
        format.json { render json: @sticker, status: :created, location: @sticker }
      else
        format.html { render action: "new" }
        format.json { render json: @sticker.errors, status: :unprocessable_entity }
      end
    end
  end

end
