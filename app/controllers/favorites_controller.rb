class FavoritesController < ApplicationController
    def create
        @favorite = current_user.favorites.create(neta_id: params[:neta_id])
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        @neta = Neta.find(params[:neta_id])
        @favorite = current_user.favorites.find_by(neta_id: @neta.id)
        @favorite.destroy
        #root_pathが見つからなかったら
        redirect_back(fallback_location: root_path)
      end
end
