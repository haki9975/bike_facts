class ApplicationController < ActionController::Base
    include ApplicationHelper
    # before_action :redirect_if_not_logged_in

    private
    def redirect_if_not_logged_in
        puts "hello"
       # binding.irb
         if !logged_in?
            redirect_to login_path
         end
    end
end
