class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @recipe.user_id
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.valid?
      redirect_to recipe_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @recipe.user_id
      @recipe.destroy
      if @recipe.destroy
        redirect_to root_path
      else
        render :show
      end
    else
      render :show
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :name, :person_id, :material, :step1, :step2, :step3,
                                   :step4).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
