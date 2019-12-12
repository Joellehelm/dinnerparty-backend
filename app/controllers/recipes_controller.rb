class RecipesController < ApplicationController
    # skip_before_action :authorized

    def index
        recipes = recipe.all
        render json: Recipes.to_json(recipes_serializer)
    end

    def show
        render json: Recipe.find(params['id']).to_json(recipes_serializer)
    end 

    def create
        new_recipe = Recipe.create(recipes_params)
        render json: new_recipe
    end

    def destroy
        render json: Recipe.find(params['id']).destroy
    end

    def update
        recipe = Recipe.find(params['id']).update(recipes_params)
        render json: recipe
    end


    private

    def recipes_params
        params.require(:recipe).permit(:name, :api_id, :image, :image_urls, :servings, :time, :cuisine)
    end

    def recipes_serializer
        {
            :only => [:name, :api_id, :image, :image_urls => [], :servings, :time, :cuisine]

            
        }
    end
end