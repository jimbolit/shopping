class WelcomeController < ApplicationController
  def index
  end

  def categories
    @categories = Category.all
  end



end

