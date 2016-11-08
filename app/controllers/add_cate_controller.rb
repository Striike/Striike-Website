class AddCateController < ApplicationController
  def index
    @current_user = session[:user_id]
    if (@current_user != 4 && @current_user != 3)
      redirect_to "/admin"
    end
    @category = Category.all
    @site = Site.all
  end

  def create_sites
    Site.create title: params[:title], image: params[:image], min_price: params[:min_price],
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
    Site.find(params[:id]).update title: params[:title], image: params[:image], min_price: params[:min_price],
    max_price: params[:max_price], time: params[:time], def: params[:def], category_id: params[:category_id]
    redirect_to "/admin/add"
  end

  def update_cate
    Category.find(params[:id]).update name: params[:name], sub_id: params[:sub_id]
    redirect_to "/admin/add"
  end
end
