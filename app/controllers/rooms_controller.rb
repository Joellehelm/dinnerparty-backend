class RoomsController < ApplicationController

    def index
        rooms = Room.all
        render json: rooms.to_json(room_serializer)
    end

    def create
        new_room = Room.create(room_params)
        render json: new_room.to_json(room_serializer)
    end

    def show
        # room = Room.find(params[:id])
        # render json: room
        render json: Room.find(params['id']).to_json(room_serializer)
    end

    

    private

    def room_params
        params.require(:room).permit(:party_id)
    end

    def room_serializer
        # {
        #     :only => [:id, :party_id, :user_id],

        #     :include => {:users => {
        #         :only => [:id, :username]
        #     }, :messages => {:user => { :only => [:id, :username]}}}
            
        # }
        {
                        :only => [:id, :party_id, :user_id],
            
                        :include => {:users => { :only => [:id, :username]}, :messages => { :include => {:user => {:only => [:id, :username]}}}}
                        
                    }
    end
end


# class RoomsController < ApplicationController
#     skip_before_action :authorized
#     def index
#         rooms = Room.all
#         render json: RoomSerializer.new(rooms)
#     end

#     def show
#         room = Room.find(params[:id])
#     #  might need to render json: RoomSerializer.new(room) 
#         render json: room
#     end

#     def create
#         new_room = Room.create(room_params)
#         render json: new_room
#     end

#     private

#     def room_params
#         params.require(:room).permit(:party_id)
#     end

#       def room_serializer
#         {
#             :only => [:id, :party_id, :user_id],

#             :include => {:users => {}, :messages => {}}
            
#         }
#     end
# end