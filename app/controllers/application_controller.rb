class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :grade7
    before_action :login_required

    private
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
        redirect_to login_url unless current_user
    end

    def grade7(post_class)
        grade = post_class.grade
        created = post_class.created_at.financial_year
        grade += (Date.today.financial_year + 1 - created)
    end

    
end
