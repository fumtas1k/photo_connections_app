module UsersHelper
  def get_user_image_url(user)
    if user.image && user.image.url
      user.image.url
    else
      "dummy_user.jpg"
    end
  end
end
