class UsersController < ApplicationController
    
    def index
        @users = User.all
    end

    def show
        @users = User.find(params[:id])
    end

    def new
        @users = User.new
    end

    def create
        
        @users = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], password: params[:password], city_id: params[:city])

     if @users.save
       flash[:notice] = "bienvenue"
       redirect_to gossips_path
     else
       puts "$" * 30
       puts "error message"
       puts "$" * 30
       render :new
     end
          
    end

    def destroy

    end

    
end
