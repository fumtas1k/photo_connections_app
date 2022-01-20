class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  def show
    @pictures = Picture.where(user_id: @picture.user.id).order(created_at: :desc).limit(6)
  end

  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def new
    @picture = Picture.new
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to @picture, notice: "写真を投稿しました!"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: "投稿を編集しました!"
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
