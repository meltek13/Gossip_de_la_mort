module SessionsHelper

    def current_user
        User.find_by(id: session[:user_id])
    end

    def log_in
       session[:user_id] = user.id
    end
    

end
