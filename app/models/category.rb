class Category < ApplicationRecord
    has_many :albums
    validates :name, presence:true

    has_one_attached :image

    def artistas
        Artist.joins(:albums).where(albums: {id: self.albums.ids}).distinct
    end
    def songs
        Song.joins(:album).where(songs: {id: self.albums.ids}).distinct
    end
end
