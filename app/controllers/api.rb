class API < Sinatra::Base

    set :views, "app/views"
    get "/" do
        
        erb :homepage
    end
    
    get "/create_user" do
        
        erb :user
    end

    post "/create_user" do

        @user = User.find_or_create_by(user_name: params[:user_name])
        redirect "/order/#{@user.id}"
    end

    get "/order/:id" do
        @user = User.find(params[:id])
        erb :order
    end

    post "/order/:id" do
        user = User.find(params[:id])
        Food.create(name: params[:order], user_id: user.id)
        redirect "/order/#{user.id}"
    end

    get "/order/:id/checkout" do
        @user = User.find(params[:id])
        
        erb :checkout
    end

end