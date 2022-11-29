class SessionsController < ApplicationController


    # Create a Sessions controller with a create action for logging in that responds to a POST /login request, and a destroy action for logging out that responds to a DELETE /logout request.

    # post "/login", to: "sessions#create"
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user, status: :created
        else
          render json: { error: "Invalid username or password" }, status: :unauthorized
        end
      end
      
    #   delete "/logout", to: "sessions#destroy"
      def destroy
        session.delete :user_id
        head :no_content
      end

end
