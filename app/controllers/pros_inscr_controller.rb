class ProsInscrController < ApplicationController
  def inscription

  end

  def validate
    Pro.create nom: params[:nom], prenom: params[:prenom], mail: params[:mail],
    postal_code: params[:postal], telephone: params[:tel], nom_entreprise: params[:nom_ent],
    statut_juridique: params[:statut], cate: params[:competence], interv_dep: params[:zone],
    state: '0'
    redirect_to "/index"
  end
end
