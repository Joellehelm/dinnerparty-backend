class PartyUsersController < ApplicationController
    skip_before_action :authorized
        
    def index
        party_users = PartyUser.all
        render json: party_users.to_json(party_users_serializer)
    end

    def show
        render json: PartyUser.find(params['id']).to_json(party_users_serializer)
    end 

    def create
        new_party_users = params["party_user"].map do |user|
            PartyUser.create(party_id: params["party_id"], user_id: user['id'])
       end
        render json: new_party_users
    end

    def destroy
        render json: PartyUser.find(params['id']).destroy
    end

    def update
        party_user = PartyUser.find(params['id']).update(party_users_params)
        render json: party_user
    end

    def hosting
        hosted_parties = Party.all.select{ |party| party.host_id == current_user.id}
        render json: hosted_parties
    end

    def attending
        hosted_parties = Party.all.select{ |party| party.host_id == current_user.id}
        my_parties = current_user.party_users.map{|p| p.party}
        render json: my_parties.select{|p| hosted_parties}
    end

    private

    def party_users_params
        params.require(:party_user).permit(:party_id, :user_id => [])
    end

    def party_users_serializer
        {
            :only => [:id, :party_id, :user_id],

            :include => {:room => {}, :party => {
                :except => [:updated_at, :created_at]
            }}

            
        }
    end

end
