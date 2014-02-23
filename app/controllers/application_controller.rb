class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :set_time
  before_filter :load_user
  before_filter :create_admin 
  protect_from_forgery


  protected
    
    def create_admin
        if User.all.count == 0
          User.create!(:name => "Admin", :password => "Admin", :password_confirmation => "Admin", :email => "rubyonrailsapp2014@gmail.com", :role => "admin_apsolute")
        end
    end
    
    def set_time
      Time.zone='Sarajevo'
    end
    
    def load_user
      if session[:user_id]
        @current_user = User.find(session[:user_id])
      end
    end

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end
end
