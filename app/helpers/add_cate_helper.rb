module AddCateHelper
  def get_name_product(id)
    @list = Site.all
    @prod = @list.find(id)
    return @prod.title
  end

  def get_wallet_value(id)
    if id == nil
      return 0
    end
    @client = Lemonway::Client.new wsdl:  "https://sandbox-api.lemonway.fr/mb/maneo/dev/directkitxml/service.asmx?wsdl",
                              wl_login: "society",
                              wl_pass: "123456",
                              language: "fr",
                              version: "1.1",
                              wallet_ip: request.remote_ip
    @toto = @client.get_wallet_details email: id
    return (@toto[:bal])
  end

  def get_total(id)
    @user = Info.find(id)
    if @user.total == nil
      return 0
    else
      return @user.total
    end
  end

  def get_name_pro(id)
    if (id == nil || id == 0)
      return ("Vide")
    end
    return (Pro.find(id).nom + " " + Pro.find(id).prenom)
  end

  def nb_comm(str)
    @comm = Info.all
    i = 0

    @comm.each do |comm|
      if comm.state == str
        i = i + 1
      end
    end
    return (i)
  end

  def nb_pro(str)
    @pro = Pro.all
    i = 0

    @pro.each do |pro|
      if pro.state.to_s == str
        i = i + 1
      end
    end
    return (i)
  end

  def nb_pro_typ(str)
    @pro = Pro.all
    i = 0

    @pro.each do |pro|
      if pro.cate == str && pro.state.to_s == "1"
        i = i + 1
      end
    end
    return (i)
  end
end
