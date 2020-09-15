class MessagesController < ApplicationController
    
    def index
        messages = Message.all
        render json: messages.to_json(message_serializer)
    end

    def create
        message = Message.new(message_params)
        room = Room.find(params["room_id"])
        
        if message.save
                 
    
            render json: message.to_json(message_serializer)
        end
  
      
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

