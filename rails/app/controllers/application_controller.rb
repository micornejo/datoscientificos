# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def current_user=(user)
    @current_user = user
  end

  def current_user
    if session[:user_id]
      begin
        @current_user ||= User.find(session[:user_id])
      rescue
        session[:user_id] = nil
        @current_user = nil
      end
    else
      @current_user = nil
    end
  end

  def admin?
    current_user and current_user.admin?
  end

  def logged
    unless current_user
      flash[:error] = "unauthorized access"
      redirect_to '/'
      false
    end
  end

  def authorize
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to '/'
      false
    end
  end

  helper_method :current_user
  helper_method :admin?
end
