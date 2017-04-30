module ApplicationHelper

  # gets the url for the user's gravatar(i.e. globally recognized avatar)
  def profile_pic_url(user)
    # ensure valid ID using MD5 encoding
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
  end
end
