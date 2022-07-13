class SessionsController < ApplicationController
    def new
    end
    
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Logged in successfully"
        redirect_to user_path(user)
      else
        flash.now[:danger] = "There was something wrong with the login information"
        render 'new'
      end    
    end
    
    def destroy
      session[:user_id] = nil
      flash[:success] = "You have successfully logged out"
      # https://stackoverflow.com/questions/51993184/ruby-on-rails-delete-link-to-redirects-to-show-page
      redirect_to root_path, status: :see_other   
    end
  end