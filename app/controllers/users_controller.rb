class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:new, :create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def edit
    end

    def show
    end

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.with(user: @user).confirm_account.deliver_later
            # Handle successful signup
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Sign up successful!"
        else
            # Handle failed signup
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user), notice: "User updated successfully!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil if @user == current_user
        @user.destroy
        redirect_to users_path, notice: "User deleted successfully!"
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
