module SitesHelper
  def get_products_price(id_prod, id_comm)
    @commande = Info.find(id_comm)
    @prod = Site.find(id_prod)

    if (@commande.promo == 0)
      return @prod.max_price
    else
      @new_price = @prod.max_price - ((5 * @prod.max_price) / 100)
    end
  end
  
  def remplace_it(string)
    i = 0
    str = string
    while (i < str.length)
      if (str[i] == ' ' || str[i] == '\'')
        str[i] = '_'
      end
      i = i + 1
    end
    return (str)
  end

end
