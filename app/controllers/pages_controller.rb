class PagesController < ApplicationController

  def index
  end

  def portail
  end

  def estimations
    @estimations = Estimation.all
  end

end
