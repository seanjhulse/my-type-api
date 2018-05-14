class UsersController < ApplicationController
    include Response
    include ExceptionHandler
    
    before_action :set_user, except: [:index, :new, :create]
    
    def index
        @users = User.all
        json_response(@users, :ok, :photos)
    end
    def new
        @user = User.new
        json_response(@user)
    end
    def create
        @user = User.new(user_params)
        @user.save
        json_response(@user)
    end
    def show
        json_response(@user, :ok, :photos)
    end
    def edit
        json_response(@user)
    end
    def update
        json_response(@user)
    end
    def destroy
        @user.destroy
        json_response(@user)
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :age, :biography, :face)
    end
end
