class CategoryController < ApplicationController
  def index
  end

  def show
    @category = Category.all
    @category.each do |target|
      if (target.name == params[:name])
        @find = target.id
      end
    end
    @site = Site.all
  end
end
