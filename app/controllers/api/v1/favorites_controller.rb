class Api::V1::FavoritesController < ApplicationController
    def index
        @favorites_albums = crurrent_user.favorites.where(favoritable_type: "Album").map(&:favoritable)
        @favorites_songs =  crurrent_user.favorites.where(favoritable_type: "Song").map(&:favoritable)
        @favorites_artists =  crurrent_user.favorites.where(favoritable_type: "Artist").map(&:favoritable)
    end
    def create 
        @favoritable = current_user.favorites.new(favoritable_type: params[:favoritable_type], favoritable_id: 
        params[:id])
        @favoritable.save
        head :ok
    end
    def destroy 
        @favoritable = current_user.favorites.find_by(favoritable_type: params[:favoritable_type], favoritable_id: 
        params[:id])
        @favoritable.destroy
        head :ok
    end
end
