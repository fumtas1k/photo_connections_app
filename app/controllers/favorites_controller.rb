class FavoritesController < ApplicationController
  before_action :ensure_user, only: %i[create destroy]
  def create
    favorite = current_user.favorites.build(picture_id: params[:picture_id])
    if favorite.save
      redirect_back fallback_location: pictures_path, notice: "#{favorite.picture.user.name}さんの写真をお気に入り登録しました"
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:danger] = "#{favorite.picture.user.name}さんの写真をお気に入り解除しました"
    redirect_back fallback_location: pictures_path
  end
  private
  def ensure_user
    picture = Picture.find_by(id: params[:picture_id])
    if picture.user.id == current_user.id
      flash[:danger] = "自分をお気に入り登録・削除はできません!"
      redirect_back fallback_location: pictures_path
    end
  end
end
