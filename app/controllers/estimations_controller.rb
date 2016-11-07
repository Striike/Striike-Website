class EstimationsController < ApplicationController
  def index
    @estimations = Estimation.all
  end
end
