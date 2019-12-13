class PartyController < ApplicationController

    def index
        parties = Party.all
        render json: Party.to_json(parties_serializer)
    end

    def show
        render json: Party.find(params['id']).to_json(parties_serializer)
    end 
 
    def create
        new_party = Party.create(parties_params)
        render json: new_party
    end

    def destroy
        render json: Party.find(params['id']).destroy
    end

    def update
        party = Party.find(params['id']).update(parties_params)
        render json: party
    end


    private

    def parties_params
        params.require(:party).permit(:party_id, :ingredients => [])
    end

    def parties_serializer
        {
            :only => [:party_id, :ingredients => []]

            
        }
    end


end
