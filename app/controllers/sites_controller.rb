# coding: utf-8
class SitesController < ApplicationController
  def index
  end

  def estimations
    @page = Site.find(params[:id])
    session[:id_proud] = params[:id]
  end

  def commande
    @page = Site.find(params[:id])
  end

  def create_wallt
    @client = Lemonway::Client.new wsdl:  "https://sandbox-api.lemonway.fr/mb/demo/dev/directkitxml/service.asmx?wsdl",
                              wl_login: "riadh.meghenem@epitech.eu",
                              wl_pass: "riadh.meghenem@epitech.eu",
                              language: "fr",
                              version: "1.1",
                              wallet_ip: request.remote_ip

    @client.register_wallet wallet: params[:mail], client_mail: params[:mail],
      client_first_name: params[:prenom], client_last_name: params[:nom],
      wallet_ip: request.remote_ip
    session[:id_client] = Info.last.id
    redirect_to "/commande/payement"
  end

  def payement
    @products = Site.find(session[:id_proud])
  end

  def validate
    @products = Site.find(session[:id_proud])
    @date = params[:month] + "/" + params[:year]
    @client = Lemonway::Client.new wsdl:  "https://sandbox-api.lemonway.fr/mb/demo/dev/directkitxml/service.asmx?wsdl",
                              wl_login: "riadh.meghenem@epitech.eu",
                              wl_pass: "riadh.meghenem@epitech.eu",
                              language: "fr",
                              version: "1.1",
                              wallet_ip: request.remote_ip
    @client.money_in wallet: session[:mail], card_type: params[:card_type],
                             card_number: params[:card_number], amount_tot: @products.max_price,
                             card_crypto: params[:crypto], card_date: @date
    redirect_to "/send/mail/#{session[:id_client]}"
  end

  def only_letters(string)
    i = 0
    while (i < string.length)
      if ((string[i].ord < 65 || string[i].ord > 90) && (string[i].ord < 97 || string[i].ord > 122))
        return (1)
      end
      i = i + 1
    end
    return (0)
  end

  def only_numbers(string)
    i = 0
    while (i < string.length)
      if (string[i].ord < 48 || string[i].ord > 57)
        return (1)
      end
      i = i + 1
    end
    return (0)
  end

  def create
    if (params[:adresse].length > 5 && params[:postal].length == 5 && only_letters(params[:prenom]) == 0 && params[:prenom].length > 2 && only_letters(params[:nom]) == 0 && params[:nom].length > 2 && only_numbers(params[:tel]) == 0 && params[:tel].length == 10 && params[:mail].length > 8)
      Info.create addresse: params[:adresse],
                  code_p: params[:postal],
                  inter_digi: params[:etage],
                  prenom: params[:prenom],
                  nom: params[:nom],
                  mail: params[:mail],
                  tel: params[:tel],
                  id_prod: params[:id_prod],
                  state: "Nouveau"
      session[:mail] = params[:mail]
      create_wallt()
    else
      flash[:success] = "Mauvaise informations"
      redirect_to :back
    end
  end
end
