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
    @client = Lemonway::Client.new wsdl:  "https://sandbox-api.lemonway.fr/mb/demo/dev/directkitxml/service.asmx?wsdl",
                              wl_login: "riadh.meghenem@epitech.eu",
                              wl_pass: "riadh.meghenem@epitech.eu",
                              language: "fr",
                              version: "1.1",
                              wallet_ip: "127.0.0.1"
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
end
