class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:login , :create]

    def login
    end

    def create
        @user = User.find_by(email: params[:session][:email])

        if @user.present? && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Login successfully"
        else
            redirect_to login_path, notice: "Invalid email or password"
        end
    end

    def destroy 
        session[:user_id] = nil 
        redirect_to login_path, notice: "Logout successfully" 
    end

end
