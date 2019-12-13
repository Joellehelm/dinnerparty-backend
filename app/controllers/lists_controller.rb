class ListsController < ApplicationController


    def index
        lists = List.all
        render json: List.to_json(lists_serializer)
    end

    def show
        render json: List.find(params['id']).to_json(lists_serializer)
    end 

    def create
        new_list = List.create(lists_params)
        render json: new_list
    end

    def destroy
        render json: List.find(params['id']).destroy
    end

    def update
        list = List.find(params['id']).update(lists_params)
        render json: list
    end


    private

    def lists_params
        params.require(:list).permit(:party_id, :ingredients => [])
    end

    def lists_serializer
        {
            :only => [:party_id, :ingredients => []]

            
        }
    end

end
