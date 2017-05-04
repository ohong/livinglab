module ApplicationHelper

  # gets the url for the user's gravatar(i.e. globally recognized avatar)
  def profile_pic_url(user)
    # ensure valid ID using MD5 encoding
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    if user.image
      user.image # facebook profile pic > gravatar
    else
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    end
  end
end
