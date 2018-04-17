class V1::UsersController < ApplicationController

    before_action :is_authenticate_user?

    def index
        users = User.all 
        if !users.blank? 
            render json:  {:message => "Called Successfully", :data => users, :code => 200}, status: :ok
        else 
            render json:  {:message => "Unprocessable", :data => ['NO DATA FOUND'] , :code => 400}, status: :bad_request
        end
    end

    def create
        user = User.new(user_param)
        if user.save 
            render json:  {:message => "Created Successfully", :data => user , :code => 200}, status: :ok
        else 
            render json:  {:message => "Unprocessable", :data => [] , :code => 400}, status: :bad_request
        end
    end

    def destroy
        if User.destroy_all 
            render json:  {:message => "Deleted Successfully", :data => [] , :code => 200}, status: :ok
        else 
            render json:  {:message => "Unprocessable", :code => 400}, status: :bad_request
        end      
    end
    
    private 

    def user_param
        params.require(:user)
              .permit(
                        :name ,
                        :username , 
                        :email , 
                        {:address => [:street , :city , :suite , :zipcode , {:geo =>[:lng , :lat]}]},
                        :phone,
                        :website,
                        {:company => [:name , :catchPhrase , :bs]}
                      )
    end

    def is_authenticate_user?
        token = request.headers['token']
        puts "TOKEN = #{token}"
        return true if  Authentication.is_login? token
        render json: {:message => "Access Denied", :code => 400 , :data => []}
        return
    end
end