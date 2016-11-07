require 'bcrypt'

class UserController < ApplicationController
  def home
  end

  def login
  end

  def check
    @current_user = User.where(name: params[:name]).first
    @my_pass = BCrypt::Password.new(@current_user.password_digest)
    if (@my_pass == params[:password])
      redirect_to "/admin/add"
    else
      redirect_to "/admin"
  end
end
end
