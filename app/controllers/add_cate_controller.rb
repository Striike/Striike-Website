class AddCateController < ApplicationController
  DIRECKIT_URL  = "https://sandbox-api.lemonway.fr/mb/demo/dev/directkitjson2/Service.asmx"
  LOGIN       = "riadh.meghenem@epitech.eu"
  PASSWORD    = "riadh.meghenem@epitech.eu"
  LANGUAGE    = "fr"
  IS_SANDBOX    = true

  def index
    @current_user = session[:user_id]
    if (@current_user != 4 && @current_user != 3)
      redirect_to "/admin"
    end
    @pro = Pro.all
    @users = Info.all
    @category = Category.all
    @site = Site.all
  end

  def show_commande
    @current_user = session[:user_id]
    if (@current_user != 4 && @current_user != 3)
      redirect_to "/admin"
    end
    @pro = Pro.all
    @users = Info.all
  end


  def create_sites
    Site.create title: params[:title], link: params[:link] ,image: params[:image], min_price: params[:min_price],
    max_price: params[:max_price], time: params[:time], def: params[:def], category_id: params[:category_id]
    redirect_to "/admin/add"
  end

  def create_cat
    Category.create name: params[:name], sub_id: params[:sub_id]
    redirect_to "/admin/add"
  end

  def delete_item
    Category.find(params[:sub_id]).destroy
    redirect_to "/admin/add"
  end

  def delete_site
    Site.find(params[:sub_id]).destroy
    redirect_to "/admin/add"
  end

  def edit_site
    @current_user = session[:user_id]
    if (@current_user != 4 && @current_user != 3)
      redirect_to "/admin"
    end
    @category = Category.all
    @site = Site.find(params[:id])
  end

  def edit_cate
    @current_user = session[:user_id]
    if (@current_user != 4 && @current_user != 3)
      redirect_to "/admin"
    end
    @category = Category.find(params[:id])
    @cate = Category.all
  end

  def update_site
    Site.find(params[:id]).update title: params[:title], link: params[:link] ,image: params[:image], min_price: params[:min_price],
    max_price: params[:max_price], time: params[:time], def: params[:def], category_id: params[:category_id]
    redirect_to "/admin/add"
  end

  def update_cate
    Category.find(params[:id]).update name: params[:name], sub_id: params[:sub_id]
    redirect_to "/admin/add"
  end

  def edit_comm
    @current_user = session[:user_id]
    if (@current_user != 4 && @current_user != 3)
      redirect_to "/admin"
    end
    @info = Info.find(params[:id])
  end

  def stp2(id)
    Step2.step2(id).deliver
    redirect_to "/admin"
  end

  def update_comm
    @current_user = session[:user_id]
    if (@current_user != 4 && @current_user != 3)
      redirect_to "/admin"
    end
    if (Info.find(params[:id]).state == "Nouveau")
      Info.find(params[:id]).update id_pro: params[:pro].to_i, state: "En cours"
      stp2(params[:id])
    end
  end

  def delete_com
    Info.find(params[:id]).destroy
    redirect_to "/admin"
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

def SendPayment(params)
    sendRequest("SendPayment", "1.1", params)
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

def check_out
  Info.find(params[:id]).update total: params[:total]

  @reqSendPayment = { :debitWallet => Info.find(params[:id]).mail,
                        :creditWallet => "SC",
                        :amount => (Info.find(params[:id]).total).to_s + ".00"
      }
  @rawSendPayment = SendPayment(@reqSendPayment)
  @resultSendPayment = handleResponse(@rawSendPayment, "TRANS_SENDPAYMENT")
  flash[:test] = @resultSendPayment
  if (@resultSendPayment == nil)
    Info.find(params[:id]).update state: "Terminé"
    redirect_to "/index"
  else
    redirect_to :back
  end
end

def pro
    @pro = Pro.all
end
end
