class SessionsController < ApplicationController

  def new
  end

  def create
    # If the user exists AND the email/password entered is correct.
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to root_path
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to new_session_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_url
  end
end
