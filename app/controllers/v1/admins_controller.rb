class V1::AdminsController < ApplicationController

    def login
        token = request.headers['token']
        admin = Authentication.login(token)
        if !admin.blank? 
            render json:  {:message => "Login Successfully", :data => token , :code => 200}, status: :ok
        else 
            render json:  {:message => "Unprocessable", :data => [] , :code => 400}, status: :bad_request
        end   
    end

    def create
        token = Authentication.create_random_token
        admin  = Admin.new
        admin.token = token
        if admin.save 
            render json:  {:message => "Created Successfully", :data => admin , :code => 200}, status: :ok
        else 
            render json:  {:message => "Unprocessable", :data => [] , :code => 400}, status: :bad_request
        end
    end

end
