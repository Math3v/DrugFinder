class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_name(params[:session][:name].downcase)
    if user
       sign_in user
       redirect_to root_url
       # Sign in and redirect to the users show page
    else
       flash[:error] = 'Nezname prihlasovacie meno'
       render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
    !current_user.nil?
  end

end
