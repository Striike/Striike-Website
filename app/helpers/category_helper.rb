module CategoryHelper

  def check_shared_cat(target, id)
    if (id == nil)
      return false
    end
    @name = Category.find(id).name
    if ((target == "PLOMBERIE" || target == "CHAUFFAGE") && @name == "CHAUFFAGE/PLOMBERIE")
      return true
    end
    if ((target == "ÉLECTRICITÉ" || target == "CHAUFFAGE") && @name == "CHAUFFAGE/ÉLECTRICITÉ")
      return true
    else
      return false
    end
  end

  def check_shared(target, id)
    @current_cat = Category.find(id).name
    if ((target == "PLOMBERIE" || target == "CHAUFFAGE") && @current_cat == "CHAUFFAGE/PLOMBERIE")
      return true
    end
    if ((target == "ÉLECTRICITÉ" || target == "CHAUFFAGE") && @current_cat == "CHAUFFAGE/ÉLECTRICITÉ")
      return true
    else
      return false
    end
  end

end
