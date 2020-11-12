class WelcomeController < ApplicationController
  def index
  end

  def categories
    @categories = categories_table.to_a

  end

end
