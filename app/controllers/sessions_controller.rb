class SessionsController < ApplicationController

    def new
        if current_user
            redirect_to tasks_path
        end
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        @user = @user.try(:authenticate, params[:user][:password])
        return redirect_to login_path unless @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        
    end

    def destroy
        session.delete :user_id
        #or "session[:user_id] = nil"
        redirect_to login_path
    end

end