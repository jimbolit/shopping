class CategoriesController < ApplicationController

    def create
        @category = Category.new(params[:category])
        @category.save
        redirect_to @category
    end

end

