class MessagesController < ApplicationController
    
    def index
        messages = Message.all
        render json: messages.to_json(message_serializer)
    end

    def create
        message = Message.new(message_params)
        room = Room.find(params["room_id"])
        
        if message.save
         
        # this gives back the user and not just the id, why is only the id being broadcasted for messages
        # puts "================================================="
        # something = room.messages
        # puts room.messages[-1].user.username
        # puts "=================================================="
        
            RoomsChannel.broadcast_to(room,{
                room: room,
                users: room.users,
                messages: room.messages
            })
        end
  
      
        render json: message.to_json(message_serializer)
    end

    private

    def message_params
        params.require(:message).permit(:content, :user_id, :room_id)
    end

    def message_serializer
        {
            :only => [:id, :content, :room],
                :include => {:user => {:except => [:email, :password]}, :room => {}}
            
        }
    end
end

{
    :only => [:id, :party_id, :user_id],

    :include => {:room => {}, :party => {
        :except => [:updated_at, :created_at]
    }}

    
}