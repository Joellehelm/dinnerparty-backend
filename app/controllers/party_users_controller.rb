class PartyUsersController < ApplicationController
   
        
    def index
        party_users = PartyUser.all
        render json: party_users.to_json(party_users_serializer)
    end

    def show
        render json: PartyUser.find(params['id']).to_json(party_users_serializer)
    end 

    def create
        
       new_party_user = party_users_params['user_id'].map do |id|
        new_party_user = PartyUser.create(party_id: party_users_params['party_id'], user_id: id)
       
       end

    
        render json: new_party_user
    end

    def destroy
        render json: PartyUser.find(params['id']).destroy
    end

    def update
        party_user = PartyUser.find(params['id']).update(party_users_params)
        render json: party_user
    end


    private

    def party_users_params
        params.require(:party_user).permit(:party_id, {:user_id => []})
    end

    def party_users_serializer
        {
            :only => [:id, :party_id, :user_id],

            :include => {:party => {
                :except => [:updated_at, :created_at]
            }}

            
        }
    end

end
