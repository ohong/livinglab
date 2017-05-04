class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # control request for facebook login
  def facebook
    # first, try to get user from database
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      # if user exists, sign him in and display success msg
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      # redirect visitor to the sign up page
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
