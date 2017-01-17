class PagesController < ApplicationController

  def index
  end

  def portail
  end

  def estimations
    @estimations = Estimation.all
  end

  def plan
    @category = Category.all
    @site = Site.all
  end

  def avis
    @commande = Info.find(params[:id_comm]);
  end

  def update_avis
    if Info.find(params[:id_comm]).avis_ind == nil
      Info.find(params[:id_comm]).update avis_ind: 1, avis: params[:avis]
    end
    redirect_to "/index"
  end
end
