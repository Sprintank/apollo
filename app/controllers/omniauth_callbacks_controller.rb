class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def soundcloud
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = "Signed in!"
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:alert] = "Error logging in"
      redirect_to '/'
    end
  end
end
