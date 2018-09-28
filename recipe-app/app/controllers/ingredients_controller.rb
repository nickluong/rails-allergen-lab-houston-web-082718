class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @i = Ingredient.find(params[:id])
  end

end
