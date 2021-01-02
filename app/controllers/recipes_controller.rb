class RecipesController < ApplicationController
  def index
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image).merge(user_id: current_user_id)
  end
end
