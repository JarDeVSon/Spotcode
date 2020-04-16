class Api::V1::RecentlyHeardsController < ApplicationController

    def create
        @recently_heards = current_user.recently_heards.new(album:id params[:album_id])
        @recently_heards.save
        head :ok
        
    end
end
