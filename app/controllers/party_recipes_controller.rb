class PartyRecipesController < ApplicationController
    skip_before_action :authorized
        
    def index
        party_recipes = PartyRecipe.all
        render json: party_recipes.to_json(party_recipes_serializer)
    end

    def show
        render json: PartyRecipe.find(params['id']).to_json(party_recipes_serializer)
    end 

    def create
        new_party_recipe = PartyRecipe.create(party_recipes_params)    
        render json: new_party_recipe
    end

    def destroy
        render json: PartyRecipe.find(params['id']).destroy
    end

    def update
        party_recipe = PartyRecipe.find(params['id']).update(party_recipes_params)
        render json: party_recipe
    end


    private

    def party_recipes_params
        params.require(:party_recipe).permit(:party_id, :recipe_id )
    end

    def party_recipes_serializer
        {
            :only => [:party_id, :recipe_id],
                :include => {:recipe => {}}


            
        }
    end

end
