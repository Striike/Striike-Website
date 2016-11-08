require 'bcrypt'

class UserController < ApplicationController
  def home
  end

  def login
    if (session[:user_id] == 4 || session[:user_id] == 3)
      redirect_to "/admin/add"
    end
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def delog
    if session[:user_id] != nil
      session[:user_id] = nil
    end
    redirect_to "/admin"
  end

  def check
    @current_user = User.where(name: params[:name]).first
    if(@current_user)
      @my_pass = BCrypt::Password.new(@current_user.password_digest)
      if (@my_pass == params[:password])
        session[:user_id] = @current_user.id
        flash[:info] = "You are loged"
        redirect_to "/admin/add"
      else
        session[:user_id] = nil
        flash[:info] = "Fail !"
        redirect_to "/admin"
      end
    else
      redirect_to "/admin"
    end
  end
end
