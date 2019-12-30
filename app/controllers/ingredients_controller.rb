class IngredientsController < ApplicationController
    

    def index
        ingredients = Ingredient.all
        render json: ingredients.to_json(ingredients_serializer)
    end

    def show
        render json: Ingredient.find(params['id']).to_json(ingredients_serializer)
    end 

    def create
      
        new_ingredient = ingredients_params['ingredients'].each do |item|
        

        new_ingredient = Ingredient.create(recipe_id: ingredients_params['recipe_id'], name: item, party_id: ingredients_params['party_id'])
        end
        render json: new_ingredient
     
    end

    def destroy
        render json: Ingredient.find(params['id']).destroy
    end

    def update
        ingredient = Ingredient.find(params['id']).update(ingredients_params)
        render json: ingredient
    end


    private

    def ingredients_params
        params.require(:ingredient).permit(:id, :name, :ingredient, :recipe_id, :party_id, :ingredients => [])
    end

    def ingredients_serializer
        {
            :only => [:id, :name, :recipe_id, :party_id, :ingredients => []],

            :include => {:recipe => {}}

            
        }
    end

end
