class RoomsController < ApplicationController
    skip_before_action :authorized
    def index
        rooms = Room.all
        render json: rooms
    end

    def create
        new_room = Room.create(room_params)
        render json: new_room
    end

    def show
        room = Room.find(params[:id])
        render json: room
    end

    private

    def room_params
        params.require(:room).permit(:party_id)
    end

    def room_serializer
        {
            :only => [:id, :party_id, :user_id],

            :include => {:users => {}, :messages => {
                
            }}
            
        }
    end
end
