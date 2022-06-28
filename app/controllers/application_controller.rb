class ApplicationController < ActionController::Base
  include SessionsHelper
  
  
  
  private
    # ログインしていない場合にログインページに飛ぶやつ。今回はいらないかも
    def logged_in_user 
      unless logged_in?
        redirect_to login_url
      end
    end
end
