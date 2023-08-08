class User < ApplicationRecord
    validates :flickr_user_id, presence: true
    require 'flickr'

    def fetch_photos
      flickr = Flickr.new(ENV['FLICKR_API_KEY'],ENV['FLICKR_API_SECRET'])

  
      flickr.photos.search(user_id: flickr_user_id)
    end
end
