class ErrorsController < ApplicationController
  def error404
    render status: :not_found, :layout => false
  end
end
