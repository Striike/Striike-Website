class SitesController < ApplicationController
  def index
  end

  def estimations
    @page = Site.find(params[:id])
  end

  def commande
    @page = Site.find(params[:id])
  end

  def create
    Info.create addresse: params[:adresse],
                code_p: params[:postal],
                inter_digi: params[:etage],
                prenom: params[:prenom],
                nom: params[:nom],
                mail: params[:mail],
                tel: params[:tel]
    redirect_to "/index"
  end
end
