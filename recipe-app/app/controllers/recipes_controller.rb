class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.sort_by{|r| r.ingredients.size}.reverse
  end

  def show 
    @r = Recipe.find(params[:id])
  end 

  def new
    @ingredients = Ingredient.all
    @new_recipe = Recipe.new
  end

  def create 
    byebug
    r = Recipe.new(recipe_params)
    if r.valid?
      params[:recipe][:ingredients].each do|i|
        RecipeIngredient.create(recipe:r, ingredient: Ingredient.find(i))
      end 
      r.save
      redirect_to r
    else
      flash[:errors] = r.errors.full_message
      render :new
    end 
  end 

  def destroy 
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end 

  private 

  def recipe_params 
    params.require(:recipe).permit(:name, :user_id)
  end
end
