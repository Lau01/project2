# Authorize the incoming connection and establish a channel to a given user
# Code from: https://guides.rubyonrails.org/action_cable_overview.html

module ApplicationCable
  class Connection < ActionCable::Connection::Base

  # A connection identifier that can be used to find the specific connection later
  identified_by :current_user

   def connect
     self.current_user = find_verified_user
   end

   private

   # Find the current user using the signed cookie set-up in
   # app/controllers/session_controller.rb, if the user is
   # unauthorized, reject the connection
   def find_verified_user
     if verified_user = User.find_by(id: cookies.signed[:user_id])
       verified_user
     else
       reject_unauthorized_connection
     end
   end

  end
end
