class UserIngredientsController < ApplicationController
    skip_before_action :authorized
        
    def index
        user_ingredients = UserIngredient.all
        render json: user_ingredients.to_json(user_ingredients_serializer)
    end

    def show
        render json: UserIngredient.find(params['id']).to_json(user_ingredients_serializer)
    end 

    def create
        
       new_user_ingredient = user_ingredients_params['ingredient_id'].map do |id|
        new_user_ingredient = UserIngredient.create(user_id: user_ingredients_params['user_id'], ingredient_id: id)
       
       end

    
        render json: new_user_ingredient
    end

    def destroy
        render json: UserIngredient.find(params['id']).destroy
    end

    def update
        user_ingredient = UserIngredient.find(params['id']).update(user_ingredients_params)
        render json: user_ingredient
    end


    private

    def user_ingredients_params
        params.require(:user_ingredient).permit(:user_id, {:ingredient_id => []})
    end

    def user_ingredients_serializer
        {
            :only => [:id, :ingredient_id, :user_id],

            :include => {:user => {
                :except => [:updated_at, :created_at]
            }}

            
        }
    end

end
