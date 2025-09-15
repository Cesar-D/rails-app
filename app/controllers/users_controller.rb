class UsersController < ApplicationController

    def new
        
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # Handle successful signup
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Sign up successful!"
        else
            # Handle failed signup
            render :new, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:session).permit(:email, :password, :password_confirmation)
    end
end
