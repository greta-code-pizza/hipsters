class DashboardController < ApplicationController
    before_action :require_logged_in_admin
 def index
    @users_count = User.all.count
 end
end