module UsersHelper
  def get_user_image_url(user)
    if user.image && user.image.url
      user.image.url
    else
      "dummy_user.jpg"
    end
  end

  def get_favorite_counts(user)
    user.favorites ? user.favorites.count : 0
  end

  def get_favorite_me_counts(user)
    user.pictures.inject(0) {|sum, picture| sum + (picture.favorites ? picture.favorites.count : 0)}
  end
end
