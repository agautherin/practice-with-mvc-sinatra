class API < Sinatra::Base


    get "/home" do
        
        erb :homepage
    end

end