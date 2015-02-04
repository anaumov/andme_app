class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twenty_three_and_me
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      #get user email and save
      #
      #
      redirect_to new_user_registration_url
    end
  end
end