# coding: utf-8
class SitesController < ApplicationController
    DIRECKIT_URL  = "https://sandbox-api.lemonway.fr/mb/demo/dev/directkitjson2/Service.asmx"
    LOGIN       = "riadh.meghenem@epitech.eu"
    PASSWORD    = "riadh.meghenem@epitech.eu"
    LANGUAGE    = "fr"
    IS_SANDBOX    = true
  def index
  end

  def estimations
    @page = Site.find(params[:id])
    session[:id_proud] = params[:id]
  end

  def commande
    @page = Site.find(params[:id])
  end

def check_precode(code)
  allCommande = Info.all

  if code.length == 0
    return true
  end
  allCommande.each do |comm|
    if comm.code_promo == code
      Info.find(comm.id).update code_promo: nil
      return true
    end
  end
  flash[:test] = "Bad promo code!"
  return false
end

  def check_promo_code(code)
    allCommande = Info.all

    if code.length == 0
      return false
    end
    return true
  end

  def create_wallt
    @reqRegisterPayerWallet = {
      :wallet       => params[:mail],
      :clientMail     => params[:mail],
      :clientFirstName  => params[:prenom],
      :clientLastName   => params[:nom],
      :wallet_ip => request.remote_ip
    }
    @rawRegisterPayerWallet = registerWallet(@reqRegisterPayerWallet)
    @resultRegisterPayerWallet  = handleResponse(@rawRegisterPayerWallet, "WALLET")
    flash[:test] = @resultRegisterPayerWallet
    if (@resultRegisterPayerWallet == nil && params[:adresse].length > 5 && params[:postal].length == 5 && only_letters(params[:prenom]) == 0 && params[:prenom].length > 2 && only_letters(params[:nom]) == 0 && params[:nom].length > 2 && only_numbers(params[:tel]) == 0 && params[:tel].length == 10 && params[:mail].length > 8 && check_precode(params[:promo]))
      create()
      session[:id_client] = Info.last.id
      redirect_to "/commande/payement"
    else
      flash[:success] = "Mauvaise informations"
      redirect_to :back
    end
  end

  def payement
    @products = Site.find(session[:id_proud])
  end

  def get_products_price(id_prod, id_comm)
    @commande = Info.find(id_comm)
    @prod = Site.find(id_prod)

    if (@commande.promo == 0)
      return @prod.max_price
    else
      @new_price = @prod.max_price - ((5 * @prod.max_price) / 100)
    end
  end

  def validate
    @products = Site.find(session[:id_proud])
    @date = params[:month] + "/" + params[:year]
    @reqMoney_in =
      {
      :wallet => session[:mail],
      :cardType => params[:card_type],
      :cardNumber => params[:card_number],
      :amountTot => (get_products_price(@products.id, session[:id_client])).to_s + ".00",
      :cardCrypto => params[:crypto],
      :cardDate => @date
    }
    @rawMoney_in = Money_in(@reqMoney_in)
    @resultMoney_in = handleResponse(@rawMoney_in, "TRANS")
    flash[:test] = @resultMoney_in
    if (@resultMoney_in == nil)
      redirect_to "/send/mail/#{session[:id_client]}"
    else
      redirect_to :back
    end
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
    if check_promo_code(params[:promo])
      value = 1
    else
      value = 0
    end

    Info.create addresse: params[:adresse],
                  code_p: params[:postal],
                  inter_digi: params[:etage],
                  prenom: params[:prenom],
                  nom: params[:nom],
                  mail: params[:mail],
                  tel: params[:tel],
                  id_prod: params[:id_prod],
                  state: "Nouveau",
                  code_promo: SecureRandom.hex(3),
                  promo: value
      session[:mail] = params[:mail]
end

def unwrap(response)
  response["d"]
end
    def handleResponse(response, key)
      @response = unwrap(response)
      if (@response["E"] == nil)
        return nil
      else
        return (@response["E"]["Msg"])
      end
    end
    def sendRequest(method, version, params)
      uri = URI.parse(DIRECKIT_URL + "/" + method)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      if IS_SANDBOX
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      req = Net::HTTP::Post.new(uri)
      req.add_field('Content-Type', 'application/json; charset=utf-8')
      common_params = {
        :wlLogin  => LOGIN,
        :wlPass   => PASSWORD,
        :language   => LANGUAGE,
        :version  => version,
        :walletIp   => request.remote_ip,
        :walletUa   => request.user_agent
      }
      params = common_params.merge(params)
      req.body = { :p => params }.to_json
      JSON.parse(http.request(req).body)
    end
  def Money_in(params)
      sendRequest("MoneyIn", "1.1", params)
  end
  def registerWallet(params)
      sendRequest("RegisterWallet", "1.1", params)
  end
end
