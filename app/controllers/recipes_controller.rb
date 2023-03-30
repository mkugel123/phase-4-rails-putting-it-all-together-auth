class RecipesController < ApplicationController
  before_action :authorize

  def index
    recipes = Recipe.all
    render json: recipes, status: :created
  end

  def create
    recipe = Recipe.create!(recipe_params)
    render json: recipe, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete).merge(user_id: session[:user_id])
  end
end
