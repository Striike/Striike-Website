# -*- coding: utf-8 -*-
module SampleEmailHelper

  def get_code(id)
    @user = Info.all
    return (@user.find(id).code_p)
  end

  def get_addr(id)
    @user = Info.all
    return (@user.find(id).addresse)
  end

  def get_full_name(id)
    @user = Info.all
    return (@user.find(id).prenom + " " + @user.find(id).nom)
  end

  def get_name(id)
    @user = Info.all
    return (@user.find(id).prenom)
  end

  def get_name_prod(id)
    @user = Info.find(id)
    @site = Site.find(@user.id_prod)
    return (@site.title)
  end

  def get_max_price(id)
    @user = Info.find(id)
    @site = Site.find(@user.id_prod)
    return (@site.max_price)
  end

  def get_price(id)
    @user = Info.find(id)
    @site = Site.find(@user.id_prod)
    if @user.promo == 0
      return ("entre #{@site.min_price}€ et #{@site.max_price}€")
    else
      @new_price =  @site.max_price - ((@site.max_price * 5) / 100)
      return ("entre #{@site.min_price}€ et #{@new_price}€")
    end
  end

  def get_time(id)
    @user = Info.find(id)
    @site = Site.find(@user.id_prod)
    return(@site.time)
  end

  def get_info(id)
    @user = Info.find(id)
  end

  def find_name_pro(id)
    @user = Info.find(id)
    @pro = Pro.find(@user.id_pro)
    return (@pro.nom + " " + @pro.prenom)
  end

  def get_phone_number(id)
    @user = Info.find(id)
    @pro = Pro.find(@user.id_pro)
    return (@pro.telephone)
  end

  def get_code_promo(id)
    @user = Info.all
    return (@user.find(id).code_promo)
  end
end
