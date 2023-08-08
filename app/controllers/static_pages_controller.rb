class StaticPagesController < ApplicationController
  def home
  end

  def photos
    user = User.new(flickr_user_id: params[:flickr_user_id])

    if user.valid?
      @photos = user.fetch_photos
    else
      flash.now[:alert] = 'Invalid Flickr User ID'
    end

    render :home
  end

end
